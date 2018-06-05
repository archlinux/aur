# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=speech-denoiser-git
pkgver=r50.cae50a9
pkgrel=1
pkgdesc="A speech denoise lv2 plugin based on RNNoise library."
arch=('i686' 'x86_64')
url="https://github.com/lucianodato/speech-denoiser"
license=('LGPL3')
depends=('glibc')
makedepends=('git' 'lv2' 'meson')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/CrocoDuckoDucks/speech-denoiser.git"
        "git://github.com/xiph/rnnoise")
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "${pkgname%-*}"
  git submodule init
  git config submodule.rnnoise.url "${srcdir}/rnnoise"
  git submodule update
}

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}/rnnoise"
    ./autogen.sh 2>/dev/null 
    mv ../ltmain.sh ./ && ./autogen.sh
    CFLAGS="-fvisibility=hidden -fPIC -Wl,--exclude-libs,ALL" ./configure --disable-examples --disable-doc --disable-shared --enable-static
    make
    cd ..
    meson --prefix "/usr/lib/lv2" --buildtype=release build
    ninja -v -C build
    ninja -C build test
}

package() {
    cd "${pkgname%-*}"
    DESTDIR="$pkgdir" ninja -C build install
}
