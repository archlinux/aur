# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Ratatouille.lv2
pkgname=${_name,,}
pkgver=0.9
pkgrel=1
pkgdesc='A guitar amp neural model and impulse response loader and mixer LV2 plugin'
arch=(aarch64 x86_64)
url="https://github.com/brummer10/$_name"
license=(BSD-3-Clause)
groups=(lv2-plugins pro-audio)
depends=(cairo fftw glibc gcc-libs libsndfile libx11)
makedepends=(lv2 xxd)
checkdepends=(lv2lint)
optdepends=('lv2-host: for loading the LV2 plugin')
source=("https://github.com/brummer10/$_name/releases/download/v$pkgver/$_name-v$pkgver-src.tar.xz")
sha256sums=('87a564c018a8a638cb0e7dd825778bc1ec596a777dc521e868753554d1e30b13')
_plugin_uri="urn:brummer:ratatouille"

build() {
  cd $_name-v$pkgver
  if [[ "$CARCH" = "aarch64" ]]; then
    make SSE_CFLAGS="" FFT_FLAG=""
  else
    make
  fi
}

check() {
  cd $_name-v$pkgver
  lv2lint -M pack -s '_Z*' -I bin/$_name "$_plugin_uri"
}

package() {
  depens+=(libcairo.so libfftw3f.so libsndfile.so)
  cd $_name-v$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 README.md Ratatouille.png -t "$pkgdir"/usr/share/doc/$pkgname
}
