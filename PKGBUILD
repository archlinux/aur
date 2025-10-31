# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bert Peters <bertptrs@archlinux.org>

pkgname=ruby-cucumber-compatibility-kit
pkgver=24.0.1
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
sha512sums=('1781990e54eb4fb39db0b9012f69ebde72ac11e3f53b6b0c5543622aae5033bc243827257103ba07602e6b06afd6458bbadef90b777b97bac6beaedc5a43df5b')
b2sums=('6a717e9dbd4b59f82164aaf59cedd266abb0c4d592a9e211958fd387e07263b1293d6dfbc4f65d5342d412674bcfd794076505c17b1238ccbdf352465c4a4bc6')

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
