# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=speech-denoiser-git
pkgver=r36.eb01f90
pkgrel=1
pkgdesc="A speech denoise lv2 plugin based on RNNoise library."
arch=('i686' 'x86_64')
url="https://github.com/lucianodato/speech-denoiser"
license=('LGPL3')
depends=('glibc')
makedepends=('git' 'lv2' 'meson')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/lucianodato/speech-denoiser")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"
    ./static_rnnoise.sh
    meson --prefix "/usr/lib/lv2" --buildtype=release build
    ninja -v -C build
    ninja -C build test
}

package() {
    cd "${pkgname%-*}"
    DESTDIR="$pkgdir" ninja -C build install
}
