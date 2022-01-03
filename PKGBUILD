# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: farwayer <farwayer@gmail.com>

_gemname=declarative
pkgname=ruby-$_gemname
pkgver=0.0.20
pkgrel=1
pkgdesc="DSL for nested schemas"
arch=(any)
url=https://github.com/apotonick/declarative
license=(MIT)
depends=(ruby)
makedepends=(rubygems ruby-rdoc)
checkdepends=(ruby-bundler ruby-rake ruby-minitest)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('1b42ebe9d9173683cd40ac291706fc48e4756bab4158ebafcc7b1c9be8765cdc')

prepare() {
  cd $_gemname-$pkgver

  # we use an archive not a git checkout
  sed -i 's|git ls-files -z|find -print0|' ${_gemname}.gemspec
  sed -i 's/%r{^(test)\/}/%r{^\\.\/(test)\/}/' ${_gemname}.gemspec

  # we don't need minitest-line to run the test suite
  sed -i '/minitest-line/d' ${_gemname}.gemspec
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
  install -Dm0644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
