# Maintainer: Mikhail f. Shiryaev <mr point felixoid a gmail dot com>
# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-rspec
pkgname=ruby-${_gemname}
pkgver=2.7.0
pkgrel=1
pkgdesc="Code style checking for RSpec files"
arch=(any)
depends=(ruby ruby-rubocop ruby-rubocop-ast)
checkdepends=(ruby-bundler ruby-rake ruby-rack ruby-rspec
              ruby-rubocop-performance ruby-rubocop-rake ruby-yard)
makedepends=(rubygems ruby-rdoc)
url=https://github.com/rubocop/rubocop-rspec
license=(MIT)
options=(!emptydirs)
source=(https://github.com/rubocop/rubocop-rspec/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('ae3e5b2e0d98151e6adaad2c576a3946adcd085ff1cad79538842875755905e5')

prepare() {
  cd $_gemname-$pkgver

  sed -i 's|~>|>=|g' ${_gemname}.gemspec
  sed -i '/simplecov/d' ${_gemname}.gemspec
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

  install -Dm0644 MIT-LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
