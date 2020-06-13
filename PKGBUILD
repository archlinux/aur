# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=checkpolicy
pkgver=3.0
pkgrel=2
pkgdesc="SELinux policy compiler"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL2')
groups=('selinux')
makedepends=('libsepol>=3.0')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://github.com/SELinuxProject/selinux/releases/download/20191204/${pkgname}-${pkgver}.tar.gz"
        '0001-checkpolicy-remove-unused-te_assertions.patch')
sha256sums=('c88c719a141dd5c1202d49c378c7f063349d630522d5e04dc6e0c53da81aa4f8'
            '8ee8d4e01e7441fe8bee97c41dabc37ed707f55e65ad6d415382590cbc0597e2')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Backport commit 4d330d0d3155 ("checkpolicy: remove unused te_assertions")
  # https://github.com/SELinuxProject/selinux/commit/4d330d0d3155211f119b3082f728ae42dcc01e96
  patch -Np2 -i ../0001-checkpolicy-remove-unused-te_assertions.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m 0755 test/dismod "${pkgdir}"/usr/bin/sedismod
  install -m 0755 test/dispol "${pkgdir}"/usr/bin/sedispol
}
