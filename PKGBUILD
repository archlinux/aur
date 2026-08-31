# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=jq-static
_pkgname=jq
pkgver=1.8.2
pkgrel=2
pkgdesc='Command-line JSON processor'
arch=('x86_64' 'aarch64')
url='https://jqlang.github.io/jq/'
license=('MIT')
conflicts=(jq)
provides=(jq libjq.a)
makedepends=('musl' 'gcc' 'make')
source=("https://github.com/jqlang/jq/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('d4058940cff1cd9946d7f2a9057316bf05915679385386685d140b7a82d870d43ae5b5b4d0a5560c864cf0ef2cc59d7b6ed3afb46b3aea0f4d35329678b2c328')

build() {
  cd "${_pkgname}-${pkgver}"
  export CC=musl-gcc CFLAGS="$CFLAGS -Os" LDFLAGS="$LDFLAGS -static -fno-link-libatomic"
  ./configure --prefix=/usr --enable-all-static --enable-shared=no \
    --enable-static=yes --with-oniguruma=builtin
  make -j $(nproc)
  make jq.1
}
# check() {
#   make -C "${_pkgname}-${pkgver}" check
# }
package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" prefix=/usr install-binPROGRAMS
  strip ${pkgdir}/usr/bin/jq
  make DESTDIR="${pkgdir}" prefix=/usr install-man
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
