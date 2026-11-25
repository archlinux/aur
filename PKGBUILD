# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=webdump-static
_pkgname=webdump
pkgver=0.4
pkgrel=1
pkgdesc='HTML to plain-text converter tool'
arch=('x86_64' 'aarch64')
url='https://codemadness.org/webdump.html'
license=('ISC')
conflicts=(${_pkgname}-git)
provides=(${_pkgname})
makedepends=('musl' 'gcc' 'make')
source=("https://codemadness.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('59618e5e7b5ead87d0a6b5c3e67f9686bdda7ebc956f209d66464134d21f6b622625e9754be91c595f28fe8abfe075d81b36f4b1ef12efbc633b9f2ac55357c6')

build() {
  export CC="musl-gcc -fno-link-libatomic" CFLAGS="$CFLAGS -Os"
  export LDFLAGS="$LDFLAGS -static"
  make -j $(nproc) -C "${_pkgname}-${pkgver}"
}
package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  strip ${pkgdir}/usr/bin/webdump
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
