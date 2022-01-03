pkgname=maui-strike-git
pkgver=r36.5617d7a
pkgrel=1
pkgdesc="Code, build, and run from the phone"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/maui/strike"
license=(GPL3)
depends=(
  'ki18n'
  'knotifications'
  'kio'
  'attica'
  'mauikit'
  'mauikit-texteditor'
  'mauikit-filebrowsing'
  'kirigami2'
  'qt5-svg'
  'qt5-quickcontrols2'
  'qt5-multimedia'
)
makedepends=('git' 'extra-cmake-modules')
provides=('maui-strike')
conflicts=('maui-strike')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd strike
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S strike
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
