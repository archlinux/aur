# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=abstract_type
pkgname=ruby-$_gemname
pkgver=0.0.7
pkgrel=1
pkgdesc="Module to declare abstract classes and methods"
arch=(any)
url=https://github.com/dkubb/abstract_type
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('465958597499600177ad15dbb57ec90c55cb27f82cb3e4b3cc8c58285a6ec82f')

prepare() {
  cd $_gemname-$pkgver

  # we use a tarball, not a git checkout
  sed -i 's/git ls-files --/find/' ${_gemname}.gemspec
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec

  # we don't actually need (ruby-)devtools to run the test suite
  sed -i -e "/require 'devtools/d" spec/spec_helper.rb
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
}

# vim: set ts=2 sw=2 et:
