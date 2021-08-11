# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer at gmail dot com>

_gemname=powerpack
pkgname=ruby-${_gemname}
pkgver=0.1.3
pkgrel=1
pkgdesc="A few useful extensions to core Ruby classes"
arch=(any)
url=https://github.com/bbatsov/powerpack
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/bbatsov/powerpack/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('0fe44e577de75ca6b2cbc037fe468a26fec428afe4fda90ca6bdbc118e9dc2df')

prepare() {
  cd $_gemname-$pkgver

  # we use an archive not a git checkout
  sed -i 's|git ls-files|find|' ${_gemname}.gemspec
  sed -i 's/%r{^(test|spec|features)\/}/%r{^\\.\/(test|spec|features)\/}/' \
    ${_gemname}.gemspec

  # remove unused dependencies
  sed -i '/yard/d' ${_gemname}.gemspec
  sed -i '/yard/d' Rakefile
  sed -i '/YARD/,+3d' Rakefile
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
