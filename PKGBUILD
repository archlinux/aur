# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=nepdate
pkgdesc='Standalone Nepali calendar widget and converter for Bikram Sambat and Gregorian calendars.'
pkgver=2.0.7
pkgrel=1
arch=(x86_64)
url="https://github.com/khumnath/nepdate"
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base')
makedepends=('cmake')
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('534c62d81e3a17965cedebe4434d71cbbebeffd6a7bbbe752a6e8bf397a25099')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir build
}

build() {
    cd "${pkgname}-${pkgver}/build"
    cmake ..
    make all
}

package() {
    #install binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/nepdate-calendar" "${pkgdir}/usr/bin/nepdate-calendar"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/nepdate-widget" "${pkgdir}/usr/bin/nepdate-widget"
    #install icons
    install -Dm644 "$srcdir/${pkgname}-${pkgver}/resources/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/nepdate.svg"
    #make .desktop file
    install -d "${pkgdir}/usr/share/applications"
    echo "[Desktop Entry]
Name=Nepdate Calendar
Comment=Standalone Nepali Calendar and Converter. Right click to open widget.
Exec=nepdate-calendar
Icon=nepdate
Terminal=false
Type=Application
Categories=Utility;
StartupWMClass=nepdate-calendar
Actions=OpenNepdateWidget;

[Desktop Action OpenNepdateWidget]
Name=Nepdate Widget
Exec=env QT_QPA_PLATFORM=xcb nepdate-widget
Icon=nepdate
" > "${pkgdir}/usr/share/applications/nepdate.desktop"
}
