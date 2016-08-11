_npmname=vinefeed
pkgname="nodejs-$_npmname"
pkgver=0.1.0.r11
pkgrel=1
pkgdesc="RSS/Atom feed generator for Vine users"
arch=(any)
url="http://github.com/tremby/vinefeed"
license=('GPL')
depends=('nodejs' 'npm' 'coffee-script')
optdepends=()

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

pkgver() {
  cd "$_gitname"
  grep -Po '(?<="version": ").*(?=")' package.json | tr '\n' '.'
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  npm install -g --prefix "$pkgdir/usr" --production
  install -Dt "$pkgdir/usr/lib/systemd/user/" "$_npmname".{service,socket}
  rmdir "$pkgdir/usr/etc"
}
