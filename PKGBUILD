# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=ntfsprogs-plus
pkgname=${pkgbase}
_repo=ntfsprogs-plus/$pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc='NTFS filesystem utilities'
arch=('x86_64')
license=('0BSD')
url="https://github.com/${_repo}"
depends=('util-linux-libs')
conflicts=('ntfsprogs' 'ntfs-3g' 'ntfsprogs-plus-git')
provides=('ntfsprogs' "$pkgname" 'ntfs-3g')
source=("${pkgname}.tar.gz::https://api.github.com/repos/ntfsprogs-plus/ntfsprogs-plus/tarball/refs/tags/1.0.0")
sha256sums=('28f24aa673a81bf84d339cd0842dc7afd571bfa5345b6554fe3760ed6a71e343')

prepare() {
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
    --enable-posix-acls \
    --enable-extras \
    --enable-crypto
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

  # License
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
