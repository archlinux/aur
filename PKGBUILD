# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=net-http-digest_auth
pkgname=ruby-$_gemname
pkgver=1.4.1
pkgrel=1
pkgdesc="An implementation of RFC 2617 Digest Access Authentication"
arch=(any)
url=http://github.com/drbrain/net-http-digest_auth
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-minitest)
makedepends=(rubygems ruby-rake ruby-rdoc ruby-hoe)
source=(https://github.com/drbrain/net-http-digest_auth/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('746ad962dee9403611744989edd9e0cd538d79e635caaaa81d36f6d1a9bee6e5')

prepare() {
  cd $_gemname-$pkgver

  # there is no license file in the repo, but we can extract one from the readme
  # https://stackoverflow.com/a/35966027
  sed '/== LICENSE/,$!d' README.txt > LICENSE
}

build() {
  cd $_gemname-$pkgver
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
  install -Dm0644 README.txt "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm0644 History.txt "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}

# vim: set ts=2 sw=2 et:
