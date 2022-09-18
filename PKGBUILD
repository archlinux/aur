# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Mario Finelli <mario at finel dot li>

_gemname=dry-container
pkgname=ruby-$_gemname
pkgver=0.11.0
pkgrel=1
pkgdesc='A simple container intended for use as an IoC container'
arch=('any')
url='https://github.com/dry-rb/dry-container'
license=('MIT')
depends=('ruby' 'ruby-concurrent')
makedepends=('git' 'ruby-rdoc')
options=('!emptydirs')
_commit='eff66c2e4bac92d9e888a8900c9f711a21913949'
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

  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --local \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  rm -vrf "$pkgdir/$_gemdir/cache"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
