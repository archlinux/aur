# Maintainer: James Harvey <jamespharvey20@gmail.com>

pkgname=mstflint-inband
pkgver=4.10.0.2
_pkgver=4.10.0-2
pkgrel=1
pkgdesc='OpenFabrics Alliance firmware burning application for Mellanox HCA/NIC cards (with inband support)'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('bash' 'zlib' 'python' 'libibmad')
source=("https://github.com/Mellanox/mstflint/archive/v${_pkgver}.tar.gz")
md5sums=('378b851f829da9973e0c69a1c8840a77')

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
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
