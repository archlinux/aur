# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=webdump-static
_pkgname=webdump
pkgver=0.3
pkgrel=1
pkgdesc='HTML to plain-text converter tool'
arch=('x86_64' 'aarch64')
url='https://codemadness.org/webdump.html'
license=('ISC')
conflicts=(${_pkgname}-git)
provides=(${_pkgname})
makedepends=('musl' 'gcc' 'make')
source=("https://codemadness.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('fa44ba3171b0d7f9f2359c6846aa74f04d3b534bc88791a0e102d800b03da38e7b954a3677af26b16192e59cd1ee204f50d6201bc082949d14a97b17d9b8f705')

build() {
  export CC=musl-gcc CFLAGS="$CFLAGS -Os" LDFLAGS="$LDFLAGS -static"
  make -j $(nproc) -C "${_pkgname}-${pkgver}"
}
package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  strip ${pkgdir}/usr/bin/webdump
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
