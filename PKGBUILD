# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>
# Contributor: Patryk Kowalczyk <patryk AT kowalczyk dot ws>
# Contributor: Robert Buhren <robert@robertbuhren.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: xav <xav at ethertricks dot net>
# Contributor: julian <pidanc_j at epita dot fr>

pkgname=tpm-tools
pkgver=1.3.9.1
pkgrel=2
pkgdesc="Tools to manage and diagnose a TPM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trousers"
license=('CPL')
depends=('trousers' 'opencryptoki')
source=(http://downloads.sourceforge.net/project/trousers/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
        01-opencryptoki-soname.patch
        03-fix-bool-error-parseStringWithValues.patch
        04-fix-FTBFS-clang.patch
        05-openssl1.1_fix_data_mgmt.patch)
noextract=(${pkgname}-${pkgver}.tar.gz)
sha1sums=('c35cb031c6b5220dd1c8a03995654fdd12aa3031'
          'f87849fc46d8c8cab5b7a0fbc1a8de69f3fd1669'
          'b40d56f3a7ca3ef231470cc401a73e178b698a4e'
          '521e9f58e6740bc50979e8dc727a60b82ad4fae0'
          '3fdf2d39a25f5c2e152ec44a457ffd2f7258d698')

prepare() {
  mkdir -p ${pkgname}-${pkgver}
  bsdtar -x -f ${pkgname}-${pkgver}.tar.gz -C ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch -p1 -i ${srcdir}/01-opencryptoki-soname.patch
  patch -p1 -i ${srcdir}/03-fix-bool-error-parseStringWithValues.patch
  patch -p1 -i ${srcdir}/04-fix-FTBFS-clang.patch
  patch -p1 -i ${srcdir}/05-openssl1.1_fix_data_mgmt.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-static \
              --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
