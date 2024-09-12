# Maintainer: Frederick Price <fprice@pricemail.ca>

_pkgname=aeolus-plugin
pkgname=${_pkgname}-git
pkgver=r240.d74f818
pkgrel=2
pkgdesc="Synthesised pipe organ emulator"
arch=(x86_64)
url="https://github.com/Archie3d/aeolus_plugin"
license=(GPL-3.0-only)
groups=(pro-audio)
depends=(
  gcc-libs
  glibc
)
conflicts=(aeolus)
makedepends=(
  alsa-lib
  clthreads
  clxclient
  cmake
  git
)

source=("${pkgname}::git+https://github.com/Archie3d/aeolus_plugin")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# prepare() {
#   patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-0.10.1-makefile.patch
# }

build() {
  cd "${srcdir}/${pkgname}"
  # cd $pkgname-$pkgver
  git submodule update --init --recursive
  cmake -S . -B build_dir
  cd build_dir
  make
  # make PREFIX=/usr SUFFIX='' -C $pkgname-$pkgver/source
}

package(){
  depends+=(
    alsa-lib libasound.so
    freetype2 
  )

  # Go to directory where build files are
  cd $(find . -name Aeolus_artefacts)

  # Standalone executable
  mkdir -p "$pkgdir/usr/bin"
  cp $(find . -name Aeolus -print) "$pkgdir/usr/bin/"
  # LV2 Plugin
  mkdir -p "$pkgdir/usr/lib/lv2"
  cp -Rp $(find . -name "Aeolus.lv2" -print) "$pkgdir/usr/lib/lv2"
  # VST3 Plugin
  mkdir -p "$pkgdir/usr/lib/vst3"
  cp -Rp $(find . -name "Aeolus.vst3" -print) "$pkgdir/usr/lib/vst3"
}
