# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=regexp_parser
pkgname=ruby-${_gemname}
pkgver=2.2.0
pkgrel=1
pkgdesc="A regular expression parser library for Ruby"
arch=(any)
depends=(ruby)
checkdepends=(ruby-rspec ruby-ice_nine ruby-regexp_property_values)
makedepends=(rubygems ruby-rdoc ragel ruby-rake ruby-bundler)
url=https://github.com/ammar/regexp_parser
license=(MIT)
options=(!emptydirs)
source=(https://github.com/ammar/regexp_parser/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('606a7fce30616867ecbc4d570a21869c67760c79c0e9f0d7644fc57b72832424')

build() {
  cd $_gemname-$pkgver
  rake ragel:rb
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
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
