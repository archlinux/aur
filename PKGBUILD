# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=logger-application
pkgname=ruby-$_gemname
pkgver=0.0.2
pkgrel=1
pkgdesc="Add logging support to your application"
arch=(any)
url=https://github.com/ruby/logger-application
license=(RUBY custom:BSDL)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-test-unit ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/ruby/logger-application/archive/v${pkgver}.tar.gz)
sha256sums=('02b51c2d3d8387dd8491362aa77ba92783b982dfb8be31c749320caecef9dd5b')

prepare() {
  cd "$_gemname-$pkgver"

  # running the rspec tests depends on mspec, but the source is gone
  # and it still depends on rspec 2.8
  sed -i '/mspec/d' Gemfile

  # we use an archive not a git checkout
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
  sed -i 's/%r{^bin\/}/%r{^\\.\/bin\/}/' ${_gemname}.gemspec
  sed -i 's/%r{^(test|spec|features)\/}/%r{^\\.\/(test|spec|features)\/}/' \
    ${_gemname}.gemspec
}

build() {
  cd "$_gemname-$pkgver"
  gem build ${_gemname}.gemspec
}

check() {
  cd "$_gemname-$pkgver"
  rake test
  # rake spec
}

package() {
  cd "$_gemname-$pkgver"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 BSDL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
