# Maintainer: Christian Schendel <doppelhelix@gmail.com>
# Heavily Inspired by: Mark Wagie <mark at manjaro dot org>
pkgname=qt-sudo-git
pkgdesc="A clone of LXQt sudo tool, without LXQt libs"
pkgver=r9.4eaad52
pkgrel=1
url="https://github.com/aarnt/qt-sudo"
arch=('x86_64')
license=(
    'LGPL-2.1-or-later'
)
makedepends=(
    'git'
    'qt6-tools'
)
depends=(
    'qt6-base'
)
optdepends=(
    'opendoas: privilege elevation'
    'sudo: privilege elevation'
)
source=("git+$url.git")
sha256sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "${pkgname%-git}"
    qmake6 \
        PREFIX=/usr \
        QMAKE_CFLAGS="${CFLAGS}" \
        QMAKE_CXXFLAGS="${CXXFLAGS}" \
        QMAKE_LFLAGS="${LDFLAGS}"
    make
}

package() {
    cd "${pkgname%-git}"
    make INSTALL_ROOT="${pkgdir}" install
}
