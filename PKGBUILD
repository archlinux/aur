# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ni-visa
pkgver=15.5.0
pkgrel=1
pkgdesc="National Instruments NI-VISA(TM) Software for Linux"
url="http://www.ni.com/download/ni-visa-5.4.1/4629/en/"
arch=('i686' 'x86_64')
[ "$CARCH" = 'i686' ] && _suffix=i386
[ "$CARCH" = 'x86_64' ] && _suffix=x86_64
license=('custom')
makedepends=('rpmextract')
optdepends=('python2-pyvisa: python 2 frontend'
'python-pyvisa: python 3 frontend')

source=("http://download.ni.com/support/softlib/visa/NI-VISA/15.5/Linux/NI-VISA-${pkgver}.iso")
md5sums=('049033dc8d884c71c53744021e235c3c')

build () {
  mkdir -p extracted
  tar -xvf nivisa-${pkgver}f1.tar.gz -C extracted
  cd extracted/rpms
  rpmextract.sh *.noarch.rpm
  rpmextract.sh *.${_suffix}.rpm
  rm -rf *.rpm
}


package() {
  mv "${srcdir}/extracted/rpms" "${pkgdir}/"
  cd "${pkgdir}/rpms"
  mv * ..
  cd "${srcdir}"
  rm -rf "${srcdir}/extracted"
  rm -rf "${pkgdir}/rpms"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a * "${pkgdir}/opt/${pkgname}/."

  cd "${pkgdir}/opt/${pkgname}"
  rm *.iso

  cd "${pkgdir}/usr/local"
  mv * ..
  rm -rf "${pkgdir}/usr/local"
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
  
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
