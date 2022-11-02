# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-trenni
pkgver=3.14.0
pkgrel=2
pkgdesc='A fast native templating system that compiles directly to Ruby code'
arch=(x86_64)
url='https://github.com/ioquatix/trenni'
license=(MIT)
depends=(ruby)
makedepends=(ragel ruby-bake ruby-benchmark-ips ruby-covered ruby-rack ruby-nokogiri)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=(https://github.com/ioquatix/trenni/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('7c45d5d27f75843df66a8857d03db687220b748e9b92bb970bd7aaf3ab45dfab')

prepare() {
  cd trenni-$pkgver
  sed -e 's/~>/>=/' -i trenni.gemspec
  sed -i '/ruby-prof/d;/bake-gem/d;/bake-modernize/d' gems.rb
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd trenni-$pkgver
  bake trenni:parsers:generate
  gem build trenni.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    trenni-$pkgver.gem
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
  cd trenni-$pkgver
  GEM_HOME="tmp_install/$_gemdir" rspec
}

package() {
  cd trenni-$pkgver
  cp -a tmp_install/* "$pkgdir"/
}
