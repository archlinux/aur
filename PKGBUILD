# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=gophcatch-git
pkgver=20111106
pkgrel=1
pkgdesc="Watch gopher holes and catch updates"
arch=('any')
url="https://github.com/vain/gophcatch"
license=('custom:PIZZA-WARE')
depends=('curl')
makedepends=('git')
optdepends=(
  'lynx: Needed if you want to dump new items'
  'cron: Recommended if you want to regularly run gophcatch'
)

_gitroot="git://github.com/vain/gophcatch.git"
_gitname="master"

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
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 gophcatch "$pkgdir"/usr/bin/gophcatch
  install -Dm644 man1/gophcatch.1 "$pkgdir"/usr/share/man/man1/gophcatch.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 gocrc-example \
    "$pkgdir"/usr/share/doc/gophcatch/gocrc-example
}

# vim:set ts=2 sw=2 et:
