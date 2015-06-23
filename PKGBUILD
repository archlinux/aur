pkgname=okular-git
pkgver=20140311
pkgrel=1
pkgdesc='KDE document viewer'
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde.org/"
depends=('kdebase-runtime' 'qimageblitz' 'poppler-qt' 'chmlib' \
	 'djvulibre' 'ebook-tools' 'libspectre')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('kdegraphics-okular')
provides=('kdegraphics-okular')
groups=('kde4-git')

_gitroot="git://anongit.kde.org/okular.git"
_gitname="okular"

build() {

cd $srcdir

  msg "Connecting to the GIT server..."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot --depth=1
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  if [[ -d $srcdir/$_gitname-build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf $srcdir/$_gitname-build
  fi
  mkdir $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  cmake $srcdir/$_gitname -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/$_gitname-build
  make DESTDIR=${pkgdir} install
}
