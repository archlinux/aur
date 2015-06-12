pkgname=mozilla_password_dump-git
pkgver=20121015
pkgrel=1
pkgdesc="dump firefox/thunderbird passwords into CSV file"
arch=(i686 x86_64)
url="https://github.com/kholia/mozilla_password_dump"
license=('GPL')
depends=('nss' 'nspr' 'sqlite')
makedepends=('git' 'chrpath')

_gitroot=https://github.com/kholia/mozilla_password_dump
_gitname=mozilla_password_dump

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
  chrpath -d mozilla_password_dump
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm0755 mozilla_password_dump $pkgdir/usr/bin/mozilla_password_dump
}
