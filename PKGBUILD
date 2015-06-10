# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer:  Achilleas Pipinellis <axilleas archlinux info>

pkgname=supermin
pkgver=5.1.11
pkgrel=1
pkgdesc="Tool for creating supermin appliances"
arch=('i686' 'x86_64')
url="http://people.redhat.com/~rjones/supermin/"
license=('GPL')
makedepends=('ocaml' 'ocaml-findlib' 'prelink' 'cpio')
depends=('e2fsprogs')
# Does not provide febootstrap because supermin is not compatible with it
provides=()
conflicts=('febootstrap<=3.21' 'supermin-git')
source=("http://libguestfs.org/download/supermin/supermin-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Check was failing when building in chroot
  # make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  # From Fedora's spec file:
  #   supermin-helper is marked as requiring an executable stack.  This
  #   happens because we use objcopy to create one of the component object
  #   files from a data file.  The program does not in fact require an
  #   executable stack.  The easiest way to fix this is to clear the flag
  #   here.
  execstack -c "${pkgdir}/usr/bin/supermin"
}

# vim:set ts=2 sw=2 et:
md5sums=('5843cd7016022d4944227c3019c8b225')
