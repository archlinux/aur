# Maintainer: Hussein Hareb <hussein.hareb04@gmail.com>
pkgname=hw-monitor
pkgver=0.6.1
pkgrel=1
pkgdesc="A lightweight hardware monitor built with Tauri"
arch=('x86_64')
url="https://github.com/husseinhareb/hw-monitor"
license=('MIT')
# libayatana-appindicator is loaded at runtime (dlopen) by the tray icon, so ldd does not show it,
# but the app panics on startup without it
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsoup3' 'gdk-pixbuf2' 'cairo' 'glib2'
         'dbus' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'polkit')
optdepends=('nvidia-utils: NVIDIA GPU monitoring')
conflicts=('hw-monitor-git')
options=('!strip' '!debug')
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/husseinhareb/hw-monitor/releases/download/v${pkgver}/hw-monitor_${pkgver}_amd64.deb"
)
sha256sums=(
    'SKIP'
)

package() {
    cd "${srcdir}"
    # Unpack the .deb (ar archive) to get data.tar.gz
    bsdtar -xf "${pkgname}-${pkgver}.deb"
    # Extract file tree into pkgdir
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    # Ensure binary is executable
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
