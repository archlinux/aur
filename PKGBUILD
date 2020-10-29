# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=zkg

pkgname="${_pkgname}-git"
pkgver=r79.ffdc173
pkgrel=1
pkgdesc="A prototype zig package manager "
url="https://github.com/mattnite/zkg"
license=('MIT')
depends=('libgit2')
makedepends=('git' 'zig')
arch=('x86_64')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init && git submodule update
  cd "${srcdir}/${_pkgname}/libs/zig-bearssl"
  git submodule init && git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  zig build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 zig-cache/bin/zkg "${pkgdir}/usr/bin/zkg"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
