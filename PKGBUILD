# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=guard
pkgname=ruby-$_gemname
pkgver=2.18.0
pkgrel=1
pkgdesc="A command line tool to easily handle events on file system modifications"
arch=('any')
url="https://guardgem.org"
license=('MIT')
depends=(
  'ruby'
  'ruby-formatador'
  'ruby-listen'
  'ruby-lumberjack'
  'ruby-nenv'
  'ruby-notiffany'
  'ruby-pry'
  'ruby-shellany'
  'ruby-thor'
)
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('07f802e1ccfed7a39c6e1e0a2915a52da99d1c5a2e47eb98aa0044749bbc1cc4a8944d4eb8b2115df9aff446885fa9625038ff931efeac0d16d7e8d1f2bad27f')

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

  cd "gems/$_gemname-$pkgver"

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # copy man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/guard.1
}
