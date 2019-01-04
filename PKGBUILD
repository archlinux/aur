# Maintainer: Jonne Haß <me@jhass.eu>

pkgname=ruby2.4-bundler
_gemname=${pkgname#ruby2.4-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.4')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('c7e38039993c9c2edc27397aef4a3370a4b35c7fae3d93e434e501c4bd7656ea')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby-2.4 -rubygems -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem-2.4 install --no-user-install --ignore-dependencies \
    --no-ri --no-rdoc -i "$pkgdir/$_gemdir" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -d "$pkgdir/usr/bin/"
  ln -s "$_gemdir/bin/bundle" "$pkgdir/usr/bin/bundle-2.4"
}
