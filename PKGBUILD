# Maintainer: Burhanverse <contact@burhanverse.eu.org>
pkgname=fagram-bin
pkgver=2.3.6
pkgrel=1
pkgdesc="Telegram Desktop based messenger with Feature-rich modifications."
arch=(x86_64)
url="https://github.com/fagramdesktop/fadesktop"
license=(GPL3)
depends=(
    'abseil-cpp'
    'ada'
    'ffmpeg'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'hunspell'
    'jemalloc'
    'kcoreaddons'
    'libavif'
    'libdispatch'
    'libgcc'
    'libheif'
    'libjxl'
    'libstdc++'
    'libxcomposite'
    'libxdamage'
    'libxrandr'
    'libxtst'
    'lz4'
    'minizip'
    'openal'
    'openh264'
    'openssl'
    'pipewire'
    'protobuf'
    'qt6-imageformats'
    'qt6-svg'
    'qt6-wayland'
    'rnnoise'
    'xxhash'
    'zlib'
)
makedepends=('chrpath')
optdepends=(
    'geoclue: geoinformation support'
    'crow-translate: translation provider'
    'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
    'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
    'xdg-desktop-portal: desktop integration'
)
provides=('fagram')
conflicts=('fagram')
options=(!debug)

source=("https://github.com/fagramdesktop/fadesktop/releases/download/${pkgver}/fagram-${pkgver}.tar.zst")

sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    cd "${srcdir}/"

    # Creating needed directories
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/dbus-1"
    install -dm755 "${pkgdir}/usr/share/icons"
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -dm755 "${pkgdir}/usr/share/metainfo"

    # Application executable
    install -Dm755 "${srcdir}/usr/bin/fagram" "${pkgdir}/usr/bin/fagram"
    install -Dm755 "${srcdir}/usr/bin/Updater" "${pkgdir}/usr/bin/Updater"

    # Remove RPATH informations
    chrpath --delete "${pkgdir}/usr/bin/fagram"
    chrpath --delete "${pkgdir}/usr/bin/Updater"

    # Desktop launcher
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/org.fagram.png" "${pkgdir}/usr/share/pixmaps/fagram.png"
    install -Dm644 "${srcdir}/usr/share/applications/org.fagram.desktop" "${pkgdir}/usr/share/applications/org.fagram.desktop"

    # DBus service
    install -Dm644 "${srcdir}/usr/share/dbus-1/services/org.fagram.service" "${pkgdir}/usr/share/dbus-1/services/org.fagram.service"

    # Metainfo
    install -Dm644 "${srcdir}/usr/share/metainfo/org.fagram.metainfo.xml" "${pkgdir}/usr/share/metainfo/org.fagram.metainfo.xml"

    # Icons
    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${icon_dir}"
        install -m644 "${srcdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/org.fagram.png" "${icon_dir}/org.fagram.png"
    done

    # Symbolic icons
    install -d "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
    install -m644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-symbolic.svg"
    install -m644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-mute-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-mute-symbolic.svg"
    install -m644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-attention-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-attention-symbolic.svg"
}

