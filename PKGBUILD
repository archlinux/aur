# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>

_gemname=parser
pkgname=ruby-${_gemname}
pkgver=3.0.2.0
pkgrel=2
pkgdesc="A Ruby parser written in pure Ruby"
arch=(any)
depends=(ruby ruby-ast)
checkdepends=(ruby-rake ruby-minitest)
makedepends=(rubygems ruby-rdoc ragel ruby-racc ruby-cliver ruby-rake ruby-bundler)
url=https://github.com/whitequark/parser
license=(MIT)
source=(https://github.com/whitequark/parser/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
options=(!emptydirs)
sha256sums=('34654473ac443f6fdff71082fc6e6a26effd2eb45a15c0a52937b7eedf37bb33')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec

  sed -i '/simplecov/d' ${_gemname}.gemspec
  sed -i '/kramdown/d' ${_gemname}.gemspec
  sed -i '/gauntlet/d' ${_gemname}.gemspec
  sed -i '/yard/d' ${_gemname}.gemspec

  sed -i "s/require 'simplecov'//" test/helper.rb
}

build() {
  cd $_gemname-$pkgver
  # we need to use racc from ruby-racc not what's shipped with ruby
  PATH="$(ruby -e 'puts Gem.dir')/bin:$PATH" rake generate
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
    "$_gemname-$pkgver.gem"

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
