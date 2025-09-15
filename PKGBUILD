# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bert Peters <bertptrs@archlinux.org>

pkgname=ruby-cucumber-compatibility-kit
pkgver=22.0.1
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
  git
  npm
)
checkdepends=(
  ruby-bundler
  ruby-rspec
)
options=(!emptydirs)
source=(git+https://github.com/cucumber/compatibility-kit.git#tag=v$pkgver)
sha512sums=('b41d3f38c9b6efb50b6707667eefecf2c71588ec8d1f90a1e4708c8406cedd618c8dd7ee887886193f3eaa9099c64e2ea9cb7264a554f5b9f544e722b5819119')
b2sums=('d113c45a1e534fa88a25777012c98ff680131d11ccd2354340f39bfe79a7c376ec76bda3064cc3ab1372a26b5ebe29b1d85562f1ebcde0bc7a34c02c5ce605ef')

prepare() {
  cd compatibility-kit/ruby
  sed -i 's|~>|>=|' cucumber-compatibility-kit.gemspec
  sed -i "s/, '< 25'//" cucumber-compatibility-kit.gemspec
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd compatibility-kit/devkit
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
  cd compatibility-kit/ruby
  GEM_HOME="tmp_install/$_gemdir" rspec
}

package() {
  cd compatibility-kit/ruby
  cp -a tmp_install/* "$pkgdir"/
}
