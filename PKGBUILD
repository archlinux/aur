# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname="micropython"
pkgname="${_pkgname}-git"
pkgver=1.9.4.405.g7067ac357
pkgrel=1
epoch=1
pkgdesc="A Python 3 implementation for microcontrollers and constrained environments (Unix version)."
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('libffi')
makedepends=('git' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('micropython-lib: for MicroPython standard library')
source=("${_pkgname}::git://github.com/micropython/${_pkgname}.git")
changelog='ChangeLog'
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  PYTHONPATH='py' python -c \
    'import makeversionhdr; v=makeversionhdr.get_version_info_from_git()[0]; print(v.lstrip("v").replace("-", "."))'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init
}

build() {
  cd "${srcdir}/${_pkgname}/ports/unix"
  make CWARN="-Wall -Werror -Wno-error=unused-variable -Wno-error=unused-but-set-variable -Wno-error=unused-const-variable -Wno-error=array-bounds" axtls
  make
}

package() {
  cd "${srcdir}/${_pkgname}/ports/unix"
  make PREFIX="$pkgdir/usr" install
  install "${srcdir}/${_pkgname}/mpy-cross/mpy-cross" "$pkgdir/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
