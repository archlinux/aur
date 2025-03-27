# Maintainer: Emily <info@emy.sh>
# Contributor: Martin -nexus- Mlynář <nexus+arch@smoula.net>

pkgname=tayga
pkgver=0.9.2
pkgrel=3
pkgdesc="TAYGA NAT64 daemon"
arch=('i686' 'x86_64')
url="http://www.litech.org/tayga/"
license=('GPL')
source=(
	"http://www.litech.org/tayga/tayga-${pkgver}.tar.bz2"
	"tayga.conf"
	"tayga.service"
	"0005-guard-chdir.patch"
	"0006-guard-write.patch"
	"0010-include-for-writev.patch"
)
sha256sums=('2b1f7927a9d2dcff9095aff3c271924b052ccfd2faca9588b277431a44f0009c'
         '623b56227bed86faa77aa20d4efe71440935b9534f94ec7f4993a5600b5c3b71'
         '5d6e1e3f22e0a7dae72473b021e62427a0e838337d0d690bd1e0b325d2bc9c02'
         '2deee59eba1fd313afc895e8708f185387f15e35ef895afde1e76e2aea833a7c'
         'af50ecf028f0b02228ffbfd0d308847e066b0a9e07abfa2af74ad0505739c593'
         '2faf990634b44c49d76fea345700522b99b5c7e32b3639fc3bcfee0aa9a89ee9')

prepare() {
  cd "${srcdir}/tayga-${pkgver}"

  # Apply patches
  patch -Np1 -i "${srcdir}/0005-guard-chdir.patch"
  patch -Np1 -i "${srcdir}/0006-guard-write.patch"
  patch -Np1 -i "${srcdir}/0010-include-for-writev.patch"
}

build() {
  cd $srcdir/tayga-${pkgver}
  ./configure --prefix=/usr/ --sbindir=/usr/bin/
  make
}

package() {
  cd $srcdir/tayga-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../tayga.service "${pkgdir}"/usr/lib/systemd/system/tayga.service
  install -Dm644 ../tayga.conf "${pkgdir}"/etc/tayga.conf
  mkdir -p "${pkgdir}"/var/db/tayga
}
