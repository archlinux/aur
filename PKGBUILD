# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-view
pkgname=ruby-$_gemname
pkgver=0.7.1
pkgrel=1
pkgdesc="A complete, standalone view rendering system"
arch=('any')
url="https://github.com/dry-rb/dry-view"
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-dry-configurable'
  'ruby-dry-core'
  'ruby-dry-inflector'
  'ruby-tilt'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('c3003d533665709f2bbc6c6a6fa83e90cfa7a1268da7bad1b3dea3833ce5ff368a68cb39cb9e8c2198b22c2531d63b4a751d0089decdcda25aa69b3ba57eac2d')

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
