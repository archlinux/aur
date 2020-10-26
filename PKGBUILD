# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=redkite
pkgname="${_pkgname}-git"
pkgver=1.2.0.r335.61f26b1
pkgrel=1
pkgdesc="A small free software and cross-platform GUI toolkit"
arch=('x86_64')
url="https://gitlab.com/iurie-sw/redkite"
license=('GPL3')
depends=('cairo')
makedepends=('cmake' 'git')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.com/iurie-sw/${_pkgname}.git")
sha512sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(grep 'redkite VERSION' CMakeLists.txt | cut -d ' ' -f 3 | tr -d ')')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install -C build
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
