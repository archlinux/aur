# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farawayer <farwayer@gmail.com>

_gemname=emoji_regex
pkgname=ruby-$_gemname
pkgver=3.2.3
pkgrel=1
pkgdesc="A set of Ruby regular expressions for matching Unicode Emoji symbols"
arch=(any)
url=https://github.com/ticky/ruby-emoji-regex
license=(MIT)
depends=(ruby)
makedepends=(rubygems ruby-rdoc ruby-bundler ruby-rake nodejs yarn)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('4e7120e2f54c82f830434e57ff161033738e701944f6bd40baf5b46d36d7c78d')

build() {
  cd ruby-emoji-regex-$pkgver
  yarn install --frozen-lockfile
  rake regenerate
  gem build ${_gemname}.gemspec
}

check() {
  cd ruby-emoji-regex-$pkgver
  rake spec
}

package() {
  cd ruby-emoji-regex-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
