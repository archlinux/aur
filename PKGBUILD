# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Remi Gacogne <rgacogne-arch at coredump dot fr>

set -u
pkgname='ht-editor'
pkgver='2.1.0'
pkgrel='2'
pkgdesc='An open source executable file editing tool that supports the MZ, PE and LE file formats including code analyzer.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/hte/'
#url='https://github.com/sebastianbiallas/ht'
license=('GPL')
depends=('ncurses' 'lzo' 'libx11' 'gcc-libs')
# lzo provides lzo2
source=("http://sourceforge.net/projects/hte/files/ht-source/ht-${pkgver}.tar.bz2")
source+=('0000-abs-uint-ambiguous.patch')
sha256sums=('31f5e8e2ca7f85d40bb18ef518bf1a105a6f602918a0755bc649f3f407b75d70'
            '58e7a080756eb81ae8ca479d909bcd375e40a359b43e6b70a0177f2c28ace938')

prepare() {
  set -u
  cd "ht-${pkgver}"
  # https://stackoverflow.com/questions/1100090/looking-for-an-efficient-integer-square-root-algorithm-for-arm-thumb2
  #diff -pNau5 htapp.cc{.orig,} > '../0000-abs-uint-ambiguous.patch'
  patch -Nbup0 -i "${srcdir}/0000-abs-uint-ambiguous.patch"
  set +u
}

build() {
  set -u
  cd "ht-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    ./configure --enable-release
  fi
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "ht-${pkgver}"
  install -Dpm755 'ht' "${pkgdir}/usr/bin/ht-editor"
  set +u
}
set +u
