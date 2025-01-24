# Maintainer: asamk <asamk@gmx.de>

pkgname=karp-git
_pkgname=karp
pkgver=r551.1415cae
pkgrel=1
pkgdesc='Simple UI for PDF files modification.'
arch=(x86_64)
url='https://apps.kde.org/karp/'
license=(GPL-2.0-or-later)
depends=(
         ghostscript
         kiconthemes
         kirigami
         kirigami-addons
         kcrash
         qt6-base
         qt6-webengine
         qpdf
)
makedepends=(
         git
         extra-cmake-modules
)
source=($pkgname::git+https://invent.kde.org/graphics/${_pkgname}.git)
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/$pkgname"

        ( set -o pipefail
          git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}


build() {
        cmake -B build -S "$srcdir/$pkgname" \
          -DCMAKE_INSTALL_LIBEXECDIR=lib \
          -DBUILD_TESTING=OFF
        cmake --build build
}

package() {
        DESTDIR="$pkgdir" cmake --install build
}
