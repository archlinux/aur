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
md5sums=('8e09674dfcf9ba971f2a436bb2c55e1a'
         '7e5a337a2598b938d605d8c49f8984ea'
         'ad657d580e728305638c1285dd47d77c'
         'e9346c6ee335dff8fc4e28ac6843d2af')

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
