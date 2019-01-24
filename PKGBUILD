# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

########[ OPTIONS ]########################################
# Comment out if you want to build all language translations
export LG2=en
###########################################################

pkgname=i2p-dev
pkgver=0.9.38.0
pkgrel=1
epoch=1
pkgdesc="A distributed anonymous network (daily mtn->git sync)"
url="https://geti2p.net"
license=('GPL2')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
depends=('java-runtime>=9' 'gmp' 'java-service-wrapper')
makedepends=('apache-ant' 'git' 'java-environment>=9')
[[ "$LG2" != 'en' ]] && makedepends+=('gettext')
#optdepends=('gtk2: for rrd graphs')
conflicts=('i2p' 'i2p-bin')
provides=('i2p')
backup=('opt/i2p/wrapper.config')
install='i2p.install'

_gitname=i2p.i2p
_commit=master

source=("git+https://github.com/i2p/${_gitname}.git#commit=${_commit}"
        'i2prouter.service' 'i2prouter.sh' 'wrapper.config' 'router.config')

sha256sums=('SKIP'
            'ff9942ca43715b5095b0118e306c8aec1af7c68c18e8959dba10d86eac8efbfd'
            'ea8f97e66461d591b1819eab39bbc40056b89ae12f7729b3dd9fd2ce088e5e53'
            '72c0944cd2b04c747673a534475f2ec42c64d52fdda76714f1165c4655113de2'
            'b98b00bf7c811089a12a59641e9503bd89447be9d0c0b12bbc780036c7cb6f3c')
pkgver() {
    cd "$srcdir/$_gitname"
    echo "$(grep 'VERSION =' core/java/src/net/i2p/CoreVersion.java \
        |sed 's/.*= "//;s/";//').$(grep 'BUILD =' router/java/src/net/i2p/router/RouterVersion.java \
        |sed 's/.*= //;s/;//')"
}

prepare() {
    cd "$srcdir/$_gitname"
    sed -i build.properties \
        -e 's:javac.version=.*:javac.version=11:'
    sed -i {router,core}/java/build.xml \
        -e 's:1.7:11:'
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
    export ANT_HOME=/usr/share/ant
    export ANT_OPTS="-Dfile.encoding=UTF-8"
    export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/default}"

    build_jbigi
    build_jcpuid

    cd "$srcdir/$_gitname"
    ant -Dworkspace.version=$(git rev-parse --short $_commit) preppkg-linux
}

package() {
    cd "$srcdir/$_gitname"

    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
    install -dm755 "$pkgdir/usr/bin"
    install -dm750 "$pkgdir/opt/i2p"

    cp -r pkg-temp/* "$pkgdir/opt/i2p"
    cp "$srcdir/wrapper.config" "$pkgdir/opt/i2p"

    install -Dm644 "$srcdir/router.config"        "$pkgdir/opt/i2p/router.config"
    install -Dm755 "$srcdir/i2prouter.sh"         "$pkgdir/opt/i2p/i2prouter"
    install -Dm644 "$srcdir/i2prouter.service"    "$pkgdir/usr/lib/systemd/system/i2prouter.service"
    install -Dm644 "$pkgdir/opt/i2p/man/eepget.1" "$pkgdir/usr/share/man/man1/eepget.1"
    install -Dm644 "$pkgdir/opt/i2p/LICENSE.txt"  "$pkgdir/usr/share/licenses/i2p/LICENSE"
    mv "$pkgdir"/opt/i2p/licenses/*               "$pkgdir/usr/share/licenses/i2p/"

    ln -s /opt/i2p/{eepget,i2prouter} "$pkgdir/usr/bin/"
    chmod +x "$pkgdir"/opt/i2p/{eepget,i2prouter}

    echo 'd /run/i2p 0700 i2p i2p -' >"$pkgdir/usr/lib/tmpfiles.d/i2prouter.conf"

    sed -i "$pkgdir"/opt/i2p/{eepget,wrapper.config} \
        -e 's:%INSTALL_PATH:/opt/i2p:g'
    sed -i "$pkgdir"/opt/i2p/clients.config \
        -e "s:clientApp.4.startOnLoad=.*:clientApp.4.startOnLoad=false:"
    rm -r "$pkgdir"/opt/i2p/{osid,postinstall.sh,runplain.sh,INSTALL-headless.txt,LICENSE.txt,licenses,man,lib/wrapper}
}
