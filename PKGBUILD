# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rubocop-ast
pkgname=ruby-${_gemname}
pkgver=1.8.0
pkgrel=2
pkgdesc="RuboCop's AST extensions and NodePattern functionality"
arch=(any)
depends=(ruby ruby-parser)
checkdepends=(ruby-bundler ruby-rspec)
makedepends=(git rubygems ruby-rake ruby-rdoc ruby-racc ruby-oedipus_lex ruby-bump)
url=https://github.com/rubocop/rubocop-ast
license=(MIT)
options=(!emptydirs)
source=(git+https://github.com/rubocop/rubocop-ast.git?tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd $_gemname
  sed -i '/simplecov/d' Gemfile
}

build() {
  cd $_gemname
  RUBOCOP_VERSION=none rake generate
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname
  # rm Gemfile
  RUBOCOP_VERSION=none rake spec
}

package() {
  cd ${_gemname}
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
