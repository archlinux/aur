# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Mario Finelli <mario at finel dot li>

_gemname=dry-validation
pkgname=ruby-$_gemname
pkgver=1.6.0
pkgrel=1
pkgdesc="Validation library with type-safe schemas and rules"
arch=('any')
url="https://github.com/dry-rb/dry-core"
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-container'
  'ruby-dry-core'
  'ruby-dry-equalizer' # remove when 1.7.0 is released
  'ruby-dry-initializer'
  'ruby-dry-schema'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('993bb99508119c96dc0dff11e5a402d041fcfbe20efb063867a165bff0c87bf7d31219f9ad626b56c1939b9b1f8233abeade3a859097972c9cafcf59ca786fd9')

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
