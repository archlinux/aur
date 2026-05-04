# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=webdump-static
_pkgname=webdump
pkgver=0.2
pkgrel=1
pkgdesc='HTML to plain-text converter tool'
arch=('x86_64' 'aarch64')
url='https://codemadness.org/webdump.html'
license=('ISC')
conflicts=(${_pkgname}-git)
provides=(${_pkgname})
makedepends=('musl' 'gcc' 'make')
source=("https://codemadness.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('852439534388e323f287a0f5510bc12ed8b4e094354ed01fb0430bcaf40b5c8615552dd229eda50b0050ae433dbf3a3155010aa400d5046b38e00767bf85fe86')

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
