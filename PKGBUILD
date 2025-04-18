# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-cucumber-compatibility-kit
pkgver=15.0.0
pkgrel=5
pkgdesc="Kit to check compatibility with official cucumber implementation"
arch=(any)
url='https://github.com/cucumber/compatibility-kit'
license=(MIT)
depends=(
  ruby
  ruby-cucumber-messages
)
makedepends=(
  npm
)
checkdepends=(
  ruby-bundler
  ruby-rspec
)
options=(!emptydirs)
source=(https://github.com/cucumber/compatibility-kit/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('525182e0278c13bdcc126dfa677ac84e79704232fb65066b363c44a5845c97da252aca7f5542bdf659ff3a002c6375d1d3379746e49dfd4b50a5a1719c07268c')
b2sums=('03e4e353263e774462a4dd63404909dbbb0c235718a6a4e7a35c0ca6931adbedb579fd44494b5a4a78e9b8f3f249378b2f24f42b05a7fd0e0f1fe4d7d6ed6918')

prepare() {
  cd compatibility-kit-$pkgver/ruby
  sed -i 's|~>|>=|' cucumber-compatibility-kit.gemspec
  sed -i "s/, '< 25'//" cucumber-compatibility-kit.gemspec
}

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
  GEM_HOME="tmp_install/$_gemdir" rspec
}

package() {
  cd compatibility-kit-$pkgver/ruby
  cp -a tmp_install/* "$pkgdir"/
}
