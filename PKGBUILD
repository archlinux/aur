# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=adamantium
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc="Immutable extensions to objects"
arch=(any)
url=https://github.com/dkubb/adamantium
license=(MIT)
depends=(ruby ruby-ice_nine ruby-memoizable)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc git)
options=(!emptydirs)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('17961c34779033b899663bbf63f457c9ff1995dc191347b5b22963c67255aec5')

prepare() {
  cd $_gemname-$pkgver

  sed -i 's/git ls-files --/find/' ${_gemname}.gemspec
  sed -i 's/git ls-files/find/' ${_gemname}.gemspec

  # sed -i -e "/require 'devtools/d" spec/spec_helper.rb
}

build() {
  cd $_gemname-$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-$pkgver
  # disabled for now as there is a mega-dependency on (ruby-)devtools
  # rspec
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
