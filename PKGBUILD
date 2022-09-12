# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-ast
pkgname=ruby-${_gemname}
pkgver=1.21.0
pkgrel=1
pkgdesc="RuboCop's AST extensions and NodePattern functionality"
arch=(any)
depends=(ruby ruby-parser)
checkdepends=(ruby-bundler ruby-rspec)
makedepends=(rubygems ruby-rake ruby-rdoc ruby-racc ruby-oedipus_lex ruby-bump)
url=https://github.com/rubocop/rubocop-ast
license=(MIT)
options=(!emptydirs)
source=(https://github.com/rubocop/${_gemname}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('7c37e7b85f72f3385b2d0545d6ff4c242a13df5fcba674064e3dd89de8aca9ec')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|git ls-files|find|' ${_gemname}.gemspec
  sed -i '/simplecov/d' Gemfile
}

build() {
  cd $_gemname-$pkgver
  RUBOCOP_VERSION=none rake generate
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  RUBOCOP_VERSION=none rake spec
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

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
