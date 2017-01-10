# Maintainer: Sergey Shatunov <me@prok.pw>
# Contributor: Jonne Haß <me@jhass.eu>

_rubyver=2.3
_gemname=bundler
pkgname=ruby${_rubyver}-${_gemname}
pkgver=1.13.7
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.3')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('a9f0c8c5cf977cadce77e6185695d4a0b956a73569a5634b15b34cc07fdb7bab')

package() {
  cd "$srcdir"

  local _gemdir="$(ruby-${_rubyver} -rubygems -e'puts Gem.default_dir')"
  HOME="/tmp" GEM_HOME="$_gemdir" GEM_PATH="$_gemdir" gem-${_rubyver} install --no-user-install --ignore-dependencies \
    --no-ri --no-rdoc -i "$pkgdir/$_gemdir" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -d "$pkgdir/usr/bin/"
  ln -s "$_gemdir/bin/bundle" "$pkgdir/usr/bin/bundle-${_rubyver}"
}
