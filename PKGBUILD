#shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=ntfsprogs-plus
pkgname=${pkgbase}
_repo=ntfsprogs-plus/$pkgname
pkgver=1.0.0
pkgrel=2
pkgdesc='NTFS filesystem utilities.'
arch=('x86_64')

depends=('util-linux-libs' 'hwinfo' 'libx86emu')
makedepends=('libgcrypt')

conflicts=('ntfsprogs' 'ntfs-3g' "${pkgname}-git")
provides=('ntfsprogs' 'ntfs-3g' "$pkgname")

url="https://github.com/${_repo}"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
source=("${pkgname}.tar.gz::https://api.github.com/repos/ntfsprogs-plus/ntfsprogs-plus/tarball/refs/tags/1.0.0")
sha256sums=('28f24aa673a81bf84d339cd0842dc7afd571bfa5345b6554fe3760ed6a71e343')

prepare() {
  # Clean up before building
  rm -rf ${srcdir}/${pkgname}.tar.gz ${srcdir}/${pkgname}
  mv ${srcdir}/${pkgname}-* ${srcdir}/${pkgname}

  cd ${srcdir}/${pkgname}
  ./autogen.sh
}

build() {
  cd ${srcdir}/${pkgname}

  ./configure \
    --prefix=/usr \
    --sbin=/usr/bin \
    --includedir=/usr/include/ntfsprogs-plus \
    --mandir=/usr/share/man \
    --disable-ldconfig \
    --enable-xattr-mappings \
    --enable-posix-acls

  make
}

package() {
  cd ${srcdir}/${pkgname}

  make \
    DESTDIR="${pkgdir}" \
    rootbindir=/usr/bin \
    rootsbindir=/usr/bin \
    rootlibdir=/usr/lib \
    install

  # ntfs-3g compat
  ln -s /usr/bin/mount "${pkgdir}/usr/bin/mount.ntfs"
  ln -s /usr/bin/mount "${pkgdir}/usr/bin/mount.ntfsplus"
  ln -s /usr/bin/mount "${pkgdir}/usr/bin/mount.ntfs-3g"
  ln -s /usr/bin/mount "${pkgdir}/usr/bin/mount.lowntfs-3g"
  ln -s /usr/bin/fsck.ntfs "${pkgdir}/usr/bin/ntfsfix"

  # Upstream License
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
