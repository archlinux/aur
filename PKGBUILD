# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=jq-static
_pkgname=jq
pkgver=1.8.1
pkgrel=2
pkgdesc='Command-line JSON processor'
arch=('x86_64' 'aarch64')
url='https://jqlang.github.io/jq/'
license=('MIT')
conflicts=(jq)
provides=(jq libjq.a)
makedepends=('musl' 'gcc' 'make')
source=("https://github.com/jqlang/jq/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b09d48dbeaac7b552397b75692ed7833afa72186de80d977fb1b887a14ac66c02f677acdd79f9a2736db1fd738b7ce57a39725e34846bfa21ed3728cd7adc187')

build() {
  cd "${_pkgname}-${pkgver}"
  export CC=musl-gcc CFLAGS="$CFLAGS -Os" LDFLAGS="$LDFLAGS -static"
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
