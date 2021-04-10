# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sergey Shatunov <me@prok.pw>

_rubyver=2.5
_gemname=bundler
pkgname=ruby${_rubyver}-${_gemname}
pkgver=2.2.16
pkgrel=1
pkgdesc="Manages an application's dependencies through its entire life, across many machines, systematically and repeatably."
arch=('any')
url="http://bundler.io"
license=('MIT')
depends=('ruby2.5')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha512sums=('3a147677cc026df2f10bdd5d73c6c4c483637c4cd507a521ce604fe385146254c653b29618c774545b1c038f08b7101315110ce7f891d83bff4c79412c6e3c64')

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
