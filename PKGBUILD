# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-deploying
pkgname=ruby-$_gemname
pkgver=1.0.2
pkgrel=1
pkgdesc='Provides the 'deploy' subcommand and associated functionality for Nanoc'
arch=('any')
url='https://nanoc.app'
license=('MIT')
depends=(
  'ruby'
  'ruby-nanoc-checking'
  'ruby-nanoc-cli'
  'ruby-nanoc-core'
)
_nanocver=4.12.2
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
b2sums=('6f06a33c08105e59a928277efccf48371d0c93f0cb4427951431462afc4b9d88c677ac17a2627f7511a7675a7b350c2887f62b88112c2d10e1e203a44252a387'
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
