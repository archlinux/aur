# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: carstene1ns <arch carsten-teibes de>

_gemname=guard-nanoc
pkgname=ruby-$_gemname
pkgver=2.1.9
pkgrel=1
pkgdesc="Guard helper gem for Nanoc"
arch=('any')
url="https://nanoc.app"
license=('MIT')
depends=(
  'ruby'
  'ruby-guard'
  'ruby-guard-compat'
  'ruby-nanoc-cli'
  'ruby-nanoc-core'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('b63e4353b47533eacaaf2f7d817f1b6c7d2ec41d022174d73c9292a66292fa990a2d4a53c27c148fe1c5a04ca2bcbafcb667ff8468b67c818c114b1110e6e04f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  cd "gems/$_gemname-$pkgver"
  rm -vrf "$_gemname.gemspec" Rakefile

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
