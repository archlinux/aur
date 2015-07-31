# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

########[ OPTIONS ]########################################
# Comment out if you want to build all language translations
export LG2=en

## Clone i2p through i2p
# Add and Start a new Standard client tunnel with the following settings:
#   Name: pull.git.repo.i2p
#   Port: 9450  or some other unused port
#   Tunnel Destination: 3so7htzxzz6h46qvjm3fbd735zl3lrblerlj2xxybhobublcv67q.b32.i2p
#   git://127.0.0.1:9450/i2p.i2p.git
###########################################################

pkgname=i2p-dev
pkgver=0.9.21.0
pkgrel=1
epoch=1
pkgdesc="A distributed anonymous network (daily mtn->git sync)"
url="https://geti2p.net"
license=('GPL2')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
depends=('java-runtime>=7' 'gmp' 'java-service-wrapper')
makedepends=('apache-ant' 'git' 'java-environment>=7')
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
            '842b529ae23bc82fd78e986dd7cc683bd7b671e93421de57f279dc3f4d5d0fd2'
            'ea8f97e66461d591b1819eab39bbc40056b89ae12f7729b3dd9fd2ce088e5e53'
            'a76e7b6ccd8f49b51d22012887e1f0101db3bfe6aeebe1bc416b48da4e206b27'
            'c001f045e52ab82154b21125384dbc4f1d2437376fc65c5d83987051e42b5409')

pkgver() {
    cd "$srcdir/$_gitname"
    echo "$(grep 'VERSION =' core/java/src/net/i2p/CoreVersion.java \
        |sed 's/.*= "//;s/";//').$(grep 'BUILD =' router/java/src/net/i2p/router/RouterVersion.java \
        |sed 's/.*= //;s/;//')"
}

prepare() {
    cd "$srcdir/$_gitname"
    sed -i build.properties \
        -e 's:javac.version=.*:javac.version=1.7:'
    sed -i {router/java/build.xml,core/java/build.xml} \
        -e 's:target="1.5":target="1.7":'
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
    source /etc/profile.d/apache-ant.sh
    source /etc/profile.d/jre.sh

    build_jbigi
    build_jcpuid

    cd "$srcdir/$_gitname"
    ant -Dworkspace.version=$(git rev-parse $_commit) preppkg-linux
}

package() {
    cd "$srcdir/$_gitname"

    install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/i2p"

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
