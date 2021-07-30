# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=timecop
pkgname=ruby-$_gemname
pkgver=0.9.4
pkgrel=1
pkgdesc='A gem providing "time travel", "time freezing", and "time acceleration" capabilities'
arch=(any)
url=https://github.com/travisjeffery/timecop
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-minitest ruby-nokogiri ruby-mocha ruby-activesupport ruby-tzinfo)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/travisjeffery/timecop/archive/v${pkgver}.tar.gz)
sha256sums=('c7b06c71ebdebc61a89f9ac394c6a9dbd89205350c59af68843c718da2eb3444')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|<|>=|g' Gemfile
  sed -i '/jeweler/d' Gemfile
  sed -i '/pry/d' Gemfile
  sed -i '/minitest-rg/d' Gemfile
  sed -i "s/require 'rdoc\/task'//" Rakefile
  sed -i '/RDocTask/,+14d' Rakefile
  sed -i "s/require 'minitest\/rg'//" test/test_helper.rb
  sed -i '/pry/d' test/test_helper.rb
}

build() {
  cd "$_gemname-$pkgver"
  gem build ${_gemname}.gemspec
}

check() {
  cd "$_gemname-$pkgver"
  rake test
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 History.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
