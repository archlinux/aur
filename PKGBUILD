# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Charles Delfly <charles@delfly.fr>

pkgname=openfortigui-git
_pkgname="${pkgname%-git}"
pkgver=0.9.8.1.r0.g31eff99
pkgrel=1
pkgdesc="OpenFortiGUI is an open-source VPN-Client to connect to Fortigate VPN-Hardware. It is based on openfortivpn and adds an easy to use and nice GUI on top of it, written in Qt5."
arch=('i686' 'x86_64')
url="https://github.com/theinvisible/openfortigui.git"
license=('GPL3')
groups=()
depends=('qt5-base' 'qtkeychain' 'qt5-translations' 'openssl' 'ppp' 'sudo')
makedepends=('git')
provides=(openfortigui)
conflicts=(openfortigui)
replaces=()
options=()
install=
source=("git+https://github.com/theinvisible/$_pkgname.git")
noextract=()
b2sums=('SKIP')
#options=(debug !strip)

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${_pkgname}"
    cd openfortigui
    git submodule init
    git submodule update
    cd ..
    #patch -p1 < ../user-env.patch
}

build() {
    cd "$srcdir/${_pkgname}"
    #qmake openfortigui-project.pro -spec linux-g++ CONFIG+=debug CONFIG+=qml_debug
    qmake
    make
}

check() {
    cd "$srcdir/${_pkgname}"
    make -k check
}

package() {
    cd "$srcdir/${_pkgname}/${_pkgname}"
    mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/pixmaps $pkgdir/usr/share/applications $pkgdir/etc/sudoers.d $pkgdir/etc/openfortigui/vpnprofiles
    install -m 755 openfortigui $pkgdir/usr/bin/
    #chmod 640 $pkgdir/etc/sudoers.d
    install -m 440 sudo/openfortigui $pkgdir/etc/sudoers.d
    install -m 644 app-entry/openfortigui.png $pkgdir/usr/share/pixmaps/
    install -m 644 app-entry/openfortigui.desktop $pkgdir/usr/share/applications/
}
