# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=hashie
pkgname=ruby-$_gemname
pkgver=4.1.0
pkgrel=1
pkgdesc="a collection of classes and mixins that make Ruby hashes more powerful"
arch=(any)
url=https://github.com/hashie/hashie
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rake ruby-rspec ruby-rspec-pending_for)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/hashie/hashie/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('4c67b8f6b347d83bdcad76dea208798e4152c3c067f40581f745216c71998982')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|~>|>=|g' Gemfile

  sed -i '/benchmark/d' Gemfile
  sed -i '/guard/d' Gemfile
  sed -i '/pry/d' Gemfile
  sed -i '/rubocop/d' Gemfile
  sed -i '/danger/d' Gemfile
  sed -i '/simplecov/d' Gemfile

  sed -i '/rubocop/Id' Rakefile
  sed -i '/bundler/Id' Rakefile
  sed -i '/pry/d' spec/spec_helper.rb

  # https://github.com/hashie/hashie/pull/533
  sed -i "/require 'hashie'/a require 'json'" spec/spec_helper.rb
  sed -i "/require 'json'/a require 'tempfile'" spec/spec_helper.rb
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake spec
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
