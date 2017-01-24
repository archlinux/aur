# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=ni-visa
pkgver=16.0.0
_f_number=0
_short_ver=${pkgver%.0}
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

source=("http://download.ni.com/support/softlib/visa/NI-VISA/${_short_ver}/Linux/NI-VISA-${pkgver}.iso")
md5sums=('7bd345779ce11ff79d5cb970d3bf99b3')

build () {
  mkdir -p extracted
  bsdtar -xvf nivisa-${pkgver}f${_f_number}.tar.gz -C extracted
  cd extracted/rpms
  echo "do a thing"
  for f in *.noarch.rpm *.${_suffix}.rpm
  do
     echo "Processing $f"
     bsdtar -xvf $f
  done
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
  rm *.tar.gz

  cd "${pkgdir}/usr/local"
  mv * ..
  rm -rf "${pkgdir}/usr/local"
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
  
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
