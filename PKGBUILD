# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=NeuralRack
_plugin_uri="urn:brummer:${_name,,}"
pkgname=${_name,,}-git
pkgver=r196.15821e5
pkgrel=1
pkgdesc="Neural model and impulse response file loader"
arch=(aarch64 x86_64)
url="https://github.com/brummer10/$_name"
license=(BSD-3-Clause)
groups=(clap-plugins
        lv2-plugins
        pro-audio
        vst-plugins)
depends=(gcc-libs
         glibc
         jack
         libx11
         portaudio)
makedepends=(cairo clap git libsndfile lv2 xxd)
checkdepends=(lv2lint)
provides=(${_name}.clap
          ${_name,,[R]}.lv2
          ${_name,,[R]}_ui.so
          ${_name,,[R]}.so
          ${_name}vst.so)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_name" || exit 1
  git submodule update --init --recursive
  make
}

check() {
  cd "$srcdir/$_name" || exit 1
  lv2lint -M pack -s '_Z*' -I bin/${_name,,[R]}.lv2 "${_plugin_uri}"
}

package() {
  depends+=(libcairo.so libsndfile.so)
  cd "$srcdir/$_name" || exit 1
  make DESTDIR="$pkgdir" install
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}"
  install -vDm644 README.md NeuralRack.png -t "$pkgdir/usr/share/doc/${pkgname}"
}
