# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname='sctk'
pkgver=2.4.11
pkgrel=1
_commit='20159b580249f1598caa35ab469bd1acdb3dd86c'
pkgdesc='Speech Recognition Scoring Toolkit (SCTK)'
arch=('i686' 'x86_64')
url='https://github.com/usnistgov/SCTK'
license=('custom')
source=("git+https://github.com/usnistgov/SCTK.git#commit=${_commit}")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/SCTK"
  
  make config

  if  [ "$HOSTTYPE" == "x86_64" ];
  then
    sed -i "s/^CFLAGS = -g -Os/CFLAGS = -g -Os -m64/g" src/asclite/core/makefile
    sed -i "s/^CFLAGS = -g -Os/CFLAGS = -g -Os -m64/g" src/asclite/test/makefile
    sed -i "s/^CFLAGS = -g -Os/CFLAGS = -g -Os -m64/g" src/rfilter1/makefile
    sed -i "s/^CFLAGS = -g -Os/CFLAGS = -g -Os -m64/g" src/sclite/makefile
  fi
  sed '/^DEFS/s/ -Dsize_t=unsigned//' -i src/sclite/makefile
}

build () {
  cd "${srcdir}/SCTK"

  make all
  make doc
}

check() {
  cd "${srcdir}/SCTK"

  make check
}

package () {
  cd "${srcdir}/SCTK"
  
  mkdir -p "${pkgdir}/usr/bin"
  make prefix="${pkgdir}/usr" install

  mkdir -p "${pkgdir}/usr/share/doc/sctk"
  cp -r doc/* "${pkgdir}/usr/share/doc/sctk"
}
