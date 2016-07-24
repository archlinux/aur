_npmname=vinefeed
pkgname="nodejs-$_npmname"
pkgver=0.1.0
pkgrel=2
pkgdesc="RSS/Atom feed generator for Vine users"
arch=(any)
url="http://github.com/tremby/vinefeed"
license=('GPL')
depends=('nodejs' 'npm')
optdepends=()
source=("$_npmname".{service,socket}
        'binary.patch'
        'socket-activation.patch')
md5sums=('e91569a2035064f52e321653ba26172e'
         '0de7e38748a53ec8d96c2dd645e8bb2e'
         '8b8cd5d387347f3632a80827b161bd76'
         '8f4df9f6102f3078bebe89213320492a')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
md5sums+=('SKIP')
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

prepare() {
  cd "$_gitname"
  patch -p1 -i ../binary.patch
  patch -F3 -p1 -i ../socket-activation.patch
}

pkgver() {
  cd "$_gitname"
  grep -Po '(?<="version": ").*(?=")' package.json | tr '\n' '.'
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dt "$pkgdir/usr/lib/systemd/user/" "$_npmname".{service,socket}

  cd "$_gitname"
  npm install -g --prefix "$pkgdir/usr" --production
  rmdir "$pkgdir/usr/etc"
}
