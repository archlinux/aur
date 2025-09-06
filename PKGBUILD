# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bert Peters <bertptrs@archlinux.org>

pkgname=ruby-cucumber-compatibility-kit
pkgver=22.0.0
pkgrel=1
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
sha512sums=('b06a2ac92f9dcd37d534bc83d41a81977860bd86c8cdfd7007dad8a3dcffa8642e9673efca298cba6e725707860be2dec157953d4c0b7df76de1bf8d3ab546b2')
b2sums=('625eca281c0d928bd6ae45299cf951a21e0bdf0336df34bd799b9111a58c497a193e5a87666e512992b1f4b2c97e11b6ca11bdc9ba8e2425e318d18332214853')

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
