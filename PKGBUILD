# Maintainer: Krzysztof Małysa <varqox at gmail dot com>
pkgname=sim-sip-git
pkgver=r2270.ed528064
pkgrel=1
pkgdesc="A tool for preparing and managing Sim problem packages"
arch=('x86_64' 'i686')
url="https://github.com/varqox/sim-project"
license=('MIT')
depends=(
  'libseccomp'
  'libzip'
  'gcc'
  'lib32-glibc'
)
optdepends=(
  'texlive-latexextra: compiling TeX files support'
  'texlive-science: compiling TeX files support'
  'texlive-fontsextra: compiling TeX files support'
  'fpc: compiling Pascal solutions support'
)
makedepends=(
  'python'
  'meson'
  'git'
  'gtest'
)
provides=("${pkgname%-git}" 'libsimlib.so')
conflicts=("${pkgname%-git}" 'libsimlib.so')
source=(
  'git+https://github.com/varqox/sim-project.git'
)
b2sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/sim-project/subprojects/sip"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/sim-project/subprojects/sip"
  git submodule update --init --recursive
}

build() {
  arch-meson "$srcdir/sim-project/subprojects/sip" build --wipe
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$srcdir/sim-project/subprojects/sip"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "subprojects/simlib/LICENSE" "$pkgdir/usr/share/licenses/$pkgname-simlib/LICENSE"
}
