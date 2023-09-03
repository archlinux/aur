# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-bake-modernize
pkgver=0.17.5
_commit=100323f7235b7c12c2123d82c3d25e77d237d2c0
pkgrel=1
pkgdesc='Automatically modernize parts of your project/gem'
arch=(any)
url='https://github.com/ioquatix/bake-modernize'
license=(MIT)
depends=(ruby-async-http ruby-bake ruby-build-files ruby-markly ruby-rugged)
makedepends=(git)
checkdepends=(ruby-sus ruby-bake-test git)
options=(!emptydirs)
source=(git+https://github.com/ioquatix/bake-modernize.git#commit=$_commit)
sha256sums=('SKIP')

prepare() {
  cd bake-modernize
  sed -i -e '/signing_key/d' -e 's/~>/>=/' bake-modernize.gemspec
  sed -i '/bake-gem/d;/bake-github-pages/d;/utopia-project/d' gems.rb
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd bake-modernize
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
  cd bake-modernize
  GEM_HOME="tmp_install/$_gemdir" bake test
}

package() {
  cd bake-modernize
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 license.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
