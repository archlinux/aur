# Contributor: Archadept
# Contributor: Xemetrix
#    Revision: 2014-10-17

pkgname=dangerdeep-svn
pkgver=3341
pkgrel=2
pkgdesc="submarine simulator,svn version"
arch=(i686 x86_64)
url="http://dangerdeep.sourceforge.net"
license=('GPL')
depends=(fftw sdl_image sdl_mixer mesa)
makedepends=(scons)
source=('dangerdeep.png' 'dangerdeep.desktop' 'SConstruct' 'matrix3.h' 'subsim.cpp')
md5sums=('969e717f644d67083f482666b50a06d6'
         'baead4d3ea86004547269063f0f973d5'
         '9c08dc3cabd8fdfc81e011d5112c519c'
         'e439379b37332c1be7c065ab457c2454'
         'ab299e4c90daf055d22e95c71aa8d9b2')


_svntrunk=https://dangerdeep.svn.sourceforge.net/svnroot/dangerdeep/trunk/dangerdeep
_svnmod=dangerdeep

build() {
  cd ${srcdir}

  msg "Connecting to SVN server...."

  if [ -d ${_svnmod}/.svn ]; then
  (cd ${_svnmod} && svn up -r $pkgver)
  else
  svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  svn export ${_svnmod} ${_svnmod}-build

  cp ${startdir}/SConstruct ${srcdir}/${_svnmod}-build
  cp ${startdir}/subsim.cpp ${srcdir}/${_svnmod}-build/src
  cp ${startdir}/matrix3.h ${srcdir}/${_svnmod}-build/src

  cd ${_svnmod}-build

  mkdir -p $pkgdir/usr/share/dangerdeep
  scons installbindir=$pkgdir/usr/bin datadir=/usr/share/dangerdeep install || return 1
  
  cp -R $srcdir/dangerdeep/data/* $pkgdir/usr/share/dangerdeep
  
  install -Dm644 ../dangerdeep.png "$pkgdir"/usr/share/pixmaps/dangerdeep.png
  install -Dm644 ../dangerdeep.desktop "$pkgdir"/usr/share/applications/dangerdeep.desktop
}
