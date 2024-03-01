# Maintainer: Apoorv <apoorvs569@gmail.com>

pkgname=firefly-synth-git
pkgver=r3664.3a0b327e
pkgrel=1
pkgdesc="Semi-modular synthesizer and FX plugin, VST3 and CLAP"
arch=('x86_64')
url="https://github.com/sjoerdvankreel/firefly-synth"
license=('GPL3')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  git submodule update --init --recursive
}

build() {
  cd "$srcdir/${pkgname%-git}"

  cmake -Bbuild -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p "${pkgdir}/usr/lib/clap/"
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  mkdir -p "${pkgdir}/usr/share/doc/"

  cd dist/Release/linux
  ./plugin_base.ref_gen firefly_synth_1.vst3/Contents/x86_64-linux/firefly_synth_1.so ../../../param_reference.html

  cd ../../..

  cp -r dist/Release/linux/firefly_synth_1.clap/ "${pkgdir}/usr/lib/clap/"
  cp -r dist/Release/linux/firefly_synth_fx_1.clap/ "${pkgdir}/usr/lib/clap/"
  cp -r dist/Release/linux/firefly_synth_1.vst3/ "${pkgdir}/usr/lib/vst3/"
  cp -r dist/Release/linux/firefly_synth_fx_1.vst3/ "${pkgdir}/usr/lib/vst3/"

  cp LICENSE "${pkgdir}/usr/share/doc/"
}
