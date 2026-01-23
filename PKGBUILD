# Maintainer: tarball <bootctl@gmail.com>

pkgname=kbd-audio
pkgver=2022.05.03
pkgrel=2
pkgdesc='Acoustic keyboard eavesdropping'
arch=(i686 x86_64 aarch64)
url='https://github.com/ggerganov/kbd-audio'
license=(MIT)
depends=(sdl2 fftw libglvnd)
provides=(keytap{,2,3})
makedepends=(cmake)
source=("$pkgname-$pkgver::git+$url.git#tag=keytap3")
sha256sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver
  git submodule update --init
}

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  local bins=(
    compress-n-grams
    key-detector
    keytap
    keytap-gui
    keytap2
    keytap2-gui
    keytap3
    keytap3-app
    keytap3-gui
    play
    play-full
    record
    record-full
    view-full-gui
    view-gui
  )

  for bin in "${bins[@]}"; do
    install -Dm755 "build/$bin" "$pkgdir/usr/bin/kbd-$bin"
  done

  install -Dm755 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
