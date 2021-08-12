# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=mono_logger
pkgname=ruby-$_gemname
pkgver=1.1.1
pkgrel=1
pkgdesc="A lock-free logger for Ruby"
arch=(any)
url=https://github.com/steveklabnik/mono_logger
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-minitest ruby-logger-application)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/steveklabnik/mono_logger/archive/v${pkgver}.tar.gz)
sha256sums=('a4a5f652eda4311c74662e0431bd630317b0c0623b46bbd51470b56239fcc3d0')

prepare() {
  cd $_gemname-$pkgver

  sed -i '/coveralls/d' Gemfile
  sed -i '/simplecov/,+6d' test/mri_logger_test.rb
  sed -i '/coveralls/Id' test/mri_logger_test.rb

  # we use an archive not a git checkout
  sed -i 's|git ls-files|find|' ${_gemname}.gemspec
  sed -i 's/%r{^bin\/}/%r{^\\.\/bin\/}/' ${_gemname}.gemspec
  sed -i 's/%r{^(test|spec|features)\/}/%r{^\\.\/(test|spec|features)\/}/' \
    ${_gemname}.gemspec
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
