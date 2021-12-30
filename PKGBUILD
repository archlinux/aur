# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=lumina-desktop-git
pkgver=1.6.2.r0.g92360ecb
pkgrel=1
pkgdesc="A Lightweight QT5 Desktop for FreeBSD"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://lumina-desktop.org/"
license=(BSD)
depends=(poppler-qt5 qt5-x11extras qt5-multimedia)
optdepends=('xorg-xbacklight: required for changing screen brightness'
            'alsa-utils: required for adjusting audio volume'
            'acpi: required for monitoring battery life'
            'numlockx: required for changign state of numlock at login'
            'pavucontrol: required for detatched audio mixer'
            'fluxmod-styles: A good set of Fluxbox themes to improve the appearence of window decorations'
            'network-manager-applet: Manage network connections from panel'
            'xterm: Terminal emulator'
            'fluxbox: window manager for Lumina DE')
makedepends=(git qt5-tools qt5-svg)
conflicts=(lumina-desktop insight-fm)
provides=(lumina-desktop)
source=("git+https://github.com/lumina-desktop/lumina.git")
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/lumina"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${srcdir}/lumina"
    find "${srcdir}/lumina" -name *.desktop -exec sed -i 's/usr\/local/usr/' {} \;
    qmake QMAKE_CFLAGS_ISYSTEM= PREFIX="/usr" LIBPREFIX=/usr/lib QT5LIBDIR=/usr/lib/qt CONFIG+=WITH_I18N L_MANDIR=/usr/share/man L_ETCDIR="/etc"
    make
}

package() {
  cd "${srcdir}/lumina"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
