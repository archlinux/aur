# Maintainer: Apoorv <apoorvs569@gmail.com>

_pkgname=Le-Phonk
pkgname=le-phonk-git
pkgver=r45.c68985a
pkgrel=1
pkgdesc="The distortion plugin you will ever own"
arch=('x86_64')
url="https://github.com/Speechrezz/Le-Phonk"
license=('MIT')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"

  git submodule update --init --recursive
}

build() {
  cd "$srcdir/${_pkgname}"

  cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POSITION_INDEPENDENT_CODE=ON
  make -C build
}

package() {
  cd "$srcdir/${_pkgname}"

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/vst3/"

  cp -r build/LePhonk_artefacts/Release/VST3/LePhonk.vst3/ "${pkgdir}/usr/lib/vst3/"
  cp -r build/LePhonk_artefacts/Release/Standalone/LePhonk "${pkgdir}/usr/bin/"
}
