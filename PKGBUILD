# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bert Peters <bertptrs@archlinux.org>

pkgname=ruby-cucumber-compatibility-kit
pkgver=26.0.0
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
sha512sums=('b244e9be617ace5c7f5257f43c4bf78058d111bfca4c309fc8d54a247e0c3bbe6901bba16291f015c5651e48ed2f7c701e57b788b167cb0c450eba7f72c1ac6c')
b2sums=('85cf697466392982ce852483d5cd9c431ebd974ba69437f312657366695163c41dba96de69b4b6e9c0d86252e76a4d7b1a9c43d900a9f4a70ec46b28776528b1')

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
