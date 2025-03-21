# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=kilo-git
pkgver=r20.323d93b
pkgrel=1
pkgdesc="A small text editor in less than 1K lines of code"
arch=('x86_64')
url="https://github.com/antirez/kilo"
license=('BSD-2-Clause')
depends=(
  'glibc'
)
makedepends=(
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname//-/.}::git+${url}")
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
prepare() {
  cd "${srcdir}/${pkgname//-/.}"
  sed -i "4s/$/ $CFLAGS $LDFLAGS/g" Makefile
}
build() {
  cd "${srcdir}/${pkgname//-/.}"
  make
}
package() {
  install -Dm755 "${srcdir}/${pkgname//-/.}/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname//-/.}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}