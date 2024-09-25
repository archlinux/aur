# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Ratatouille.lv2
pkgname=${_name,,}
pkgver=0.9.1
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
sha256sums=('3fefc0e739a6a557056e05cf43594e0132ebf5e5b7729810ad599d7497bf6747')
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
