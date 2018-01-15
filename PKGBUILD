# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-desktop-git
_pkgname=jasp-desktop
_buildname=jasp-build
pkgver=v0.8.5.r0.g3242143a
pkgrel=1
pkgdesc="JASP, a low fat alternative to SPSS, a delicious alternative to R."
arch=('any')
url="http://jasp-stats.org"
license=('AGPL3')
depends=('qt5-base' 'r' 'libarchive' 'qt5-webkit' 'qt5-declarative' 'qt5-sensors' 'qt5-svg' 'tk' 'curl' 'jasp-rbundle' 'r-cran-rinside')
makedepends=('git' 'r' 'gcc-fortran' 'boost' 'jasp-rbundle' 'r-cran-rinside')
provides=('jasp' 'jasp-desktop')
conflicts=('jasp' 'jasp-desktop')
options=('!strip')
source=("$_pkgname::git+https://github.com/jasp-stats/$_pkgname.git#tag=v0.8.5" 
	"include.patch"
	"sem.patch")

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
  patch -p1 < $srcdir/sem.patch
  #Create separate build dir
  mkdir -p $srcdir/$_buildname
  cd $srcdir/$_buildname
  
  echo "Creating Makefile"
  qmake PREFIX=/usr ../$_pkgname
}

build() {
  cd $srcdir/$_buildname
  make 
}

package() {
  #Install files
  cd $srcdir/$_buildname
  mkdir -p $pkgdir/usr/lib/JASP
  
  cp -r ./R ./jasp ./JASPEngine ./Resources $pkgdir/usr/lib/JASP

  #Install icon
  cp $srcdir/$_pkgname/Tools/debian/jasp.svg $pkgdir/usr/lib/JASP/Resources/

  #Install .desktop file
  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/$_pkgname/Tools/debian/jasp.desktop $pkgdir/usr/share/applications

  #Install link to binary
  mkdir -p $pkgdir/usr/bin/
  ln -s /usr/lib/JASP/jasp $pkgdir/usr/bin/JASP
}
md5sums=('SKIP'
         '846d0f24ef877c895ae027aed7588bdc'
         'bdb0cabaf21cb7b59b75be1cd25b3ec5')
