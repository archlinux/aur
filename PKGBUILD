# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=cyrus-sasl-xoauth2-git
pkgrel=1
pkgver=r17.6379368
pkgdesc="XOAUTH2 mechanism plugin for cyrus-sasl"
arch=(x86_64)
url="https://github.com/moriyoshi/cyrus-sasl-xoauth2"
license=('MIT')
depends=('libsasl')
source=(git+https://github.com/moriyoshi/cyrus-sasl-xoauth2.git)
md5sums=('SKIP')

_gitroot=https://github.com/moriyoshi/cyrus-sasl-xoauth2.git
_gitname=master

pkgver() {
  cd "cyrus-sasl-xoauth2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
