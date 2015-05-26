# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=hfsutils
pkgver=3.2.6
pkgrel=6
pkgdesc="A comprehensive software to permit manipulation of HFS volume"
arch=("i686" "x86_64")
url="http://www.mars.org/home/rob/proj/hfs/"
license=("GPL")
depends=("glibc")
optdepends=("tcl: For the graphical interface [rebuild using --with-tcl]"
	"tk: For the graphical interface [rebuild using --with-tk]")
source=("ftp://ftp.mars.org/pub/hfs/$pkgname-$pkgver.tar.gz"
        "Makefile-install.patch"
        "hfsutils-3.2.6-errno.patch"
        "largerthan2gb.patch"
        "hfsutils-3.2.6-fix-tcl-8.6.patch")

prepare() {
  unset CPPFLAGS

  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fixed Makefile @INSTALL@ feature
  patch -Np0 -i "${srcdir}/Makefile-install.patch"

  # Fix the errno issue on glibc-2.3.2+
  patch -Np1 -i "${srcdir}/hfsutils-3.2.6-errno.patch"

  # Add support for files larger than 2 GB, this is the 21 century
  patch -Np1 -i "${srcdir}/largerthan2gb.patch"

  # Fixed compilation with tcl-8.6+
  patch -Np1 -i "${srcdir}/hfsutils-3.2.6-fix-tcl-8.6.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --without-tcl --without-tk
  make

  cd "${srcdir}/${pkgname}-${pkgver}/hfsck"
  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make -k check
#}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  msg "Installing to ${pkgdir}"
  make prefix="${pkgdir}/usr" MANDEST="${pkgdir}/usr/share/man" install

  # Faulty makefile, install hfsck
  install -m 755 "${srcdir}/${pkgname}-${pkgver}/hfsck/hfsck" \
  	"${pkgdir}/usr/bin/hfsck"

}

md5sums=('fa572afd6da969e25c1455f728750ec4'
         'af48f3ff82c6aa8607c10271c2e56c77'
         '4f5ea10416823de9fd38f6121dd3b8f0'
         '7ab54a275889301df989c4a0351781c6'
         'a4b7920d3302f4c79f162923d8c1c654')
