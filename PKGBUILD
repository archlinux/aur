# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

# Comment out if you want to build all language translations
export LG2=en

pkgname=i2p-dev
pkgver=0.9.43.0
pkgrel=1
pkgdesc="A distributed anonymous network (daily mtn->git sync)"
url="https://geti2p.net"
license=('GPL2')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
depends=('java-runtime>=13' 'java-service-wrapper' 'gmp')
makedepends=('java-environment>=13' 'apache-ant' 'git')
#optdepends=('gtk2: for rrd graphs')
conflicts=('i2p' 'i2p-bin')
provides=('i2p')
backup=('opt/i2p/wrapper.config')
install='i2p.install'
options=(!strip)

_gitname=i2p.i2p
_commit=master

#mirror: https://gitlab.com/I2P/i2p.i2p.git
source=("git+https://github.com/i2p/${_gitname}.git#commit=${_commit}"
        'i2prouter.service' 'i2p.tmpfiles' 'wrapper.config' 'router.config'
        'i2prouter.bash' 'i2prouter.sh')

sha256sums=('SKIP'
            '644b771ec7f5db3efab3206bf1f896566cdb00d410a54608fda85bdb4c2ad876'
            'df26da04c8415ac24ec73b0dd08d3459a8964553bb77e5da5ab9833b0a31d865'
            '5c57456bf3f364175d036dfc6c6ceea5e57cdda970407829c04d09a4c821a9c0'
            '4ee28e022dccaf99043aa2735f05b7270b8eccf040c67f7ef48e114b5ca6e971'
            '7a19b9f90c8792460fd58e8b8aa435a065e34d29a942479850472510e9d3078a'
            'b5f1a5bb354552acebe2857b9579410f7fd589f2f7d6b12fbbfe4127a2d33fd8')

pkgver() {
    cd "$_gitname"
    printf "%s.%s" "$(grep 'VERSION =' core/java/src/net/i2p/CoreVersion.java \
        |sed 's/.*= "//;s/";//')" "$(grep 'BUILD =' router/java/src/net/i2p/router/RouterVersion.java \
        |sed 's/.*= //;s/;//')"
}

build_jbigi() {
    msg "Building libjbigi..."
    cd "$srcdir/$_gitname/core/c/jbigi"
    CFLAGS+=" -fPIC -Wall"
    INCLUDES="-I./jbigi/include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,libjbigi.so"
    gcc -c $CFLAGS $INCLUDES jbigi/src/jbigi.c
    gcc $LDFLAGS $INCLUDES -o libjbigi.so jbigi.o -lgmp
    install -Dm644 libjbigi.so "$srcdir/$_gitname/pkg-temp/lib/libjbigi.so"
}

build_jcpuid() {
if [[ "$CARCH" != @(arm)* ]]; then
    msg "Building libjcpuid..."
    cd "$srcdir/$_gitname/core/c/jcpuid"
    INCLUDES="-I./include -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux"
    LDFLAGS="-shared -Wl,-O1,--sort-common,-z,relro,-soname,libjcpuid-${CARCH}-linux.so"
    gcc $CFLAGS $LDFLAGS $INCLUDES src/jcpuid.c -o libjcpuid-${CARCH}-linux.so
    install -Dm644 libjcpuid-${CARCH}-linux.so "$srcdir/$_gitname/pkg-temp/lib/libjcpuid.so"
fi
}

build() {
    export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/default}"

    build_jbigi
    build_jcpuid

    cd "$srcdir/$_gitname"

    ant -Dworkspace.version=$(git rev-parse --short $_commit) \
        -Dfile.encoding=UTF-8 \
        -Djavac.compilerargs=-Xlint:-options \
        -Dbuild.reproducible=true \
        -Djavac.version=13 \
        preppkg-linux
}

package() {
    cd "$pkgdir"

    install -dm755 "usr/bin"
    install -dm755 "opt/i2p"

    cp -r "$srcdir/$_gitname"/pkg-temp/* "opt/i2p"

    install -Dm644 "$srcdir/i2prouter.service" "usr/lib/systemd/system/i2prouter.service"
    install -Dm644 "$srcdir/i2p.tmpfiles"      "usr/lib/tmpfiles.d/i2p.conf"
    echo 'u i2p - "I2P Router" /opt/i2p /bin/sh' |
    install -Dm644 /dev/stdin                  "usr/lib/sysusers.d/i2p.conf"

    install -Dm644 "$srcdir/router.config"     "opt/i2p/router.config"
    install -Dm644 "$srcdir/wrapper.config"    "opt/i2p/wrapper.config"
    install -Dm755 "$srcdir/i2prouter.sh"      "opt/i2p/i2prouter"

    install -Dm644 "$srcdir/i2prouter.bash"    "usr/share/bash-completion/completions/i2prouter"
    install -Dm644 "$srcdir/$_gitname/installer/resources/bash-completion/eepget" \
                                               "usr/share/bash-completion/completions/eepget"

    install -Dm644 "opt/i2p/man/eepget.1"      "usr/share/man/man1/eepget.1"
    install -Dm644 "opt/i2p/LICENSE.txt"       "usr/share/licenses/i2p/LICENSE"
    mv opt/i2p/licenses/*                      "usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "usr/bin/"
    chmod +x opt/i2p/{eepget,i2prouter}
    chmod -x opt/i2p/*.config

    sed -i opt/i2p/{eepget,wrapper.config} \
        -e 's:%INSTALL_PATH:/opt/i2p:g'

    # dont automatically start the webserver (3) or open a webbrowser (4)
    sed -i opt/i2p/clients.config \
        -e "s:clientApp.3.startOnLoad=.*:clientApp.3.startOnLoad=false:" \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"

    rm -r opt/i2p/{osid,postinstall.sh,runplain.sh,INSTALL-headless.txt,LICENSE.txt,licenses,man,lib/wrapper}
}
