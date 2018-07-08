# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=speech-denoiser-git
pkgver=r66.76852d1
pkgrel=2
pkgdesc="A speech denoise lv2 plugin based on RNNoise library."
arch=('i686' 'x86_64')
url="https://github.com/lucianodato/speech-denoiser"
license=('LGPL3')
depends=('glibc')
makedepends=('git' 'lv2' 'meson')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/lucianodato/speech-denoiser.git"
        "git://github.com/xiph/rnnoise.git")
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "${pkgname%-*}"
  git submodule init
  git config submodule.rnnoise.url "${srcdir}/rnnoise"
  git submodule update
  chmod +x static_rnnoise.sh
}

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
