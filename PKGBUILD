# Maintainer: bnema <b at bnema dot dev>
pkgname=dumber-browser-git
pkgver=0.23.1.r0.g6c872d5
pkgrel=1
pkgdesc="A minimal keyboard-driven browser for tiling WMs (git version)"
arch=('x86_64')
url="https://github.com/bnema/dumber"
license=('MIT')
makedepends=('go>=1.25' 'npm' 'git')
depends=('gtk4' 'webkitgtk-6.0')
optdepends=(
    'gstreamer: Media playback support'
    'gst-plugins-base: Base media codecs'
    'gst-plugins-good: Additional media codecs'
    'gst-plugins-bad: Extended media codecs'
    'gst-libav: FFmpeg-based codecs'
)
provides=('dumber-browser' 'dumber')
conflicts=('dumber-browser' 'dumber-browser-bin')
source=("git+https://github.com/bnema/dumber.git")
sha256sums=('SKIP')

pkgver() {
    cd dumber
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd dumber
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make build
}

package() {
    cd dumber
    install -Dm755 dist/dumber "${pkgdir}/usr/bin/dumber"
    install -Dm644 dev.bnema.Dumber.desktop "${pkgdir}/usr/share/applications/dev.bnema.Dumber.desktop"
    install -Dm644 assets/logo-512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dev.bnema.Dumber.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
