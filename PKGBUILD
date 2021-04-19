# Maintainer: Charles Delfly <charles@delfly.fr>
pkgname=openfortigui
pkgver=0.9.4
pkgrel=1
pkgdesc="OpenFortiGUI is an open-source VPN-Client to connect to Fortigate VPN-Hardware. It is based on openfortivpn and adds an easy to use and nice GUI on top of it, written in Qt5."
arch=('i686' 'x86_64')
url="https://github.com/theinvisible/openfortigui.git"
license=('GPL3')
groups=()
depends=('qt5-base' 'qtkeychain' 'qt5-translations' 'openssl' 'ppp' 'sudo')
makedepends=('git')
provides=()
conflicts=()
replaces=()
options=()
install=
source=("git+https://github.com/theinvisible/$pkgname.git#tag=v$pkgver" "user-env.patch")
noextract=()
md5sums=('SKIP' '7f1e96dea4ce324b59b8190640f22c43')

prepare() {
    cd "$srcdir/$pkgname"
    cd openfortigui
    git submodule init
    git submodule update
    cd ..
    patch -p1 < ../user-env.patch
}

build() {
    cd "$srcdir/$pkgname"
    qmake
    make
}

check() {
    cd "$srcdir/$pkgname"
    make -k check
}

package() {
    cd "$srcdir/$pkgname/openfortigui"
    mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/pixmaps $pkgdir/usr/share/applications $pkgdir/etc/sudoers.d $pkgdir/etc/openfortigui/vpnprofiles
    install -m 755 openfortigui $pkgdir/usr/bin/
    chmod 640 $pkgdir/etc/sudoers.d
    install -m 440 sudo/openfortigui $pkgdir/etc/sudoers.d
    install -m 644 app-entry/openfortigui.png $pkgdir/usr/share/pixmaps/
    install -m 644 app-entry/openfortigui.desktop $pkgdir/usr/share/applications/
}
