# Maintainer: jakob <grandchild@gmx.net>

pkgname=glmixer-svn
_pkgname=glmixer
pkgver=1.7.1674
pkgrel=1
pkgdesc="Real-time graphics mixing for video performance"
url="http://sourceforge.net/projects/glmixer/"
#install=glmixer.install
changelog=.Changelog
license=('GPL')
arch=('i686' 'x86_64')
provides=('glmixer')
conflicts=('glmixer')
depends=('qt4' 'qtwebkit' 'ffmpeg' 'opencv')
makedepends=('subversion' 'cmake')
#source=("$srcdir/${_pkgname}::svn+http://${_pkgname}.googlecode.com/svn/trunk")
source=("$srcdir/${_pkgname}::svn+http://svn.code.sf.net/p/${_pkgname}/Source/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  local vermaj="$(grep 'GLMIXER_VERSION_MAJOR' CMakeLists.txt | sed 's/[^0-9]*//g')"
  local vermin="$(grep 'GLMIXER_VERSION_MINOR' CMakeLists.txt | sed 's/[^0-9]*//g')"
  local rev="$(svnversion)"
  printf "%s.%s.%s" "${vermaj//[[:alpha:]]}" "${vermin//[[:alpha:]]}" "${rev//[[:alpha:]]}"
}

package() {
	cd $srcdir/${_pkgname}
	cmake -Wno-dev -DCMAKE_BUILD_TYPE:STRING="Release" -DUSE_FREEFRAMEGL:STRING=$(if [ "$CARCH" == "x86_64" ]; then echo "1.6"; else echo "1.5"; fi)
	make
	install -D $srcdir/${_pkgname}/src/${_pkgname} $pkgdir/usr/bin/${_pkgname}
}
