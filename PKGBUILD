# Maintainer: creations <creations@creations.works>
pkgname=grabit-git
pkgver=0.6.1.r247.gafa31b6
pkgrel=1
pkgdesc="Screenshot, screen-recording, OCR, and uploader for wlroots and KDE Plasma 6 Wayland compositors (git)"
arch=('x86_64' 'aarch64')
url="https://heliopolis.live/creations/grabit"
license=('AGPL-3.0-or-later')
depends=(
    'cairo'
    'curl'
    'dbus'
    'file'
    'json-c'
    'libxkbcommon'
    'wayland'
)
makedepends=(
    'git'
    'wayland-protocols'
)
optdepends=(
    'ffmpeg: --record support'
    'tesseract: --tesseract (OCR) support'
    'tesseract-data-eng: english OCR data'
    'translate-shell: --translate (OCR -> translated text) support'
    'libjpeg-turbo: JPEG output (--format jpeg)'
    'libwebp: WebP output (--format webp)'
    'pipewire: pw-play (default shutter-sound player)'
    'libpulse: paplay (alternative sound player)'
    'alsa-utils: aplay (alternative sound player)'
    'sox: play (alternative sound player)'
)
provides=("grabit=${pkgver%%.r*}")
conflicts=('grabit' 'grabit-bin')
source=("grabit::git+https://heliopolis.live/creations/grabit.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/grabit"
    printf "%s.r%s.g%s" \
        "$(awk '/^VERSION/ {print $3; exit}' Makefile)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/grabit"
    make all VERSION="${pkgver%.r*}"
}

package() {
    cd "${srcdir}/grabit"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 OPTIONS.md "${pkgdir}/usr/share/doc/${pkgname}/OPTIONS.md"
    install -Dm644 PLUGINS.md "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"
}
