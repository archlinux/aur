# Contributor: Archadept
#    Revision: 2014-10-24

pkgname=astromenace-svn
pkgver=293
pkgrel=1
pkgdesc="The latest version of hardcore 3D space shooter with spaceship upgrade possibilities"
arch=x86_64
url="http://www.viewizard.com/astromenace/index_linux.php"
license=('GPL3')
conflicts=astromenace
depends=('sdl2' 'freealut'  'libjpeg'  'libvorbis'  'glu'  'freetype2')
makedepends=('cmake')
source=('astromenace.desktop')
md5sums=('b89aa017cdf9db1d6fe085889f8388fc')

_svnsource=svn://svn.code.sf.net/p/openastromenace/code
_svnmod=astromenace
build() {
  cd "${srcdir}"
  msg "Connecting to gna SVN server..."
  msg "Checking out $_svnmod"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svnsource --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Setting up build environment..."

  rm -rf ${srcdir}/$_svnmod-build
  cp -r ${_svnmod} ${_svnmod}-build || return 1
  cd ${_svnmod}-build

  msg "Starting build"

  cd "${srcdir}/${_svnmod}-build"
  cmake -DSDL2=ON ./
  make

  ./AstroMenace --pack --rawdata=./RAW_VFS_DATA
}

package () {
  # Manually install the engine and data
  mkdir -p $pkgdir/usr/share/${_svnmod}
  install -m 644 $srcdir/${_svnmod}-build/gamedata.vfs $pkgdir/usr/share/${_svnmod}/gamedata.vfs

  # Install .desktop, icon and bin
  install -Dm 644 ${startdir}/astromenace.desktop $pkgdir/usr/share/applications/astromenace.desktop
  install -Dm 644 ${srcdir}/${_svnmod}-build/astromenace_128.png $pkgdir/usr/share/pixmaps/astromenace.png
  install -Dm 755 ${srcdir}/${_svnmod}-build/AstroMenace $pkgdir/usr/bin/astromenace
  cd $pkgdir/usr/bin
  ln -s /usr/share/astromenace/gamedata.vfs gamedata.vfs
}
