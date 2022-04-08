# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sergey Shatunov <me@prok.pw>

_rubyver=2.5
_gemname=bundler
pkgname=ruby${_rubyver}-${_gemname}
pkgver=2.3.11
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.5')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('2bbce1313cc1f0312efab6b15fcca74be85b60a24aa3918ea54edaa0967381d3b5e5e3c75b85cce45d39248efae4e9ac495963c6d2808bcf82ed6e1572a34497')

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
