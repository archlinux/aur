# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="qtengine"
pkgname="$_pkgname-git"
pkgver=r14.gdd5c09f
pkgrel=1
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
)
provides=("$_pkgname")
conflicts=(
    "$_pkgname"
    "$_pkgname-bin"
    # "$_pkgname-git"
)
source=(
    "git+${url}.git"
    "https://raw.githubusercontent.com/KDE/breeze/refs/heads/master/colors/BreezeDark.colors"
    "https://raw.githubusercontent.com/KDE/breeze/refs/heads/master/colors/BreezeLight.colors"
    "config.example.json"
)
sha256sums=('SKIP'
            '09d0382680e23e736c862e35a1b9742f511ff0e34bd28c967f896a9fb986d14b'
            'ccae3193b07605f9ab123c57539692da2e8c4b4f9a70bbac0be5525ccabe855d'
            'aca694131d7adf7b28ebbc866adbba0e0d3a6a4f636432ebdf4d8eddd8e9d7eb')
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
  install -Dm0644 ./BreezeDark.colors -t "$pkgdir/etc/$_pkgname/"
  install -Dm0644 ./BreezeLight.colors -t "$pkgdir/etc/$_pkgname/"
  install -Dm0644 ./config.example.json -t "$pkgdir/etc/$_pkgname/"

  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"

}
