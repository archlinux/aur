# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-shindo
pkgver=0.3.10
pkgrel=1
pkgdesc='Simple depth first ruby testing, watch and learn.'
arch=(any)
url='https://github.com/geemus/shindo'
license=(MIT)
depends=(ruby-formatador)
makedepends=(ruby-rake)
options=(!emptydirs)
source=(https://github.com/geemus/shindo/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('4e3491f590a275ce7ba9dbb2c3baf1d4ea9dc94b5746f3ed96ee80b5403449c2')

build() {
  local _gemdir="$(gem env gemdir)"
  cd shindo-$pkgver
  gem build shindo.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    shindo-$pkgver.gem
  find "tmp_install/$_gemdir/gems/" \
    -type f \
    \( \
        -iname "*.o" -o \
        -iname "*.c" -o \
        -iname "*.so" -o \
        -iname "*.time" -o \
        -iname "gem.build_complete" -o \
        -iname "Makefile" \
    \) \
    -delete
  rm -r tmp_install/$_gemdir/cache
}

check() {
  local _gemdir="$(gem env gemdir)"
  cd shindo-$pkgver
  PATH="$PWD/tmp_install/usr/bin:$PATH" GEM_HOME="tmp_install/$_gemdir" rake tests
}

package() {
  cd shindo-$pkgver
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
