# $Id: PKGBUILD 214848 2017-03-04 09:22:15Z arojas $
# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>
# Contributor: Prashant Vaibhav <mercurysquad+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Rubin Simons <rubin@xs4all.nl>

pkgname=hfsprogs
pkgver=332.25
pkgrel=15
pkgdesc="HFS/HFS+ user space utils" 
arch=('i686' 'x86_64')
depends=('libbsd' 'openssl')
license=('custom:APSL')
url="http://www.opensource.apple.com/"
source=("https://opensource.apple.com/tarballs/diskdev_cmds/diskdev_cmds-${pkgver}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/h/hfsprogs/${pkgname}_${pkgver}-11.debian.tar.gz"
        "license"
        "makefile.patch")
sha256sums=('74c9aeca899ed7f4bf155c65fc45bf0f250c0f6d57360ea953b1d536d9aa45e6'
            '62d9b8599c66ebffbc57ce5d776e20b41341130d9b27341d63bda08460ebde7c'
            '3bce072b604e0e9baa2151bff91b40915253bfb6d9d9e37445080f526ad486e2'
            '4d9e36010c8bf2b2186ff22b2b30654fb7156bfbbcff0fece717f851f316b6a4')

prepare() {
  # To build the package more than once you have to clear your sources tree after first build
  # or to use the same sources without patching them again (makepkg -e)
  #
  # Apply patches
  cd "diskdev_cmds-${pkgver}"
  for patch in ../debian/patches/*.patch ../makefile.patch
  do
    msg2 "Applying patch ${patch##*/}..."
    patch -Np1 -i "${patch}"
  done
}

build() {
  cd "diskdev_cmds-${pkgver}"
  make -f Makefile.lnx
}

package() {
  # Create required package directories
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  install -m 755 -d "${pkgdir}/usr/share/man/man8/"
  # Copy license file
  install -m 644 "license" "${pkgdir}/usr/share/licenses/${pkgname}/APSL"
  # Copy executable files
  cd "diskdev_cmds-${pkgver}"
  install -m 755 "newfs_hfs.tproj/newfs_hfs" "${pkgdir}/usr/bin/mkfs.hfsplus"
  install -m 755 "fsck_hfs.tproj/fsck_hfs" "${pkgdir}/usr/bin/fsck.hfsplus"
  # Copy shared data
  install -m 644 "newfs_hfs.tproj/hfsbootdata.img" "${pkgdir}/usr/share/${pkgname}/hfsbootdata"
  # Copy man pages
  install -m 644 "newfs_hfs.tproj/newfs_hfs.8" "${pkgdir}/usr/share/man/man8/mkfs.hfsplus.8"
  install -m 644 "fsck_hfs.tproj/fsck_hfs.8" "${pkgdir}/usr/share/man/man8/fsck.hfsplus.8"
}
