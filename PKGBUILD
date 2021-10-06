# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-rails
pkgname=ruby-${_gemname}
pkgver=2.12.3
pkgrel=1
pkgdesc="Automatic Rails code style checking tool"
arch=(any)
depends=(ruby ruby-rubocop ruby-activesupport ruby-rack)
checkdepends=(ruby-bundler ruby-rake ruby-rspec ruby-yard ruby-bump
              ruby-rubocop-performance ruby-rubocop-rspec ruby-test-queue)
makedepends=(rubygems ruby-rdoc)
url=https://docs.rubocop.org/rubocop-rails/
license=(MIT)
options=(!emptydirs)
source=(https://github.com/rubocop/rubocop-rails/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('b8a21f7e95b503637ee1b1bbe43b0010a8a21be1c5893929922cf51ece2afd99')

prepare() {
  cd $_gemname-$pkgver
  sed -i '/yard/d' Gemfile
  sed -i '/simplecov/d' Gemfile
  sed -i "s/, github: 'rubocop\/rubocop'//" Gemfile
  sed -i 's|git ls-files|find|' ${_gemname}.gemspec
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
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

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
