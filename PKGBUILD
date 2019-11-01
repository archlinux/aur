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

source=("git+https://github.com/i2p/${_gitname}.git#commit=${_commit}"
        'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')

sha256sums=('SKIP'
            'ff9942ca43715b5095b0118e306c8aec1af7c68c18e8959dba10d86eac8efbfd'
            'ea8f97e66461d591b1819eab39bbc40056b89ae12f7729b3dd9fd2ce088e5e53'
            '5c57456bf3f364175d036dfc6c6ceea5e57cdda970407829c04d09a4c821a9c0'
            '41756375ef2e8323147cec31a8675b2bc11109451f9185c036ff32d26d6c9b99')

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
    install -dm755 "opt/i2p/.tmp"

    cp -r "$srcdir/$_gitname"/pkg-temp/* "opt/i2p"

    install -Dm644 "$srcdir/router.config"     "opt/i2p/router.config"
    install -Dm644 "$srcdir/wrapper.config"    "opt/i2p/wrapper.config"
    install -Dm755 "$srcdir/i2prouter.sh"      "opt/i2p/i2prouter"
    install -Dm644 "$srcdir/i2prouter.service" "usr/lib/systemd/system/i2prouter.service"
    install -Dm644 "opt/i2p/man/eepget.1"      "usr/share/man/man1/eepget.1"
    install -Dm644 "opt/i2p/LICENSE.txt"       "usr/share/licenses/i2p/LICENSE"
    mv opt/i2p/licenses/*                      "usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "usr/bin/"
    chmod +x opt/i2p/{eepget,i2prouter}

    chmod  -x opt/i2p/*.config
    chmod 755 opt/i2p
    chown  -R 985:985 opt/i2p

    echo 'u i2p 985 "I2P Router" /opt/i2p /bin/sh' |
    install -Dm644 /dev/stdin "usr/lib/sysusers.d/i2p.conf"
    echo 'd /run/i2p 0700 i2p i2p' |
    install -Dm644 /dev/stdin "usr/lib/tmpfiles.d/i2p.conf"

    sed -i opt/i2p/{eepget,wrapper.config} \
        -e 's:%INSTALL_PATH:/opt/i2p:g'
    sed -i opt/i2p/clients.config \
        -e "s:clientApp.3.startOnLoad=.*:clientApp.3.startOnLoad=false:" \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"
    rm -r opt/i2p/{osid,postinstall.sh,runplain.sh,INSTALL-headless.txt,LICENSE.txt,licenses,man,lib/wrapper}
}
