# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-system
pkgname=ruby-$_gemname
pkgver=0.20.0
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
b2sums=('07b11195b12f5a387c182c64a14b574dd4fc8476af30eee17672ee92089ee8e2cae75c0aa0f9fc2938f01f1f4a1cee26a5d50929a6217b24379973b6785b4620')

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
