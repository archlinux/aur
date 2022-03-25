# Maintainer: Apoorv <apoorvs569@gmail.com>

pkgname=b-step-git
pkgver=r30.dba71e4
pkgrel=1
pkgdesc="The MonoPlugs b-step sequencer"
arch=('x86_64')
url="https://github.com/surge-synthesizer/b-step"
license=('GPL3' 'MIT')
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
  cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1
  make -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/vst3/"
  cp -r build/B-Step_artefacts/Release/VST3/B-Step.vst3/ "${pkgdir}/usr/lib/vst3/"
  cp -r build/B-Step_artefacts/Release/Standalone/B-Step "${pkgdir}/usr/bin/"
}
