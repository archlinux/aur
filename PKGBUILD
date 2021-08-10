# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Aoibhinn di Tori <email@aoibh.in>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_gemname=haml
pkgname=ruby-$_gemname
pkgver=5.2.2
pkgrel=1
pkgdesc="a layer on top of HTML or XML"
arch=(any)
url=https://haml.info
license=(MIT)
depends=(ruby ruby-temple ruby-tilt)
# checkdepends=(ruby-rails ruby-minitest ruby-nokogiri)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/haml/haml/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('d34c2913576e97c61038475835fe7dc56ec55c35b2efad0495cc32cdc787e3be')

prepare() {
  cd ${_gemname}-$pkgver
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
  sed -i 's|f.match(%r{\Atest/})|f.match(%r{\A./test/})|' ${_gemname}.gemspec

  sed -i '/rbench/d' ${_gemname}.gemspec
  sed -i '/simplecov/d' ${_gemname}.gemspec
  sed -i '/"m"/d' Gemfile
  sed -i '/pry/d' Gemfile
  sed -i '/simplecov/d' Gemfile
  sed -i '/ruby-prof/d' Gemfile

  sed -i '/simplecov/Id' test/test_helper.rb
}

build() {
  cd ${_gemname}-$pkgver
  gem build ${_gemname}.gemspec
}

# the tests work but it requires a full rails installation which is nearly
# impossible on the AUR where half the gems have a different maintainer and
# are in varying states of being up-to-date (about half of them still point
# to rails 5 versions)
# check() {
#   cd ${_gemname}-$pkgver
#   rake test
# }

package() {
  cd ${_gemname}-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
