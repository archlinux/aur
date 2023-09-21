# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: zxalexis <zxalexis@gmail.com>

set -u
pkgname='wipefreespace'
pkgver='2.6'
pkgrel='1'
pkgdesc='Securely wipe the free space on an ext2/3/4,NTFS, XFS, ReiserFSv3, ReiserFSv4, FAT12/16/32, Minix, JFS and HFS+ partition or drive'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/wipefreespace'
license=('GPL')
_verwatch=("${url}/rss" ".*<title>.*/${pkgname}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
source=(
  "https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  '0000-sysmacros.patch'
)
md5sums=('7e52f8f44ebca3d89af7148de87d5139'
         'fb1e4e01526cdfa3f853e2b2b99b71f1')
sha256sums=('3ede8c0d0f704896cbe2d5bfa9c913a45b2f13d15d5c8929fd09a761295647f3'
            '500c4e1fa566be22e3b07e1bcf0a36b0f18d8f46ac9922e603e1a42edb2b7902')

prepare() {
  set -u
  cd "${pkgbase}-${pkgver}"

  # diff -pNau3 src/wfs_util.c{.orig,} > '0000-sysmacros.patch'
  patch -Nbup0 -i "${srcdir}/0000-sysmacros.patch"

  set +u
}

build() {
  set -u
  cd "${pkgbase}-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    CFLAGS="${CFLAGS} -Wno-unused-result" \
    ./configure --prefix='/usr'
    echo '#define HAVE_LINUX_LOOP_H 1' >> 'config.h'
  fi
  make -s
  set +u
}

package () {
  set -u
  cd "${pkgbase}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
