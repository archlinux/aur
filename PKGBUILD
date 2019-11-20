# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=mstflint-inband
_pkgname=mstflint
pkgver=4.13.1.1
_pkgver=4.13.1-1
pkgrel=1
pkgdesc='OpenFabrics Alliance firmware burning application for Mellanox HCA/NIC cards (with inband support)'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'sqlite')
makedepends=('git' 'infiniband-diags')
source=("git+https://github.com/Mellanox/${_pkgname}#tag=v${_pkgver}")
sha256sums=('SKIP')

#The release tarballs cannot be used cleanly on Arch
#Reported upstream: https://github.com/Mellanox/mstflint/issues/6
#https://github.com/Mellanox/${_pkgname}/archive/v${_pkgver}.tar.gz
#  autogen.sh (through gitversion.sh) assumes it's running from a git tree, not a source tarball
#  so, it fails to write common/gitversion.h which causes a compilation failure
#  (if you run this from within a different git tree (i.e. AUR repo) it will proceed with wrong sha
#https://github.com/Mellanox/${_pkgname}/releases/download/v${_pkgver}/${_pkgname}-${_pkgver}.tar.gz
#  has files created upstream by autogen.sh, which is hard-coded to run with aclocal-1.13
#  and arch has aclocal-1.16

build() {
  cd "${srcdir}/${_pkgname}"

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
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/docs/${pkgname}/README"
}
