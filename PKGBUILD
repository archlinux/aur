# Maintainer: Jonne Haß <me@jhass.eu>

pkgname=ruby2.6-bundler
_gemname=${pkgname#ruby2.6-}
pkgver=2.4.8
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.6')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('fe82d6f893f2173e13232926e2b9ceb6f67027c7f166bfc1e3d6ec7d9699a164')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby-2.6 -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem-2.6 install --no-user-install --ignore-dependencies \
    --no-doc -i "$pkgdir/$_gemdir" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -d "$pkgdir/usr/bin/"
  ln -s "$_gemdir/bin/bundle" "$pkgdir/usr/bin/bundle-2.6"
}
