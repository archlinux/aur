# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=guard-compat
pkgname=ruby-${_gemname}
pkgver=1.2.1
pkgrel=1
pkgdesc="Test helper for testing Guard plugins"
arch=(any)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rspec ruby-rake)
makedepends=(git rubygems ruby-rdoc)
url=https://github.com/guard/guard-compat
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/guard/guard-compat.git?tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd $_gemname
  sed -i '/rubocop/d' Gemfile
  sed -i '/rubocop/d' Rakefile
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
}

build() {
  cd $_gemname
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  rake spec
}

package() {
  cd $_gemname
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
}

# vim: set ts=2 sw=2 et:
