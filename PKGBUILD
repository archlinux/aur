# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=docile
pkgname=ruby-${_gemname}
pkgver=1.4.0
pkgrel=1
pkgdesc="keeps your Ruby DSLs tame and well-behaved"
arch=(any)
depends=(ruby)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc)
url=https://ms-ati.github.io/docile/
license=(MIT)
options=(!emptydirs)
source=(https://github.com/ms-ati/docile/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('ca09c0b0436acaa18ea8740c99da1cce4072feee83a5918a7177e52d231b3fde')

prepare() {
  cd $_gemname-$pkgver

  # we use an archive not a git checkout
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
  sed -i 's/%r{^(test|spec|features)\/}/%r{^\\.\/(test|spec|features)\/}/' \
    ${_gemname}.gemspec

  # we remove the simplecov dependency so we don't need to remove the const
  sed -i '/Object.send/d' spec/spec_helper.rb
  sed -i '/require "simplecov"/,+6d' spec/spec_helper.rb
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rspec
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
  install -Dm0644 HISTORY.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
