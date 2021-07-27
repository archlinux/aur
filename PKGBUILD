# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=oedipus_lex
pkgname=ruby-${_gemname}
pkgver=2.5.3
pkgrel=1
pkgdesc="This is not your father's lexer"
arch=(any)
depends=(ruby)
makedepends=(rubygems ruby-rdoc ruby-hoe)
url=https://github.com/seattlerb/oedipus_lex
license=(MIT)
options=(!emptydirs)
source=(https://github.com/seattlerb/oedipus_lex/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('40326fbd256766c630a2be72fb746e860a8d4325053e37bb17ff988571586066')

prepare() {
  cd $_gemname-$pkgver

  # there is no license file in the repo, but we can extract one from the readme
  # https://stackoverflow.com/a/35966027
  sed '/== License/,$!d' README.rdoc > LICENSE
}

build() {
  cd $_gemname-$pkgver
  rake bootstrap
  rake gem
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
    pkg/$_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.rdoc "$pkgdir/usr/share/doc/$pkgname/README.rdoc"
  install -Dm0644 History.rdoc "$pkgdir/usr/share/doc/$pkgname/History.rdoc"
}

# vim: set ts=2 sw=2 et:
