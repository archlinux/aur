# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=regexp_property_values
pkgname=ruby-${_gemname}
pkgver=1.2.0
pkgrel=1
pkgdesc="Inspect property values supported by Ruby's regex engine"
arch=(x86_64)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
url=https://github.com/jaynetics/regexp_property_values
license=(MIT)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('4ce0ac93f73e78d5016e1401d7fa4b3e26f6fc4c83e4e6d463f3252cdf31ebcd')

prepare() {
  cd $_gemname-$pkgver

  # we use an archive not a git checkout
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
  sed -i 's/%r{^(test|spec|features)\/}/%r{^\\.\/(test|spec|features)\/}/' \
    ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
