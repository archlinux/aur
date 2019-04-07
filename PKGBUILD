# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

_pkgname=icu
pkgname=${_pkgname}63
pkgver=63.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('clang' 'make' 'patch')
source=(https://ssl.icu-project.org/files/${_pkgname}4c/${pkgver}/${_pkgname}4c-${pkgver//./_}-src.tgz
        icu-63.1-checkImpl.patch::https://github.com/unicode-org/icu/commit/9ec2c332c1.patch)
sha512sums=('9ab407ed840a00cdda7470dcc4c40299a125ad246ae4d019c4b1ede54781157fd63af015a8228cd95dbc47e4d15a0932b2c657489046a19788e5e8266eac079c'
            'ce1ec3c14f80658dad6127a037dfc0b21b4bff578240e7c8d8ca8c86cd8a5fe06b527e6a61db0aa303b708f1224f1401a59ad2b175c9640c375d37f138b4c523')

prepare() {
  cd ${_pkgname}/source
  
  patch -Np3 -i ${srcdir}/icu-63.1-checkImpl.patch
}

build() {
  cd ${_pkgname}/source
  
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make
}

package() {
  cd ${_pkgname}/source
  
  make -j1 DESTDIR=${pkgdir} install
  rm -r "${pkgdir}"/usr/{bin,include,share,lib/*so,lib/icu/{Makefile.inc,current,pkgdata.inc}}
  rm -r "${pkgdir}/usr/lib/pkgconfig"

  # Install license
  install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

