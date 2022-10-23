# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sergey Shatunov <me@prok.pw>

_rubyver=2.5
_gemname=bundler
pkgname=ruby${_rubyver}-${_gemname}
pkgver=2.3.24
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.5')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('1d59bfa0bb8b748c8f4a7c30eb1603f05033bd59ca66496442224c563a95d8d8d2173e2f005a090a6b22e1a25664f20a3cf45b3d12ff7791712e327f194f242c')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby-${_rubyver} -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem-${_rubyver} install --no-user-install --ignore-dependencies \
    --no-ri --no-rdoc -i "$pkgdir/$_gemdir" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -d "$pkgdir/usr/bin/"
  ln -s "$_gemdir/bin/bundle" "$pkgdir/usr/bin/bundle-${_rubyver}"
}
