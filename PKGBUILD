# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-auto_inject
pkgname=ruby-$_gemname
pkgver=0.8.0
pkgrel=1
pkgdesc="Container-agnostic automatic constructor injection mixin"
arch=('any')
url="https://github.com/dry-rb/dry-auto_inject"
license=('MIT')
depends=('ruby' 'ruby-dry-container')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('7cc0aee99b59ed6cd610779e98ee8382d32c5c1b0a93933a32e2f8a9eb7c14a35dcaa675a059af42a0ed914af6bcec2a67173cd70cc6d248411c831b7a2bde49')

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
