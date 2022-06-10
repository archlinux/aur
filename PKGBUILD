# Maintainer: George Rawlinson <grawlinson@archlinux.org>

_gemname=nanoc-core
pkgname=ruby-$_gemname
pkgver=4.12.7
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
sha512sums=('5f89ece2ca8204e82d983576dfb3e47c47bb680e95b1a092d75c04ce1851306d4bed5ae8723ab17ec100d98851d69253c5175113ed5cb9292562bd489d400f1c'
            '023b2c0d554ce15e78005cf0354a0c28cd28b8c9f5901dd665257f5b64004c1e8ded3ab5b194fc049e5264e5af4438833163f65dca37f76c1ee910cdf353e05c')
b2sums=('78938a02289e61c6ba1ccb6ee88a5bca8a04426ca6a41026863f76f85e21fa6f5a5535e5bce4b5f54ad4000867adb766206fa3f127689bc30b2dc8d5d80af7cf'
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
