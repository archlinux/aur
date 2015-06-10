# Maintainer: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
pkgname=lumina-desktop-git
pkgver=r691.2bb476d
pkgrel=1
pkgdesc="A Lightweight QT5 Desktop for FreeBSD -- git version"
arch=('x86_64' 'i686')
url="https://github.com/pcbsd/lumina"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-multimedia' 'qt5-x11extras' 'fluxbox' 'oxygen' 'oxygen-icons' 'xscreensaver' 'desktop-file-utils' 'qtchooser')
optdepends=('xorg-xbacklight: required for changing screen brightness' 'alsa-utils: required for adjusting audio volume' 'acpi: required for monitoring battery life' 'numlockx: required for changign state of numlock at login' 'pavucontrol: required for detatched audio mixer' 'fluxmod-styles: A good set of Fluxbox themes to improve the appearence of window decorations' 'network-manager-applet: Manage network connections from panel' 'xterm: Terminal emulator')
makedepends=('git' 'qt5-base' 'qt5-tools')
conflicts=("${pkgname%-*}" "lumina-de-git" "insight-fm")
provides=("${pkgname%-*-*}" "insight-fm")
install="${pkgname%-*}.install"
source=(git+https://github.com/pcbsd/lumina.git)
md5sums=(SKIP)


build(){
    cd $srcdir/lumina/
    $srcdir/lumina/libLumina/make-linux-distro.sh Debian
    find $srcdir/lumina -name *.desktop -exec sed -i 's/usr\/local/usr/' {} \;
    qmake-qt5 PREFIX="/usr" QT5LIBDIR=/usr/lib/qt
    make
}

package() {
    cd $srcdir/lumina
    make INSTALL_ROOT="${pkgdir}" install
    mv "${pkgdir}"/usr/etc "${pkgdir}"/etc
}

pkgver() {
  cd "$srcdir/lumina"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
