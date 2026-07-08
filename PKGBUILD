# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=gslapper
pkgver=1.5.0
pkgrel=1
pkgdesc="Modern mpvpaper replacement - Wayland wallpaper utility with video/image support and instant switching via RAM cache"
arch=('x86_64')
url="https://github.com/Nomadcxx/gSlapper"
license=('GPL-3.0-only')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'wayland')
makedepends=('meson' 'ninja' 'wayland-protocols')
optdepends=('gst-plugins-ugly: additional codec support'
            'gst-libav: FFmpeg-based codec support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e8829dfc69f737a064001059df6e00c2092a6ab250f43ed8fd8442012ddfb4e4')
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
