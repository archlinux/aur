# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-core
pkgname=ruby-$_gemname
pkgver=4.12.8
pkgrel=1
pkgdesc='Contains the core of Nanoc'
arch=('any')
url='https://nanoc.app'
license=('MIT')
depends=(
  'ruby'
  'ruby-concurrent'
  'ruby-ddmetrics'
  'ruby-ddplugin'
  'ruby-hamster'
  'ruby-json_schema'
  'ruby-memo_wise'
  'ruby-psych'
  'ruby-slow_enumerator_tools'
  'ruby-tty-platform'
  'ruby-zeitwerk'
)
_nanocver=4.12.4
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "$pkgname-LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
sha512sums=('22bc07d4a89d5137876a58d3636dce480ac1170d7acdda9a3b144725250816573165acaea2f70c4cc45ac9b4e2c9bc19c182f235c6bb65e75b64d938d5acbb0c'
            '023b2c0d554ce15e78005cf0354a0c28cd28b8c9f5901dd665257f5b64004c1e8ded3ab5b194fc049e5264e5af4438833163f65dca37f76c1ee910cdf353e05c')
b2sums=('4b9b6d6c9a4e4c56c94c3f877e276e8fe199dbc3c13e9cfac04f06343d150a47f5ff38dd372b346ba3637e81ef91076a33dad7d058772b555160b8b3b1bad57e'
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
  install -vDm644 "$srcdir/$pkgname-LICENSE-$_nanocver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
