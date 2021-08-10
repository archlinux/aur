# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=memoizable
pkgname=ruby-$_gemname
pkgver=0.4.2
pkgrel=2
pkgdesc="Memoize method return values"
arch=(any)
url=https://github.com/dkubb/memoizable
license=(MIT)
depends=(ruby ruby-thread_safe)
checkdepends=(ruby-rake ruby-bundler ruby-rspec)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/dkubb/memoizable/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('771404da156c40f62b617acc4376d51d3725d3d621996c502aba567f0441fca7')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's|~>|>=|g' ${_gemname}.gemspec
  sed -i '/coveralls/d' Gemfile
  sed -i '/simplecov/d' Gemfile
  sed -i '/simplecov/,+17d' spec/spec_helper.rb
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rake spec
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

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
