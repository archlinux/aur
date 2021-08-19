# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>

_gemname=ruby-progressbar
pkgname=ruby-$_gemname
pkgver=1.11.0
pkgrel=2
pkgdesc="Flexible text progress bar library for Ruby"
arch=(any)
url=https://github.com/jfelchner/ruby-progressbar
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rspec ruby-rspectacular ruby-fuubar ruby-timecop)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(https://github.com/jfelchner/ruby-progressbar/archive/releases/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('5e87214d0defed332fe2aa0a1a263010d6215042b9e6f16a4bf7a5bf585f7bd7')

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
