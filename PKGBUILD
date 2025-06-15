# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: zxalexis <zxalexis@gmail.com>

set -u
pkgname='wipefreespace'
pkgver='3.0'
pkgrel='1'
pkgdesc='Securely wipe the free space on an ext2/3/4,NTFS, XFS, ReiserFSv3, ReiserFSv4, FAT12/16/32, Minix, JFS and HFS+ partition or drive'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/wipefreespace'
license=('GPL-2.0-only')
depends=('glibc' 'libcap')
optdepends=(
  'e2fsprogs: ext2 ext3 ext4 support'
  'ntfs3g: NTFS support'
  'xfsprogs: xfs support'
)
#_verwatch=("${url}/rss" ".*<title>.*/${pkgname}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
_srcdir="${pkgname}-${pkgver}"
source=(
  "https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${_srcdir}.tar.gz"
  '0000-sysmacros.patch'
)
md5sums=('573f959d35a06fb5624e9116a862db9b'
         '776e57109f3c2e9559e052982c1b048c')
sha256sums=('6ff55ce6fca0613f730eb6cc6d9f3dd10e5de341005546167455aec1d91af4dc'
            'b1c8b390417d1305d0b8aa5033a3a65628c1a1db4081762c4714db9b47901eae')

prepare() {
  set -u
  cd "${_srcdir}"
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"
  patch -Nbup1 -i "${srcdir}/0000-sysmacros.patch"

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    export CFLAGS="${CFLAGS} -Wno-unused-result"
    local _conf=( ##CONF
      --disable-REISERFS
      --disable-REISER4
      --prefix='/usr'
    )
    ./configure "${_conf[@]}"
    #echo '#define HAVE_LINUX_LOOP_H 1' >> 'config.h'
  fi
  make -s
  set +u
}

package () {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
