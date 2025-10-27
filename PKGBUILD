# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgname=ntfsprogs-plus
_repo=ntfsprogs-plus/$pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc='NTFS filesystem utilities'
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://github.com/${_repo}"
depends=('util-linux')
makedepends=(
  'git'
  'jq'
  'autoconf'
  'automake'
  'libtool'
  'libgcrypt'
  'pkgconf'
)
conflicts=('ntfsprogs' 'ntfs-3g' 'ntfsprogs-plus-git')
provides=('ntfsprogs' "$pkgname")
source=("${pkgname}.tar.gz::https://api.github.com/repos/ntfsprogs-plus/ntfsprogs-plus/tarball/refs/tags/1.0.0")
sha256sums=('32cf8c6a876efa9dbb7418187b3d00e6004d1894518e75047eb7ed338dcbf9e6')

prepare() {
  rm -f ${srcdir}/${pkgname}.tar.gz
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
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
