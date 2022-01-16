# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-core
pkgname=ruby-$_gemname
pkgver=4.12.4
pkgrel=2
pkgdesc="Contains the core of Nanoc"
arch=('any')
url="https://nanoc.app"
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
sha512sums=('333937642a0dcace5284bcf04ee08be752a4e2fdbf01aa45fa8931e9de5cb5c6223d9b518a360eb1bec91911cae07ff2b419e8765c41f16ee92c8fbd3d6c0455'
            '023b2c0d554ce15e78005cf0354a0c28cd28b8c9f5901dd665257f5b64004c1e8ded3ab5b194fc049e5264e5af4438833163f65dca37f76c1ee910cdf353e05c')
b2sums=('d8205a4b686a438e69aae758ce04b71765224fef57c9e75be2447906ff2efe4d62e167c03485e7b64cbdfe7443975a1a344a845d74a8773ad7bfe4f9de55f92a'
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
