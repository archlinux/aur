pkgname=maui-bonsai-git
pkgver=r23.ec26222
pkgrel=1
pkgdesc="Mobile Git repository manager"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/maui/bonsai"
license=(GPL3)
depends=(
  'ki18n'
  'knotifications'
  'kio'
  'attica'
  'mauikit'
  'mauikit-filebrowsing'
  'kirigami2'
  'qt5-svg'
  'qt5-quickcontrols2'
  'qt5-multimedia'
  'libgit2'
)
makedepends=('git' 'extra-cmake-modules')
provides=('maui-bonsai')
conflicts=('maui-bonsai')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd bonsai
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S bonsai
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
