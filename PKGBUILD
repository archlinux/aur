# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-cli
pkgname=ruby-$_gemname
pkgver=4.12.7
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
sha512sums=('89d58cff8a36f4b9374acfe5efaaabe4745606211fe5ae143c15c3c3e6627704f74d9b676a98934defd913767df9adcede6422dee1093d9e47d310572cb2990c'
            '49ae9cce13b06699eb6d7fbb6566d535c2344a6366c2fd35d72c3df8a531686f5a3992f223ce516f33dcf6cdbb8c6ba64468038c5e453ccbf5fe94e44de4db50')
b2sums=('fc811d66f475f0762c9a6ecd17545db1c3d91c6f5a91ef646c4a43201b30fd942208b3fe5dc9e88757aeedd699675ea94331ad59b573eeddb25d408d6af5118c'
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
