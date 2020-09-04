# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
_pkgname=safeclib
pkgver=02092020
_gitver=6d921f4
pkgrel=1
_pkgver="${pkgver}.0-${_gitver}"
pkgdesc='Implementtion of C11 Annex K + ISO TR24731 Bounds Checking Interface'
arch=('i686' 'x86_64')
url='https://rurban.github.io/safeclib'
_url='https://github.com/rurban/safeclib'
depends=('pkgconfig')
makedepends=('clang' 'git')
license=('MIT')
# https://github.com/rurban/safeclib/archive/v17102019.tar.gz
source=("${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('ee13cb914be5e7da7c363c839f905fc8b2a3c43c341c21f627a2094e05107362')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Ugly workaround to solve this
  git init
  git add .
  git commit -m "$(date)"
  ./build-aux/autogen.sh
  CC="clang -march=native -fstrict-aliasing" ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
