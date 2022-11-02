# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=faker
pkgname=ruby-$_gemname
pkgver=3.0.0
pkgrel=1
pkgdesc="Easily generate fake data: names, addresses, phone numbers, etc"
arch=(any)
url=https://github.com/faker-ruby/faker
license=(MIT)
depends=(ruby ruby-i18n)
makedepends=(rubygems ruby-rdoc)
checkdepends=(ruby-bundler ruby-rake ruby-minitest ruby-test-unit ruby-timecop)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('e4e812caa628259e5b4f827e409706f9737295810e7e211ace052029bb7bb56d')

prepare() {
  cd $_gemname-$pkgver
  sed -i '/rubocop/d' ${_gemname}.gemspec
  sed -i '/simplecov/d' ${_gemname}.gemspec
  sed -i '/yard/d' ${_gemname}.gemspec
  sed -i '/pry/d' ${_gemname}.gemspec
  sed -i '/rubocop/Id' Rakefile
  sed -i '/yard/Id' Rakefile
  sed -i '/simplecov/,+8d' test/test_helper.rb
}

build() {
  cd $_gemname-$pkgver
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
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
