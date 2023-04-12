# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: wickdchromosome <capsule.edu@gmail.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

_gemname=base32
pkgname=ruby-$_gemname
pkgver=0.3.4
pkgrel=1
pkgdesc="A library which provides base32 decoding and encoding"
arch=(any)
url=https://github.com/stesla/base32
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-minitest)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/${pkgver}.tar.gz)
sha256sums=('82e8d975eb3e2779af428b5b9c7a1bc59003040594158bfba7bde666a8882ab8')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec
  sed -i '/gem-release/d' ${_gemname}.gemspec
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

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
