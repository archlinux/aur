# Maintainer: SmallClover <aur at clvr dot one>

pkgname=plasma6-applets-kara
pkgver=1.0.0
pkgrel=3
pkgdesc="KDE Plasma Pager Applet"
arch=('any')
url="https://github.com/dhruv8sh/kara"
license=('GPL-3.0-only')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
depends=()
options=()
makedepends=(
  'git'
  'base-devel'
  'cmake'
  'extra-cmake-modules'
  'qt6-base'
  'qt6-declarative'
  'kwin'
  'libplasma'
  'plasma-activities'
  'plasma-workspace'
  'vulkan-headers'
)

source=(
  "git+${url}.git"
  'remove-x11-task-handling.patch'
)
sha256sums=(
  'SKIP'
  '2f81c1c785db00519ae576f201dc00d737bc61da4afcba97b11a1054ea7a5799'
)

prepare() {
  cd "$srcdir/kara"

  git fetch --tags
  git checkout --force "v${pkgver}"
  git clean -fd

  patch -Np1 -i "$srcdir/remove-x11-task-handling.patch"
}

build() {
  cd "$srcdir/kara"

  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/kara"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
