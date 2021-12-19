# Maintainer: okhsunrog <me@gornushko.com>

pkgname=ntfsprogs-ntfs3
_pkgname=ntfs-3g_ntfsprogs
pkgver=2021.8.22
pkgrel=8
pkgdesc='NTFS filesystem utilities without NTFS-3G driver. For system with kernel >= 5.15'
url='https://www.tuxera.com/community/open-source-ntfs-3g/'
arch=('x86_64')
license=('GPL2')
depends=('util-linux')
source=("https://tuxera.com/opensource/${_pkgname}-${pkgver}.tgz")
sha256sums=('55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb')

conflicts=('ntfsprogs' 'ntfs-3g')
provides=('ntfsprogs' 'ntfs-3g')
replaces=('ntfsprogs' 'ntfs-3g')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed 's|$(DESTDIR)/sbin|$(DESTDIR)/usr/bin|' -i {ntfsprogs,src}/Makefile.in
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sbin=/usr/bin \
    --mandir=/usr/share/man \
    --disable-ldconfig \
    --disable-static \
    --enable-xattr-mappings \
    --enable-posix-acls \
    --enable-extras \
    --disable-ntfs-3g

  make ntfsprogs
}

package() {
  cd ${_pkgname}-${pkgver}
  make ntfsprogs DESTDIR="${pkgdir}" rootbindir=/usr/bin rootsbindir=/usr/bin rootlibdir=/usr/lib install
  rm "${pkgdir}"/usr/share/man/man8/ntfsfallocate.8 # uninstalled binary
  echo '#! /bin/sh

# mount.ntfs : catch {,-tauto,-tntfs} NTFS mounts
# ===============================================
# (c) DLCB 2/11-2021

exec mount -tntfs3 "$@"' >  "${pkgdir}"/usr/bin/mount.ntfs
chmod +x "${pkgdir}"/usr/bin/mount.ntfs
mkdir -p "${pkgdir}"/etc/udev/rules.d/
echo 'SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="ntfs", ENV{ID_FS_TYPE}="ntfs3"' > "${pkgdir}"/etc/udev/rules.d/99-udisks2-ntfs.rules

}

