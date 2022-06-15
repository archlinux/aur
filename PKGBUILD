# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-dry-system
_gemname="${pkgname#ruby-}"
pkgver=0.24.0
pkgrel=1
pkgdesc='Organize your code into reusable components'
arch=('any')
url='https://github.com/dry-rb/dry-system'
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-auto_inject'
  'ruby-dry-configurable'
  'ruby-dry-container'
  'ruby-dry-core'
  'ruby-dry-inflector'
  'ruby-dry-struct'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('26334049a5591f424a21780e18aaf4237a43371f60a1a75396a82abd987a295fcd95e1f198d00c860e0a62f11c49d656a68ad79c97db54fe24aaa079a0b975c2')
b2sums=('0c9a63e237988e1beffd724156ec32073c301b852efab82d98c73f0d6b1a05895ba322c46a9464676142fe99fcc35ef8018b950fb04fe9cfec5499ad213e8511')

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
