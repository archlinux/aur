# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-core
pkgname=ruby-$_gemname
pkgver=4.12.3
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
_nanocver=4.12.3
options=('!emptydirs')
source=(
  "https://rubygems.org/downloads/$_gemname-$pkgver.gem"
  "LICENSE-$_nanocver::https://raw.githubusercontent.com/nanoc/nanoc/$_nanocver/$_gemname/LICENSE"
)
noextract=("$_gemname-$pkgver.gem")
sha512sums=('f7d47e907c4cfaea941806aab13d58da87a13e7763430a46a918e11f227d601b8e9609c2fe471fba8697205e1334e035fbfdd452f9d6c3b6cf7cd9a3d3231350'
            '023b2c0d554ce15e78005cf0354a0c28cd28b8c9f5901dd665257f5b64004c1e8ded3ab5b194fc049e5264e5af4438833163f65dca37f76c1ee910cdf353e05c')
b2sums=('a23ba06411b2551e67f9ecbda6ab4cb8aed50e305e7414e8736a4f7b423f0a8012123d3352c2af49746ae2c5ce0d3436759fbb1d1b04b2e7ececf0408172de0d'
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
