# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=java-properties
pkgname=ruby-$_gemname
pkgver=0.3.0
pkgrel=1
pkgdesc="Loader and writer for *.properties files"
arch=(any)
url=https://github.com/jnbt/java-properties
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-minitest ruby-simplecov)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('ebf7247b097ea9b290b8e2c5a619d318647a1c24bc4d86b156e6bf35f7fae5fe')

prepare() {
  cd $_gemname-$pkgver
  sed -i '/inch/d' ${_gemname}.gemspec
  sed -i '/coveralls/d' ${_gemname}.gemspec
  sed -i '/coveralls/Id' spec/helper.rb
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake
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
