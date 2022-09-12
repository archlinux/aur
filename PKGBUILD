# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer at gmail dot com>

_gemname=rubocop
pkgname=ruby-${_gemname}
pkgver=1.36.0
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
source=(
  https://github.com/rubocop/rubocop/archive/v$pkgver/$_gemname-$pkgver.tar.gz
  https://patch-diff.githubusercontent.com/raw/rubocop/rubocop/pull/10992.patch
  https://patch-diff.githubusercontent.com/raw/rubocop/rubocop/pull/10995.patch
)
sha256sums=('9f1bbfe5c21c7001391a7caa907613e73cf5e0cf69db34e1653fffed24e45351'
            '7dafe92c6eb6dd785761ff30f8a9ed4ebdd6feeedbb0f7e9783bd7974b46677a'
            'ab6cad98b4ab49ecbfe13cf4db92c9cb4050c726c5e8e44d17c9079f0bcf4411')

prepare() {
  cd $_gemname-$pkgver

  # fix broken tests
  patch -p1 -N -i "$srcdir/10992.patch"
  patch -p1 -N -i "$srcdir/10995.patch"

  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  sed -i '/asciidoctor/d' Gemfile
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
