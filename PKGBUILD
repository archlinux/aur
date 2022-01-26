# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-auto_inject
pkgname=ruby-$_gemname
pkgver=0.9.0
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
b2sums=('e11cbbc2cacc84bf9cd8918295b532e5b32d4fb46b6738a928a765da203b78681ad2e0cbab2f24119ad3eb0547fa96445d69b09b9e47410de568ba34a2485379')

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
