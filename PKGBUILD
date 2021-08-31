# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-system
pkgname=ruby-$_gemname
pkgver=0.19.2
pkgrel=1
pkgdesc="Organize your code into reusable components"
arch=('any')
url="https://github.com/dry-rb/dry-system"
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
b2sums=('d3d41b05ace251bc2fb51403b7e909398db9a4bfcf086afd610dbdb1c8ca4d487408acc57ff70292a3e4428f58e2a4416ca6374eb89198743d229e9c9bd8dba3')

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
