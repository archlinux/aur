# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="qtengine"
pkgname="$_pkgname-git"
pkgver=r21.g59b83cd
pkgrel=2
pkgdesc="QT Platform Theme made easy"
url="https://github.com/kossLAN/qtengine"
license=('BSD-2-Clause')
arch=('x86_64')
depends=(
  kcolorscheme
  kconfig
  kiconthemes
  kconfigwidgets
  kconfigwidgets5
  kiconthemes5
  qt6-base
  qt5-base
)
makedepends=(
  cmake
  git
  ninja
  extra-cmake-modules
)
provides=("$_pkgname")
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
    # "$_pkgname-git"
)
source=(
    "git+${url}.git"
    "config.example.json"
)
sha256sums=('SKIP'
            '5dfcc6479a03140e492eff69936c708d1bffba3edf9d5312b27b5efff61fa06e')
install="$_pkgname.install"

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  local _cmake_options=(
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  cd "$srcdir"
  install -Dm0644 ./config.example.json -t "$pkgdir/etc/$_pkgname/"

  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"

}
