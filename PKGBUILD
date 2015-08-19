# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-desktop-git
_pkgname=jasp-desktop
_buildname=jasp-build
pkgver=r1753.2e53da4
pkgrel=1
pkgdesc="JASP, a low fat alternative to SPSS, a delicious alternative to R."
arch=('any')
url="http://jasp-stats.org"
license=('AGPL3')
depends=('qt5-base' 'boost' 'pcre' 'libarchive' 'zlib' 'boost-nowide')
makedepends=('git' 'qtchooser' 'r' 'icoutils')
provides=('jasp' 'jasp-desktop')
conflicts=('jasp' 'jasp-desktop')
source=("$_pkgname::git+https://github.com/jasp-stats/$_pkgname.git" 
        "https://static.jasp-stats.org/development/R%20U1410%20for%20JASP%20%282015-02-19%29.zip"
	"rbundle.R")
options=("!strip" "debug")

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p $srcdir/$_buildname
  cd $srcdir/$_buildname
  
  #Create new R bundle
  mkdir -p R/include
  _libraryPath=$srcdir/$_buildname/R/library
  if [ ! -e $srcdir/RBundle ]; then
	  echo "Creating customized R bundle"
	  echo "Copying R bin, etc, lib, modules, and base libs"
	  cp -r /usr/lib/R/{bin,etc,lib,modules,library} R/
	  rm R/bin/R
	  ln -s $(which R) R/bin/R
	  echo "Copying R headers"
	  cp -r /usr/include/R/* R/include/
	  echo "Installing JASP dependencies"
	  Rscript $srcdir/rbundle.R $_libraryPath

	  #Copy JASP to new R bundle for it to later compile
	  echo "Installing JASP to bundle"
	  R CMD INSTALL -l $srcdir/$_buildname/R/library/ $srcdir/$_buildname/JASP-Engine/JASP

	  #Copy modified gnm to bundle
	  echo "Copying modified gnm from packaged bundle to created bundle"
	  cp -r $srcdir/R/library/gnm $srcdir/$_buildname/R/library/
	  
	  ## Save new R bundle for future use
	  echo "Creating R bundle backup for future compilation"
	  cp -r R $srcdir/RBundle
  else
	  echo "Restoring previously created R bundle"
	  cp -r $srcdir/RBundle/* ./R
  fi
  #term.h needs #include <vector>
  #sed -i -e '5i\#include <vector>\n' $srcdir/$_pkgname/JASP-Desktop/term.h

  echo "Creating Makefile"
  qmake PREFIX=/usr ../$_pkgname
}

build() {
  cd $srcdir/$_buildname
  make 

  #Grab icon
  cd $srcdir/$_pkgname/JASP-Desktop/
  mkdir imgs
  icoutils -x -o imgs -w 256 icon.ico
  cd imgs
  mv icon_1_256x256x32.png jasp-desktop.png
}

package() {
  #Install files
  cd $srcdir/$_buildname
  mkdir -p $pkgdir/usr/share/$_pkgname
  cp -r ./Help ./JASP ./JASPEngine ./Resources ./R $pkgdir/usr/share/$_pkgname/

  #Install icon
  mkdir -p $pkgdir/usr/share/pixmaps/
  cp $srcdir/$_pkgname/JASP-Desktop/imgs/jasp-desktop.png $pkgdir/usr/share/pixmaps

  #Install .desktop file
  mkdir -p $pkgdir/usr/share/applications
cat  << EOF > $pkgdir/usr/share/applications/jasp-desktop.desktop
[Desktop Entry]
Name=JASP Desktop
GenericName=Statistical Program
Comment=A low fat alternative to SPSS, a delicious alternative to R.
Exec=/usr/share/jasp-desktop/JASP
Icon=jasp-desktop
Type=Application
Categories=Science;
EOF
}
md5sums=('SKIP'
         '03a719ec42763bed930fe265c8cd3b41'
         '21deab63134207840ff88bdc39504ef1')
