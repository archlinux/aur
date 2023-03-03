# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=equalizer
pkgname=ruby-$_gemname
pkgver=0.0.11
pkgrel=2
pkgdesc="Module to define equality, equivalence and inspection methods"
arch=(any)
url=https://github.com/dkubb/equalizer
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('65d79f2109023c2e766200efe6250e029a6e9a3b1299ca8fac356241a1df5706')

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
