# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="qtengine"
pkgname="$_pkgname"
pkgver=0.1.0
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
    # "$_pkgname"
    "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/KDE/breeze/refs/heads/master/colors/BreezeDark.colors"
    "https://raw.githubusercontent.com/KDE/breeze/refs/heads/master/colors/BreezeLight.colors"
    "config.example.json"
)
sha256sums=('217c354e13a5ce42c8e5c67bba9f63802a36515eeb49011f4123a7cdc9060132'
            '09d0382680e23e736c862e35a1b9742f511ff0e34bd28c967f896a9fb986d14b'
            'ccae3193b07605f9ab123c57539692da2e8c4b4f9a70bbac0be5525ccabe855d'
            'aca694131d7adf7b28ebbc866adbba0e0d3a6a4f636432ebdf4d8eddd8e9d7eb')
install="$_pkgname.install"

build() {
  cd "$srcdir/$_pkgname-$pkgver"

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
  install -Dm0644 ./BreezeDark.colors -t "$pkgdir/etc/$_pkgname/"
  install -Dm0644 ./BreezeLight.colors -t "$pkgdir/etc/$_pkgname/"
  install -Dm0644 ./config.example.json -t "$pkgdir/etc/$_pkgname/"

  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"

}
