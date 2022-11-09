# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-bake-modernize
pkgver=0.14.0
pkgrel=1
pkgdesc='Automatically modernize parts of your project/gem'
arch=(any)
url='https://github.com/ioquatix/bake-modernize'
license=(MIT)
depends=(ruby-async-http ruby-bake ruby-build-files ruby-markly ruby-rugged)
checkdepends=(ruby-rspec ruby-bake-test git)
options=(!emptydirs)
source=(https://github.com/ioquatix/bake-modernize/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('98fc54014bd5ab8b00b9c2f0d65d8dedb4f9e2438c8d0b42920be365e3644396')

prepare() {
  cd bake-modernize-$pkgver
  sed -i -e '/signing_key/d' -e 's/~>/>=/' bake-modernize.gemspec
  echo -e 'gemspec\ngem "bake-test"' > gems.rb
  # Only works in git tree
  sed -i "/subject.call('modernize')/d" spec/bake/modernize_spec.rb
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd bake-modernize-$pkgver
  gem build bake-modernize.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    bake-modernize-$pkgver.gem
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
  cd bake-modernize-$pkgver
  GEM_HOME="tmp_install/$_gemdir" bake test
}

package() {
  cd bake-modernize-$pkgver
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 license.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
