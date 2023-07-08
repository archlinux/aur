# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=ruby-sigdump
_pkgname="${pkgname#ruby-}"
pkgver=0.2.5
pkgrel=1
pkgdesc='Use signal to show stacktrace of a Ruby process without restarting it'
arch=('any')
url='https://github.com/fluent/sigdump'
license=('Apache')
depends=('ruby')
makedepends=('git')
options=('!emptydirs')
_commit='5be55405d18b43e70f30fb397376014a88d4b8fd'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  gem build "$_pkgname.gemspec"
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
    "$_pkgname-$pkgver.gem"

  # delete cache
  rm -rf "$pkgdir/$_gemdir/cache"
}
