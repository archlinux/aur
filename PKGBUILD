# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-desktop-git
_pkgname=jasp-desktop
_buildname=jasp-build
pkgver=v0.7.1.7.r0.g4885971
pkgrel=4
pkgdesc="JASP, a low fat alternative to SPSS, a delicious alternative to R."
arch=('any')
url="http://jasp-stats.org"
license=('AGPL3')
depends=('qt5-base' 'boost' 'r' 'libarchive' 'zlib' 'qt5-webkit' 'qt5-declarative' 'qt5-sensors' 'qt5-svg')
makedepends=('git' 'qtchooser' 'r' 'boost-nowide' 'gcc-fortran')
provides=('jasp' 'jasp-desktop')
conflicts=('jasp' 'jasp-desktop')
install=('jasp-desktop-git.install')
source=("$_pkgname::git+https://github.com/jasp-stats/$_pkgname.git#tag=v0.7.1.7" 
	"rbundle.R"
	"jasp-desktop.svg"
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
  patch -p1 < $srcdir/sem.patch
  echo "Patching in the SEM feature. This feature is UNSUPPORTED by the developer currently"
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
	  R CMD INSTALL -l $srcdir/$_buildname/R/library/ $srcdir/$_pkgname/JASP-Engine/JASP

	  ## Save new R bundle for future use
	  echo "Creating R bundle backup for future compilation"
	  cp -r R $srcdir/RBundle
  else
	  echo "Restoring previously created R bundle"
	  cp -r $srcdir/RBundle/* ./R
  fi

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
  mkdir -p $pkgdir/usr/share/$_pkgname
  cp -r ./Help ./JASP ./JASPEngine ./Resources ./R $pkgdir/usr/share/$_pkgname/

  #Install icon
  mkdir -p $pkgdir/usr/share/pixmaps/
  cp $srcdir/jasp-desktop.svg $pkgdir/usr/share/pixmaps/

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
         '85087ac1d6e0ffa885f4887c40985982'
         'bcaf403001283553bb63b72c268d0290'
         '9e04c417faac1e36f7ddb9f8350620ab')
