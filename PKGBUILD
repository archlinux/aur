# Maintainer: Antonis Geralis <capoiosct@gmail.com>

pkgname=glkterm
pkgver=1.0.4
pkgrel=1
pkgdesc="An interface standard for interactive fiction."
arch=('i686' 'x86_64')
url="http://eblong.com/zarf/glk/"
license=('custom')
depends=('ncurses')
makedepends=('make')
provides=()
conflicts=('glktermw')
source=("http://eblong.com/zarf/glk/${pkgname}-104.tar.gz" "${pkgname}.patch")
sha256sums=('473d6ef74defdacade2ef0c3f26644383e8f73b4f1b348e37a9bb669a94d927e'
            '2a62925fb1ba073b9996eb8b79fd3d1b47a924423a5b44ba15c6fff3f89f5ad6')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i ../${pkgname}.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  # headers
  for _header in glk.h glkstart.h Make.glkterm; do
    install -Dm644 "${_header}" "${pkgdir}/usr/include/${_header}"
  done
  # library
  install -Dm755 libglkterm.a "${pkgdir}/usr/lib/libglkterm.a"
  # license
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  grep -A 10 'Permissions' readme.txt > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
