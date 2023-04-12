# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: asm0dey <pavel.finkelshtein@gmail.com>

_gemname=tty-reader
pkgname=ruby-$_gemname
pkgver=0.9.0
pkgrel=1
pkgdesc="A set of methods for processing keyboard input"
arch=(any)
url=https://github.com/piotrmurach/tty-reader
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-wisper ruby-tty-screen ruby-tty-cursor)
checkdepends=(ruby-bundler ruby-rake ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('970cab15cfbe28388ec6f86b16b02c09c062be90b84de8ece4a5c1e1db69b555')

prepare() {
  cd $_gemname-$pkgver

  # we don't care about performance or metrics
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
