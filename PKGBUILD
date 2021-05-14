# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >
# Contributor: xylosper <darklin20@gmail.com>
# Contributor: Martin T. H. Sandsmark <martin.sandsmark@kde.org>

pkgname=okular-backend-mupdf-git
pkgver=r78.7b2858a
pkgrel=2
pkgdesc="MuPDF-based backend for Okular (git version)"
arch=('x86_64')
license=('AGPL')
depends=('okular' 'libmupdf' 'gumbo-parser' 'mujs')
makedepends=('extra-cmake-modules' 'git')
url="https://invent.kde.org/sandsmark/okular-mupdf-backend"
source=("git+${url}.git"
        FindGumboParser.patch)
sha1sums=('SKIP'
          '3f69e002e89e1c2a5cf7bc5dda03e2cfd1aa0180')
conflicts=("okular-backend-mupdf")
provides=("okular-backend-mupdf")

pkgver() {
  cd okular-mupdf-backend
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  patch -d okular-mupdf-backend -p1 -i "${srcdir}/FindGumboParser.patch"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S okular-mupdf-backend
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
