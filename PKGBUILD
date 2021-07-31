# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Mario Finelli <mario at finel dot li>

_gemname=dry-configurable
pkgname=ruby-$_gemname
pkgver=0.12.1
pkgrel=1
pkgdesc="A mixin to add configuration functionality to your classes"
arch=('any')
url="https://github.com/dry-rb/dry-configurable"
license=('MIT')
depends=('ruby' 'ruby-concurrent' 'ruby-dry-core')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('558da9552b891d62088c47946cb890a45e154166513790cb819120336ec0a77d93a520dbfccbcc40a0c673068435b38368e91a4f49d38979680c57aae4439e65')

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
