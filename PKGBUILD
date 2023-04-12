# Maintainer: Mario Finelli <mario at fineli dot li>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Hugo Osvaldo Barrera <hugo at barrera dot io>

_gemname=rotp
pkgname=ruby-$_gemname
pkgver=6.2.2
pkgrel=1
pkgdesc="Ruby One Time Password library"
arch=(any)
url=https://github.com/mdp/rotp
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-rake ruby-rspec ruby-simplecov ruby-timecop)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('b48fd3f8a782f042783f2fab449b59cd246a97ac02de8ed89c2b77963e23b7cd')

prepare() {
  cd $_gemname-$pkgver
  sed -i 's/git ls-files --/find/' ${_gemname}.gemspec
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  rspec
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
