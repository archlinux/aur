# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bert Peters <bertptrs@archlinux.org>

pkgname=ruby-cucumber-compatibility-kit
pkgver=19.0.0
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
sha512sums=('59d2ca131171e926b45949877ae57f28f5429054bdcd4e542f4c3bca8b8cdf96517ffaddd99ce30ad5e360052d93e70bf83a88a3365583fb172312db9920c108')
b2sums=('bfbf432883ee5c3df9fa31a3ae55bced71817a22d1cbfbb5fc5e05d5029bc66a35279e398790231a4ab7eeb0dfcfbca2a8cdc332e506877c124b37d6fb5e7af2')

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
