# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=benchmark-ips
pkgname=ruby-$_gemname
pkgver=2.9.1
pkgrel=1
pkgdesc="Provides iteration per second benchmarking for Ruby"
arch=(any)
url=https://github.com/evanphx/benchmark-ips
license=(MIT)
depends=(ruby)
checkdepends=(ruby-minitest)
makedepends=(rubygems ruby-rdoc ruby-hoe ruby-rake)
options=(!emptydirs)
source=(https://github.com/evanphx/benchmark-ips/archive/$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('ca499ffa6cb6756f612fd7cbaab97f4bbcca99830128cdaf40c91cdfd9edd5c6')

prepare() {
  cd $_gemname-$pkgver
  # there is no license file in the repo, but we can extract one from the readme
  # https://stackoverflow.com/a/35966027
  sed '/## LICENSE:/,$!d' README.md > LICENSE
}

build() {
  cd $_gemname-$pkgver
  rake gem
}

check() {
  cd $_gemname-$pkgver
  rake test
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    pkg/$_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 History.txt "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}

# vim: set ts=2 sw=2 et:
