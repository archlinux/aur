# Contributor: skydrome <skydrome@protonmail.com>
# Maintainer:  skydrome <skydrome@protonmail.com>

# Comment out if you want to build all language translations
export LG2=en

pkgname=i2p-dev
pkgver=2.3.0.10
pkgrel=1
pkgdesc="A distributed anonymous network (daily mtn->git sync)"
url="https://geti2p.net"
license=('GPL2')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
depends=('jdk-openjdk' 'java-service-wrapper' 'gmp')
makedepends=('apache-ant' 'git')
#optdepends=('gtk2: for rrd graphs')
conflicts=('i2p' 'i2p-bin')
provides=('i2p')
backup=('opt/i2p/wrapper.config')
install='i2p.install'
options=(!strip)

_gitname=i2p.i2p
_commit=master

source=("git+https://github.com/i2p/${_gitname}.git#commit=${_commit}"
        #"git+https://gitlab.com/I2P/${_gitname}.git#commit=${_commit}"
        'i2prouter.service' 'i2p.tmpfiles' 'wrapper.config' 'router.config'
        'i2prouter.bash' 'i2prouter.sh' 'chromium-i2p.sh')

sha256sums=('SKIP'
            '644b771ec7f5db3efab3206bf1f896566cdb00d410a54608fda85bdb4c2ad876'
            'fc30dd32f48fe1c93bf36c8297ca48203a1479e4e221ebe62c57cf3c3c0347d3'
            'ca8a61f231d77c26329af8a1e23f64a507b4360973a9a97ac39a9a3a1bc6b33d'
            '60d187565befa0d8ca8171b517d61d84145179aef0816b39fed63ddaf87f2523'
            '7a19b9f90c8792460fd58e8b8aa435a065e34d29a942479850472510e9d3078a'
            '8d39f080c7a2e49226db3a785f3e18583159ef2f95e1ab467fd9984c4e38c9f5'
            'a7076156703e2b949331e450455813432caeb4e5712f1c7b668974eb06a69fb9')

pkgver() {
    cd "$_gitname"
    printf "%s.%s" "$(grep -m1 ' VERSION =' core/java/src/net/i2p/CoreVersion.java \
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
if [[ "$CARCH" != @(arm*|aarch64) ]]; then
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

    ant -Dworkspace.version="$(git rev-parse --short $_commit)" \
        -Dfile.encoding=UTF-8 \
        -Djavac.compilerargs=-Xlint:-options \
        -Dbuild.reproducible=true \
        -Djavac.relase=17 \
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
    install -Dm754 "$srcdir/i2prouter.sh"      "opt/i2p/i2prouter"
    install -Dm755 "$srcdir/chromium-i2p.sh"   "opt/i2p/scripts/chromium-i2p"

    install -Dm644 "$srcdir/i2prouter.bash"    "usr/share/bash-completion/completions/i2prouter"
    install -Dm644 "$srcdir/$_gitname/installer/resources/bash-completion/eepget" \
                                               "usr/share/bash-completion/completions/eepget"

    install -Dm644 "opt/i2p/man/eepget.1"      "usr/share/man/man1/eepget.1"
    install -Dm644 "opt/i2p/LICENSE.txt"       "usr/share/licenses/i2p/LICENSE"
    mv opt/i2p/licenses/*                      "usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "usr/bin/"
    chmod +x opt/i2p/eepget

    sed -i opt/i2p/{eepget,wrapper.config} \
        -e 's:%INSTALL_PATH:/opt/i2p:g'

    # dont automatically start the webserver(3) or open a webbrowser(4)
    sed -i opt/i2p/clients.config \
        -e "s:clientApp.3.startOnLoad=.*:clientApp.3.startOnLoad=false:" \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"

    rm -r opt/i2p/{osid,postinstall.sh,runplain.sh,INSTALL-headless.txt,LICENSE.txt,licenses,man,lib/wrapper}
}
