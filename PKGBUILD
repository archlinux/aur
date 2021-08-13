# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rspec-pending_for
pkgname=ruby-${_gemname}
pkgver=0.1.16
pkgrel=1
pkgdesc="Mark specs pending or skipped for specific Ruby engine / version"
arch=(any)
url=https://github.com/pboling/rspec-pending_for
license=(MIT)
depends=(ruby ruby-rspec-core ruby-ruby_engine ruby-ruby_engine)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-minitest ruby-test-unit)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/pboling/rspec-pending_for/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('547e3e770549ea527a81478f5fa758bc813f1063f8fb8e4fbf99ba8a9cf18f9f')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
  sed -i 's|~>|>=|g' Gemfile

  sed -i '/yard/d' Gemfile
  sed -i '/github-markup/d' Gemfile
  sed -i '/redcarpet/d' Gemfile
  sed -i '/pry/d' Gemfile
  sed -i '/byebug/d' Gemfile
  sed -i '/rubocop/d' Gemfile
  sed -i '/simplecov/d' Gemfile
  sed -i '/simplecov/d' spec/spec_helper.rb
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
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
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
