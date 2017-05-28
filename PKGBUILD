# Contributor: Mark Doe <mark.doe.priv@gmail.com>
# Contributor: Benjamin Bukowski <crankidiot(at)gmail.com>

_printer=mfcj6720dw
pkgname=brother-${_printer}-cupswrapper
pkgver=3.0.0_1
_version="${pkgver//_/-}"
pkgrel=5
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-j6720DW multifunction network printer"
arch=('i686' 'x86_64')
url='http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfcj6720dw_us_eu_as'
license=('GPL')
depends=('cups' 'ghostscript' "brother-${_printer}-lpr>=${pkgver}")
install="$pkgname.install"

source=("http://download.brother.com/welcome/dlf100966/${_printer}cupswrapper-${_version}.i386.deb")
md5sums=('4c94e477a2191fc70f8e0afa819601f1')

package() {
  cd $srcdir

  ar x ${_printer}cupswrapper-${_version}.i386.deb || return 1
  [ ! -d "data" ] &&  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  [ ! -d "data/usr/share" ] && mkdir -p data/usr/share
  mv data/opt/brother data/usr/share/brother
  rm -r data/opt
  sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' data/` || return 1

  cp -r data/usr $pkgdir || return 1
}
