# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>

pkgname=hpgl
pkgver=0.9.9
pkgrel=1
pkgdesc="HPGL stands for 'High Performance Geostatistics Library'. The goal of this project is to provide free-to-use and modify high-perfomance geostatistical algorithms (such as Kriging, CoKriging, Sequential Simulation, etc)."
arch=('any')
license=('bsd')
url="http://hpgl.sourceforge.net/"
depends=('python2-numpy' 'python2-scipy')
makedepends=('python2-distribute' 'scons' 'boost')
optdepends=()
source=(http://downloads.sourceforge.net/project/hpgl/hpgl/0.9.9/hpgl-bsd-0.9.9_src.tar.gz)
md5sums=('a3f17cc720f662ea9d8662c1380b6b29')
provides=('hpgl')
conflicts=('hpgl-git')

build() {
  # compile libfc2 and tmglib
  cd "$srcdir/CLAPACK-3.1.1.1"
  make f2clib
  make tmglib
  ln -s tmglib_LINUX.a libtmglib.a
  #ln -s F2CLIBS/libf2c.a libf2c.a

  # configure & compile HPGL
  cd "${srcdir}/"
  scons -c
  scons -j4

  # assemble package & install
  mkdir ${srcdir}/temp/geo_bsd
  cp geo_bsd/*.py ${srcdir}/temp/geo_bsd
  cp geo_bsd/*.so ${srcdir}/temp/geo_bsd
  cp setup.py ${srcdir}/temp/
  cd ${srcdir}/temp/
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}