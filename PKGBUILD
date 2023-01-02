# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=faker
pkgname=ruby-$_gemname
pkgver=3.1.0
pkgrel=1
pkgdesc="Easily generate fake data: names, addresses, phone numbers, etc"
arch=(any)
url=https://github.com/faker-ruby/faker
license=(MIT)
depends=(ruby ruby-i18n)
makedepends=(rubygems ruby-rdoc)
checkdepends=(ruby-bundler ruby-rake ruby-minitest ruby-test-unit ruby-timecop)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz
        ${url}/commit/f3117a284104c18e8c81be76b827006b93170151.patch)
sha256sums=('d81a0e8b580afc71d888c43199f2ab7efeddcc9ba8af4d261909b5417a65fd31'
            '9a0d06c2f341da60dbec2bf5b36bc6c540b3aff738babda070d9467ad13876fc')

prepare() {
  cd $_gemname-$pkgver
  sed -i '/rubocop/d' ${_gemname}.gemspec
  sed -i '/simplecov/d' ${_gemname}.gemspec
  sed -i '/yard/d' ${_gemname}.gemspec
  sed -i '/pry/d' ${_gemname}.gemspec
  sed -i '/rubocop/Id' Rakefile
  sed -i '/yard/Id' Rakefile
  sed -i '/simplecov/,+8d' test/test_helper.rb

  # release was cut without updating the version
  patch -p1 -N -i "$srcdir/f3117a284104c18e8c81be76b827006b93170151.patch"
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
