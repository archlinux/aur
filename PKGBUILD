# Maintainer: Henry Graham <hgrahamcs )at( gmail )dot( com>
# Contributor: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
_appname_=tar
pkgname=tar-parallel
pkgver=1.32
pkgrel=3
pkgdesc='Utility used to store, backup, and transport files with parallel compression'
arch=('x86_64')
url='https://www.gnu.org/software/tar/'
license=('GPL3')
depends=('glibc' 'acl' 'attr' 'pigz' 'pbzip2')
options=('!emptydirs')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732') # Sergey Poznyakoff
source=("https://ftp.gnu.org/gnu/${_appname_}/${_appname_}-$pkgver.tar.xz"{,.sig})
md5sums=('83e38700a80a26e30b2df054e69956e5'
         'SKIP')
provides=('tar')
conflicts=('tar')

prepare() {
  cd ${_appname_}-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  :
}

build() {
  cd ${_appname_}-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/tar --with-gzip=pigz --with-bzip2=pbzip2
  make
}

check() {
  cd ${_appname_}-$pkgver
  make check
}

package() {
  cd ${_appname_}-$pkgver
  make DESTDIR="$pkgdir" install
}

