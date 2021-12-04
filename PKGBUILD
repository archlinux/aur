# Maintainer: Giuseppe Calà <gcala at mailbox dot org>

pkgname=kalendar-git
pkgver=0.3.1.r10.gc4a70bb3
pkgrel=1
pkgdesc="A calendar application using Akonadi to sync with external services (NextCloud, GMail, ...)"
arch=(x86_64 aarch64)
url="https://invent.kde.org/pim/kalendar"
license=(GPL3)
depends=('ki18n' 'kirigami2' 'kcalendarcore' 'kpackage' 'kconfigwidgets' 'kwindowsystem' 'akonadi' 'akonadi-contacts' 'calendarsupport' 'kpeople' 'eventviews' 'kirigami-addons-git' 'qqc2-desktop-style')
makedepends=('fakeroot' 'binutils' 'git' 'extra-cmake-modules' 'qt5-svg' 'boost')
optdepends=('kdepim-runtime')
provides=('kalendar')
conflicts=('kalendar')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
