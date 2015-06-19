pkgname='libmrss-git'
pkgdesc='RSS parsing library including PHP module'
url='http://github.com/kstep/libmrss'
pkgrel=1
pkgver=20130403
arch=('i686' 'x86_64')
provides=('libmrss')
depends=('php' 'libnxml')
makedepends=('git')
license=('LGPL')

_gitroot='git://github.com/kstep/libmrss.git'
_gitname='libmrss'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix=/usr
  make

  msg "Building PHP module..."
  cd "$srcdir/$_gitname-build/phpmrss"
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" EXTENSION_DIR="$pkgdir/usr/lib/php/modules" install

  mkdir -p "$pkgdir/etc/php/conf.d"
  echo ";extension=mrss.so" > "$pkgdir/etc/php/conf.d/mrss.ini"
}

# vim:set ts=2 sw=2 et:
