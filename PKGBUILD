# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=tk-itk3
pkgver=3.4.2
pkgrel=2
pkgdesc="OOP extension for Tk, version 3.4"
arch=('x86_64')
url="http://incrtcl.sourceforge.net/"
license=('custom')
depends=('itcl3' 'tk')
source=("https://downloads.sourceforge.net/project/incrtcl/%5BIncr%20Tcl_Tk%5D-source/Itk%20$pkgver/itk$pkgver.tar.gz")
sha256sums=('8e5746de402d4ac9920f35793a1d328cf084b0c3d6af8b057e00fd37c82ad2ec')

build() {
  cd itk${pkgver%.*}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-64bit \
    --with-itcl=/usr/lib/itcl3.4
  make
}

package() {
  cd itk${pkgver%.*}
  make DESTDIR="${pkgdir}" install
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # conflict with tk-itk (latest version)
  rm -rf "$pkgdir"/usr/share/man
  install -dm755 "$pkgdir"/usr/include/itk${pkgver%.*}/generic
  mv "$pkgdir"/usr/include/*.h "$pkgdir"/usr/include/itk${pkgver%.*}/generic

  rmdir "${pkgdir}/usr/bin"
}
