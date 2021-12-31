# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer at gmail dot com>

_gemname=rubocop
pkgname=ruby-${_gemname}
pkgver=1.24.1
pkgrel=1
pkgdesc="A Ruby static code analyzer and formatter"
arch=(any)
depends=(
  ruby
  ruby-parallel
  ruby-parser
  ruby-rainbow
  ruby-regexp_parser
  ruby-rexml
  ruby-rubocop-ast
  ruby-ruby-progressbar
  ruby-unicode-display_width
)
checkdepends=(
  ruby-bundler
  ruby-rake
  ruby-rspec
  ruby-webmock
  ruby-rubocop-rspec
  ruby-rubocop-performance
  ruby-rubocop-rake
  ruby-test-queue
  ruby-yard
  ruby-bump
  ruby-rubocop-rails
)
makedepends=(rubygems ruby-rdoc)
url=https://rubocop.org
license=(MIT)
options=(!emptydirs)
source=(https://github.com/rubocop/rubocop/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('4208418c061e77a232a70ecc9616aa046f065a3211000575226d56dbfb92f31e')

prepare() {
  cd $_gemname-$pkgver

  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  sed -i '/memory_profiler/d' Gemfile
  sed -i '/simplecov/d' Gemfile
  sed -i '/stackprof/d' Gemfile
  sed -i 's|~>|>=|g' Gemfile

  sed -i '/group/d' Gemfile
  sed -i '/end/d' Gemfile
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake spec
  rake ascii_spec
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
