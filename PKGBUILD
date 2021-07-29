# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-core
pkgname=ruby-$_gemname
pkgver=4.12.2
pkgrel=1
pkgdesc="Contains the core of Nanoc"
arch=('any')
url="https://nanoc.app"
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-ddmemoize'
  'ruby-ddmetrics'
  'ruby-ddplugin'
  'ruby-hamster'
  'ruby-json_schema'
  'ruby-slow_enumerator_tools'
  'ruby-tty-platform'
  'ruby-zeitwerk'
)
_nanocver=4.12.2
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
b2sums=('83cbadbbeb964d9c58626780eb8ccfaee9d30d8bef59a3115b8d38477b3a08a5cd672f8d93fad680f0b850edb25fb00ff0dfdf3996e63bf46b6a7d83423159c8'
        '95abf2d57bccc4622654a58cb45461ebd1fd01ffd434dc5e041d3fe97abe73af1a81e63d69653c0826239fe66e0d604573d739e10033a28d2403ce6ad3d35aa4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
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

  # license
  install -vDm644 "$srcdir/LICENSE-$_nanocver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
