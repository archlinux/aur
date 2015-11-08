pkgname=deadbeef-plugin-quick-search-git
pkgver=20150510
pkgrel=1
pkgdesc="Quick playlist search bar plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/cboxdoerfer/ddb_quick_search"
arch=('i686' 'x86_64')
license='GPL2'
depends=('deadbeef' 'gtk2')
makedepends=('git' 'pkg-config')

_gitname=ddb_quick_search
_gitroot=https://github.com/cboxdoerfer/${_gitname}

build() {
  cd $srcdir
  msg "Connecting to GIT server..."
  rm -rf $srcdir/$_gitname-build

  if [ -d $_gitname ]; then
    cd $_gitname
    git pull origin master
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir
  cp -r $_gitname $_gitname-build

  cd $_gitname-build

  touch AUTHORS
  touch ChangeLog

  make -j`nproc`
}

package() {
  install -D -v -c $srcdir/$_gitname-build/gtk2/ddb_misc_quick_search_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_misc_quick_search_GTK2.so
  install -D -v -c $srcdir/$_gitname-build/gtk3/ddb_misc_quick_search_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_quick_search_GTK3.so
}

