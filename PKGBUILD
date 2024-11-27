# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Ratatouille.lv2
pkgname=${_name,,}
pkgver=0.9.2
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
sha256sums=('2280c274f9be8c9dd2f6606ce4921907a22f6fec2a6e36db1bdd332a1ad8f9ea')
_plugin_uri="urn:brummer:ratatouille"

build() {
  cd $_name-v$pkgver
  # Workaround for https://github.com/brummer10/libxputty/issues/13
  export CFLAGS="$CFLAGS -Wno-format-security"
  make
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
