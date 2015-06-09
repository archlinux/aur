# Maintainer: Allen Li <darkfeline@abagofapples.com>
pkgname=python-pymysql-git
pkgver=20130105
pkgrel=1
pkgdesc="Pure Python MySQL Client"
arch=(any)
url="https://github.com/petehunt/PyMySQL"
license=('GPL')
license=('BSD')
depends=('python')
makedepends=('git' 'python-distribute')
conflicts=('pymysql')

_gitroot="https://github.com/petehunt/PyMySQL"
_gitname=pymysql

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

  ./build-py3k.sh
  cd py3k
  python setup.py install --root="$pkgdir" --prefix=/usr
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
