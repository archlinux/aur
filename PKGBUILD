# Maintainer: Que Quotion <quequotion at gmail dot com>

pkgname=pt3-drv
pkgver=2009.03.07
pkgrel=4
install=pt3-drv.install
pkgdesc="Japanese Driver for Earthsoft PT3 cards"
groups=('earthsoft')
arch=('i686' 'x86_64')
license=('GPL')
depends=('b25' 'recpt1')
#makedepends=()
url="http://eco.senritu.net/ubuntu13-10-pt3-epgrec/"
source=(git+https://github.com/m-tsudo/pt3.git
        thatfix)
sha256sums=('SKIP'
            '664115ab093b0aa8b5276559769800ba982792a72e8dac8ee94a35f7d825704d')

#pkgver() {
#	# remove ".r*.*" from package version
#	_pkgverTriple=$(echo $pkgver | sed "s/\.r.*//g")
#	cd $pkgname
#	# get number of last git commit
#	_commitCount=$(git rev-list --count HEAD)
#	# get time of last git commit
#	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
#	# add ".r*.*" from package version
#	echo "$_pkgverTriple.r$_commitCount.$_commitTime"
#}

prepare() {
  cd pt3/
  patch -Np1 < ../thatfix
}

build() {
  cd pt3/
  make
}

package() {
  cd pt3/

  mkdir -m755 -p "${pkgdir}/etc/udev/rules.d/"
  make DESTDIR="${pkgdir}" install_compress

  mkdir -m755 -p "${pkgdir}/etc/modprobe.d/"
  echo "blacklist earth-pt3" >> pt3-blacklist.conf
  install -m644 pt3-blacklist.conf "${pkgdir}/etc/modprobe.d/pt3-blacklist.conf"
  install -m644 etc/99-pt3.rules "${pkgdir}/etc/udev/rules.d/"


  #Placeholder for the day when I learn how DKMS works
  #install -m 644 {Makefile,vhba.c} "${pkgdir}"/usr/src/vhba-${pkgver}/
  #install -m 644 ../dkms.conf "${pkgdir}"/usr/src/vhba-${pkgver}/
}
