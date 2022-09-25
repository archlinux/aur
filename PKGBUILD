# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-files
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=1
pkgdesc='A library that provides a great abstraction for file manipulations'
arch=('any')
url='https://github.com/dry-rb/dry-files'
license=('MIT')
depends=('ruby')
makedepends=('git' 'ruby-rdoc')
options=('!emptydirs')
_commit='9698aeb5e5578b6861d96ec33934b7d2eda1eaa8'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  gem build
}

package() {
  cd "$pkgname"

  local _gemdir="$(gem env gemdir)"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  rm -rf "$pkgdir/$_gemdir/cache"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE 
}
