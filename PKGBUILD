# Maintainer: Apoorv <apoorvs569@gmail.com>

pkgname=monique-monosynth-git
pkgver=r585.17c6c1b9
pkgrel=8
pkgdesc="Monique is a monophonic synth from Thomas Arndt"
arch=('x86_64')
url="https://github.com/surge-synthesizer/monique-monosynth"
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
  git -C libs/JUCE checkout 6.1.2
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
  cp -r build/MoniqueMonosynth_artefacts/Release/VST3/MoniqueMonosynth.vst3/ "${pkgdir}/usr/lib/vst3/"
  cp -r build/MoniqueMonosynth_artefacts/Release/Standalone/MoniqueMonosynth "${pkgdir}/usr/bin/"
}
