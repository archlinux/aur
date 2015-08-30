pkgname=lwt-git
pkgver=20150830
pkgrel=1
pkgdesc="Lightweight terminal emulator based on the VTE and GTK libraries."
url="https://github.com/mewkiz/lwt"
arch=('x86_64' 'i686')
license=('public domain')
depends=('gtk3' 'vte3')
makedepends=('git')
conflicts=('lwt')

_gitroot='https://github.com/mewkiz/lwt.git'
_gitname='lwt'

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

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/usr" install
}
