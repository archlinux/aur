# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
_pkgname=safeclib
pkgver=29102019
_gitver=6d168df
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
sha256sums=('b5e8baf406eddb45df5693614ebd7cb1c8bbed3dda7aecfec893d3fd612a4122')

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

  # temp fix
  [ -f "${pkgdir}/usr/share/man/man3/towlower.3" ] && \
    mv "${pkgdir}/usr/share/man/man3/towlower.3" "${pkgdir}/usr/share/man/man3/towlower_s.3"
  [ -f "${pkgdir}/usr/share/man/man3/towupper.3" ] && \
    mv "${pkgdir}/usr/share/man/man3/towupper.3" "${pkgdir}/usr/share/man/man3/towupper_s.3"
  [ -f "${pkgdir}/usr/share/man/man3/wcsstr.3" ] && \
    mv "${pkgdir}/usr/share/man/man3/wcsstr.3" "${pkgdir}/usr/share/man/man3/wcsstr_s.3"
}

# vim:set ts=2 sw=2 et:
