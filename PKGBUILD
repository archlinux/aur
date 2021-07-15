# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >
# Contributor: xylosper <darklin20@gmail.com>
# Contributor: Martin T. H. Sandsmark <martin.sandsmark@kde.org>

pkgname=okular-backend-mupdf-git
pkgver=r81.1ba0160
pkgrel=1
pkgdesc="MuPDF-based backend for Okular (git version)"
arch=('x86_64')
license=('AGPL')
depends=('okular' 'libmupdf' 'gumbo-parser' 'mujs')
makedepends=('extra-cmake-modules' 'git')
url="https://github.com/gustawho/okular-backend-mupdf"
source=("git+${url}.git")
sha1sums=('SKIP')
conflicts=("okular-backend-mupdf")
provides=("okular-backend-mupdf")

pkgver() {
  cd ${pkgname%-git}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -B build -S ${pkgname%-git}
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
