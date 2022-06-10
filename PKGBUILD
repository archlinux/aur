# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-checking
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc='Provides checking functionality for Nanoc'
arch=('any')
url='https://nanoc.app'
license=('MIT')
depends=(
  'ruby'
  'ruby-nanoc-core'
  'ruby-nanoc-cli'
)
_nanocver=4.12.4
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "$pkgname-LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
b2sums=('5ac338624bd85decb52ad4d59cff466ba849bd03c4b27534db34528db3fa768c1c198461bd35614203f352426105ea541c3dd0da2dff27a8430aa600a756f1fc'
        '39c1bde1c971c0042800d3cabd6b212152a189995154621cfe66b4646b66dfb09ea7ae0f1d2ef9b006f119c36e072e8b0b8387ce12e7dc1423e2176f5b08a630')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # license
  install -vDm644 "$srcdir/$pkgname-LICENSE-$_nanocver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
