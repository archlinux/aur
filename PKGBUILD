# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=guard
pkgname=ruby-$_gemname
pkgver=2.17.0
pkgrel=1
pkgdesc="A command line tool to easily handle events on file system modifications"
arch=('any')
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
b2sums=('66476b20d287a7a9a4f636ba29a67a14f789ee15ff48b9ae248c5d002b97fcbc73da37ea961166f6f624593783c8da5ad453342691bec1a027abb7009010b56b')

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
