# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-effects
pkgname=ruby-$_gemname
pkgver=0.1.5
pkgrel=1
pkgdesc="A practical, production-oriented implementation of algebraic effects"
arch=('any')
url="https://github.com/dry-rb/dry-effects"
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-container'
  'ruby-dry-core'
  'ruby-dry-inflector'
  'ruby-dry-initializer'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('6a772497f610ba42eaaf139f81f789446a440c61a9c7bc3053b1c5774045fc40992630237479a0a9102da1f6a845b7746ee13fe72739aeb378eb4137aedfbd27')

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

  # delete unnecessary files & folders
  cd "gems/$_gemname-$pkgver"
  rm -vrf "$_gemname.gemspec"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
