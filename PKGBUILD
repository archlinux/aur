# Contributor: lynix <lynix47@gmail.com>

pkgname=cnijfilter-ip4500
pkgver=2.80
pkgrel=3
pkgdesc="Canon IJ Printer Driver for Pixma IP4700 series Inkjet Printers"
arch=('x86_64')
url="http://software.canon-europe.com/software/0028476.asp"
license=('custom')

# libs extracted via
# for L in $(ldd32 /usr/lib/cups/filter/pstocanonij | awk '{print $3}' | grep lib); do pacman -Qo $L; done | awk '{print $4}' | sort | uniq

depends=('lib32-libpng12' 'cups' 'lib32-e2fsprogs' 'lib32-glibc' 'lib32-gnutls'
         'lib32-libcups' 'lib32-libgcrypt' 'lib32-libgpg-error'
         'lib32-libtasn1' 'lib32-openssl' 'lib32-popt' 'lib32-sqlite3' 'lib32-zlib'
         'lib32-libtiff3')
makedepends=('rpmextract')
source=('http://files.canon-europe.com/files/soft28476/software/28476.tgz'
		'canonip4500.ppd.patch')
install=cnijfilter-ip4500.install
md5sums=('5daca73347d7db20920f4fdcd661c33c'
		 '9378f8b1d4ff3992f3d87c7ebfe04502')

build() {
  cd ${srcdir}

  rm *.deb
  rpmextract.sh cnijfilter-common-${pkgver}-1.i386.rpm || return 1
  rpmextract.sh cnijfilter-ip4500series-${pkgver}-1.i386.rpm || return 1

  #cp -ar usr/local/* usr/ && rm -r usr/local || return 1
  mv usr/lib usr/lib32
  mkdir -p usr/lib/cups
  mv usr/lib32/cups/filter usr/lib/cups
  mv usr/lib32/bjlib usr/lib

  patch usr/share/cups/model/canonip4500.ppd ${startdir}/canonip4500.ppd.patch || return 1

  mv usr ${pkgdir}
}
