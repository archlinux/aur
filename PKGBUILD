# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=micropython-git
pkgver=1.8.7.292.g3d739eb39
pkgrel=1
epoch=1
pkgdesc="A Python 3 implementation for microcontrollers and constrained environments (Unix version)."
arch=('i686' 'x86_64')
url="http://micropython.org/"
license=('MIT')
depends=('libffi')
makedepends=('git' 'python')
provides=('micropython')
conflicts=('micropython')
optdepends=('micropython-lib: for MicroPython standard library')
source=('git://github.com/micropython/micropython.git')
changelog='ChangeLog'
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/micropython"
  PYTHONPATH='py' python -c \
    'import makeversionhdr; v=makeversionhdr.get_version_info_from_git()[0]; print(v.lstrip("v").replace("-", "."))'
}

prepare() {
  cd "${srcdir}/micropython"
  git submodule update --init
}

build() {
  cd "${srcdir}/micropython/unix"
  make CWARN="-Wall -Werror -Wno-error=unused-variable -Wno-error=unused-but-set-variable -Wno-error=unused-const-variable" axtls
  make
}

package() {
  cd "${srcdir}/micropython/unix"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
