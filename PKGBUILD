# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=fuubar
pkgname=ruby-$_gemname
pkgver=2.5.1
pkgrel=1
pkgdesc="The instafailing RSpec progress bar formatter"
arch=(any)
url=https://github.com/thekompanee/fuubar
license=(MIT)
depends=(ruby ruby-ruby-progressbar ruby-rspec-core)
checkdepends=(ruby-rspec)
makedepends=(rubygems ruby-rdoc)
source=(https://github.com/thekompanee/fuubar/archive/releases/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('0188e92c6b8582c3bad9de2d8584d46c47b3ed3550648e9b591149605b6d4b06')
options=(!emptydirs)

prepare() {
  cd $_gemname-releases-v$pkgver
  sed -i '/cert_chain/d' ${_gemname}.gemspec
  sed -i '/signing_key/d' ${_gemname}.gemspec
}

build() {
  cd $_gemname-releases-v$pkgver
  gem build ${_gemname}.gemspec
}

check() {
  cd $_gemname-releases-v$pkgver
  rspec
}

package() {
  cd $_gemname-releases-v$pkgver
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
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
