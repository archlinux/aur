# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andrew Rabert <draje@nullsum.net>

_gemname=image_size
pkgname=ruby-${_gemname}
pkgver=3.2.0
pkgrel=1
pkgdesc="measure image size using pure Ruby"
arch=(any)
url=https://github.com/toy/image_size
license=(RUBY GPL)
depends=(ruby)
checkdepends=(ruby-rspec ruby-webrick)
makedepends=(rubygems ruby-rdoc)
options=(!emptydirs)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz
        fix-gemspec-for-tarball.patch)
sha256sums=('f8e750a353d869a3545069ddf882d1f503dc80bfd41d26fc9080521092f06230'
            'a0a5d5f87a0993a3e24273a1a2ab948f6f5babbcfd53dbfda230d68af1859d03')

prepare() {
  cd ${_gemname}-${pkgver}
  patch -N -i "$srcdir/fix-gemspec-for-tarball.patch"
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}-${pkgver}
  rspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" \
    $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"

  install -Dm0644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.markdown \
    "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
