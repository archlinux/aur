# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=gslapper
pkgver=1.5.2
pkgrel=1
pkgdesc="Modern mpvpaper replacement - Wayland wallpaper utility with video/image support and instant switching via RAM cache"
arch=('x86_64')
url="https://github.com/Nomadcxx/gSlapper"
license=('GPL-3.0-only')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'wayland' 'systemd-libs')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('gst-plugins-ugly: additional codec support'
            'gst-libav: FFmpeg-based codec support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5fd8856182ea4c47dacf2a9225e8e1fdf7a2026f6adade25554d6830d9be6399')
install=${pkgname}.install

prepare() {
    cd "${srcdir}/gSlapper-${pkgver}"
}

build() {
    cd "${srcdir}/gSlapper-${pkgver}"
    meson setup build --prefix=/usr --buildtype=release
    ninja -C build
}

package() {
    cd "${srcdir}/gSlapper-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install systemd user service (default - will be enabled post-install)
    install -Dm644 gslapper.service \
        "${pkgdir}/usr/lib/systemd/user/gslapper.service"
    
    # Install systemd template service for per-monitor instances
    install -Dm644 gslapper@.service \
        "${pkgdir}/usr/lib/systemd/user/gslapper@.service"
}
