# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-cli
pkgname=ruby-$_gemname
pkgver=4.12.8
pkgrel=1
pkgdesc='Command-line interface for Nanoc'
arch=('any')
url='https://nanoc.app'
license=('MIT')
depends=(
  'ruby'
  'ruby-cri'
  'ruby-diff-lcs'
  'ruby-nanoc-core'
  'ruby-zeitwerk'
)
_nanocver=4.12.4
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "$pkgname-LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
sha512sums=('496518f53fffdd90cbaf7062e71224659480420914de29b95352aa23b0e74a1e541baeaf777a4139771dfb313506bd90dfe724f88b49d4aa11a3b2786e1ffba0'
            '49ae9cce13b06699eb6d7fbb6566d535c2344a6366c2fd35d72c3df8a531686f5a3992f223ce516f33dcf6cdbb8c6ba64468038c5e453ccbf5fe94e44de4db50')
b2sums=('21cce981bc71c2e9fc22e4e3b92a3843bd932409af4291799f856ccabcfacb500b860902a7a81a4bd83523fc13a989361da9f89ec8ceb17e5fb7271fe1460082'
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
