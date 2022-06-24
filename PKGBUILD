# Maintainer: Krzysztof Małysa <varqox at gmail dot com>
pkgname=sim-sip
pkgver=r168.ab2b033
pkgrel=1
pkgdesc="A tool for preparing and managing Sim problem packages"
arch=('x86_64' 'i686')
url="https://github.com/varqox/sip"
license=('MIT')
depends=(
  'libseccomp'
  'libzip'
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
provides=('libsimlib.so')
conflicts=('libsimlib.so')
source=(
  "git+https://github.com/varqox/sip.git#commit=${pkgver#r*.}"
  'git+https://github.com/varqox/simlib.git'
)
b2sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir/sip"
  git submodule init
  git config submodule.simlib.url "$srcdir/simlib"
  git submodule update
}

build() {
  arch-meson "$srcdir/sip" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$srcdir/sip"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "subprojects/simlib/LICENSE" "$pkgdir/usr/share/licenses/$pkgname-simlib/LICENSE"
}
