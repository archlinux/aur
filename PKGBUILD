# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-desktop-git
_pkgname=jasp-desktop
_buildname=jasp-build
pkgver=v0.8.0.0.r0.g7df687e
pkgrel=2
pkgdesc="JASP, a low fat alternative to SPSS, a delicious alternative to R."
arch=('any')
url="http://jasp-stats.org"
license=('AGPL3')
depends=('qt5-base' 'r' 'libarchive' 'qt5-webkit' 'qt5-declarative' 'qt5-sensors' 'qt5-svg' 'tk' 'curl' 'jasp-rbundle')
makedepends=('git' 'r' 'gcc-fortran' 'boost' 'jasp-rbundle')
provides=('jasp' 'jasp-desktop')
conflicts=('jasp' 'jasp-desktop')
install='jasp-desktop-git.install'
options=('!strip')
source=("$_pkgname::git+https://github.com/jasp-stats/$_pkgname.git#tag=v0.8.0.0" 
	"include.patch"
	"sem.patch"
	"rlibrary.patch")

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $srcdir/$_pkgname
  #Patch the R include path
  patch -p1 < $srcdir/include.patch
  #Patch simplesem back into the linux version
  patch -p1 < $srcdir/sem.patch
  #Patch to allow multiple R libraries
  patch -p1 < $srcdir/rlibrary.patch

  #Create separate build dir
  mkdir -p $srcdir/$_buildname
  cd $srcdir/$_buildname
  
  echo "Creating Makefile"
  qmake R_HOME=/usr/lib/R PREFIX=/usr ../$_pkgname
}

build() {
  cd $srcdir/$_buildname
  make 
}

package() {
  #Install files
  cd $srcdir/$_buildname
  mkdir -p $pkgdir/usr/share/$_pkgname
  cp -r R $pkgdir/usr/share/$_pkgname
  cp -r jasp JASPEngine Resources libJASP-Common.a libJASP-Desktop.a $pkgdir/usr/share/$_pkgname/

  #Install icon
  mkdir -p $pkgdir/usr/share/pixmaps/
  cp $srcdir/$_pkgname/Tools/debian/jasp.svg $pkgdir/usr/share/$_pkgname/Resources/

  #Install .desktop file
  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/$_pkgname/Tools/debian/jasp.desktop $pkgdir/usr/share/applications

  #Install link to binary
  mkdir -p $pkgdir/usr/bin/
  ln -s /usr/share/$_pkgname/jasp $pkgdir/usr/bin/JASP
}
md5sums=('SKIP'
         '55f6dd36a413afa371fd112d3afa038e'
         'c7381a233ac6c6d7f6ccd85434f93f41'
         '7359b62112feac921e59346f52a74b4d')
