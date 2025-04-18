# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-bake-modernize
pkgver=0.33.0
pkgrel=2
pkgdesc='Automatically modernize parts of your project/gem'
arch=(any)
url='https://github.com/ioquatix/bake-modernize'
license=(MIT)
depends=(
  ruby
  ruby-async-http
  ruby-bake
  ruby-build-files
  ruby-markly
  ruby-rugged
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  ruby-bake-test
  ruby-bake-test-external
  ruby-bundler
  ruby-covered
  ruby-decode
  ruby-sus
)
options=(!emptydirs)
source=(git+https://github.com/ioquatix/bake-modernize.git#tag=v$pkgver)
sha512sums=('4584c6f7f20f0e8ad782ebfe589b368519bbe978ae048680c79dd57b7f8066d4397ea94cfe0b45d309bf0ab9720c03f4cdb9d8a386ee8b7bbdac0dcc49f0591c')
b2sums=('9cd5401d260d6c090059364a994e2f19ebf56da1897331efd18c19eeb60042da2ec60b1348f210d669c01b3b08cda26ad23e1db3827a27d6b143a64f9d05b35f')

prepare() {
  cd bake-modernize
  sed -i -e '/signing_key/d' -e 's/~>/>=/' bake-modernize.gemspec

  sed --in-place \
    --expression '/group :maintenance/,/end/d' \
    --expression '/rubocop/d' \
    gems.rb
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
