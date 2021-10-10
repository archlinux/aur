# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-cli
pkgname=ruby-$_gemname
pkgver=4.12.3
pkgrel=1
pkgdesc="Command-line interface for Nanoc"
arch=('any')
url="https://nanoc.app"
license=('MIT')
depends=(
  'ruby'
  'ruby-cri'
  'ruby-diff-lcs'
  'ruby-nanoc-core'
  'ruby-zeitwerk'
)
_nanocver=4.12.3
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
sha512sums=('23db00117839cc5d1f8252ff3630462820e1055336db529f11fd2b29333d29ebe64b0b1ecde7cc05ca459062253e39224f0e207513479a8603183953b1b0521c'
            '49ae9cce13b06699eb6d7fbb6566d535c2344a6366c2fd35d72c3df8a531686f5a3992f223ce516f33dcf6cdbb8c6ba64468038c5e453ccbf5fe94e44de4db50')
b2sums=('29d5a2a27b0ce7824d096de50a5474ebe0016a085df267514993ab51c95407ef89c78352106db01295cb0078d1a6d124bb263ec86cdfe58ab1a7df3ee6fe195d'
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
  install -vDm644 "$srcdir/LICENSE-$_nanocver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
