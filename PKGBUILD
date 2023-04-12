# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: asm0dey <pavel.finkelshtein@gmail.com>

_gemname=strings
pkgname=ruby-$_gemname
pkgver=0.2.1
pkgrel=1
pkgdesc="A set of useful functions for transforming strings"
arch=(any)
url=https://github.com/piotrmurach/strings
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-strings-ansi ruby-unicode_utils ruby-unicode-display_width)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('45c144ba36aa30586cc8bd64e0398671deb8f0b7befd59005571890b5d88560d')

prepare() {
  cd $_gemname-$pkgver

  # we don't care about coverage or metrics
  echo 'source "https://rubygems.org"' > Gemfile
  echo 'gemspec' >> Gemfile
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
