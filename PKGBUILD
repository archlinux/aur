# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=dry-monads
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=1
pkgdesc="A set of common monads for Ruby"
arch=('any')
url="https://github.com/dry-rb/dry-monads"
license=('MIT')
depends=('ruby' 'ruby-concurrent' 'ruby-dry-core')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('1ee1d05784a97b74513f8b32c6621609ea89d6371a52efd510d804ab66bd7535126379d5c51be980cc9aed15b915da64eaa6df894aea5f11ea7021eb472ad045')

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
