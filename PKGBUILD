# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http-form_data
pkgname=ruby-$_gemname
pkgver=2.3.0
pkgrel=2
pkgdesc="Utility-belt to build form data request bodies"
arch=(any)
url=https://github.com/httprb/form_data
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=('!emptydirs')
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('744904b3570478ebc9d5bb08e62e6c78023c736275fe1ae89bd3c172b5cb0a26')

prepare() {
  cd form_data-$pkgver

  # we use an archive not a git checkout
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec

  # remove test dependencies that we don't need
  sed -i '/simplecov/Id' spec/spec_helper.rb
  sed -i '/coveralls/d' spec/spec_helper.rb
  sed -i '/fuubar/d' spec/spec_helper.rb
  sed -i '/^])/d' spec/spec_helper.rb # cleanup simplecov removal
  sed -i '/require "http\/form_data"/a require "json"' spec/spec_helper.rb
}

build() {
  cd form_data-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd form_data-$pkgver
  rake spec
}

package() {
  cd form_data-$pkgver
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
  install -Dm0644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
