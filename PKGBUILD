# Maintainer: Krzysztof Małysa <varqox at gmail dot com>
pkgname=sim-sip-git
pkgver=r173.858d221
pkgrel=1
pkgdesc="A tool for preparing and managing Sim problem packages"
arch=('x86_64' 'i686')
url="https://github.com/varqox/sip"
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
  'git+https://github.com/varqox/sip.git'
  'git+https://github.com/varqox/simlib.git'
)
b2sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/sip"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
