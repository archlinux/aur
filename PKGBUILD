# Maintainer: James Harvey <jamespharvey20@gmail.com>

pkgname=mstflint
pkgver=4.6.0.1
_pkgver=4.6.0-1
pkgrel=1
pkgdesc='OpenFabrics Alliance firmware burning application for Mellanox HCA/NIC cards'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('bash' 'zlib')
source=("https://github.com/Mellanox/mstflint/archive/v${_pkgver}.tar.gz")
md5sums=('f01626673ed65de5f0581b6d4af86b70')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  sed -i 's/Werror/Wno-error/g' cmdif/Makefile.am
  sed -i 's/Werror/Wno-error/g' configure.ac
  sed -i 's/Werror/Wno-error/g' ext_libs/muparser/Makefile.am
  sed -i 's/Werror/Wno-error/g' ext_libs/sqlite/Makefile.am
  sed -i 's/Werror/Wno-error/g' mft_utils/Makefile.am
  sed -i 's/Werror/Wno-error/g' reg_access/Makefile.am
  sed -i 's/Werror/Wno-error/g' tools_res_mgmt/Makefile.am
  ./autogen.sh
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man \
              --disable-inband
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
