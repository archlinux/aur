# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-cucumber-compatibility-kit
pkgver=11.0.1
pkgrel=2
pkgdesc="Kit to check compatibility with official cucumber implementation"
arch=(any)
url='https://github.com/cucumber/compatibility-kit'
license=(MIT)
depends=(ruby-cucumber-messages ruby-rake ruby-rspec)
makedepends=(npm)
options=(!emptydirs)
source=(https://github.com/cucumber/compatibility-kit/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('d9ae3e2362253f77207b47938f2457265a3fb5cb3ecf02666a64953028f07622')

build() {
  local _gemdir="$(gem env gemdir)"
  cd compatibility-kit-$pkgver/devkit
  npm install
  npm run copy-to:ruby
  cd ../ruby
  gem build cucumber-compatibility-kit.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    cucumber-compatibility-kit-$pkgver.gem
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
  cd compatibility-kit-$pkgver/ruby
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd compatibility-kit-$pkgver/ruby
  cp -a tmp_install/* "$pkgdir"/
}
