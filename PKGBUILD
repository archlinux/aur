# Contributor: Mark Doe <mark.doe.priv@gmail.com>
# Contributor: Benjamin Bukowski <crankidiot(at)gmail.com>

_printer=mfc6490cw
pkgname=brother-${_printer}-cupswrapper
pkgver=1.1.2_2
_version="${pkgver//_/-}"
pkgrel=5
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-6490CW multifunction network printer"
arch=('i686' 'x86_64')
url='http://solutions.brother.com/linux/en_us/download_prn.html#MFC-6490CW'
license=('GPL')
depends=('cups' 'ghostscript' "brother-${_printer}-lpr>=${pkgver}")
install="$pkgname.install"

source=("http://download.brother.com/welcome/dlf006182/${_printer}cupswrapper-${_version}.i386.deb")
md5sums=('8c0c560d2fd9b7a019f26968c47e8a0a')

package() {
  cd $srcdir

  ar x ${_printer}cupswrapper-${_version}.i386.deb || return 1
  [ ! -d "data" ] &&  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  [ ! -d "data/usr/share" ] && mkdir data/usr/share
  mv data/usr/local/Brother data/usr/share/brother
  rm -r data/usr/local
  sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' data/` || return 1
  sed -i 's|/etc/init.d|/etc/rc.d|' `grep -lr '/etc/init.d' data/` || return 1

  cp -r data/usr $pkgdir || return 1
}
