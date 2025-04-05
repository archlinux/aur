# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-shindo
pkgver=0.3.11
pkgrel=4
pkgdesc='Simple depth first ruby testing, watch and learn.'
arch=(any)
url='https://github.com/geemus/shindo'
license=(MIT)
depends=(
  ruby
  ruby-formatador
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-rake
)
options=(!emptydirs)
source=(https://github.com/geemus/shindo/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('f8320cb490e4dd18e6b7884dcfaba9cdc76a1f60c803c0f9471baf1c6f9794feacb0059744630ca74e1b6505047caec84d7c87f8651fd5d716e30d16c77d31f7')
b2sums=('657cff1780acb4dc21e3aec8f3f17d07d18768ba714a543b813636f968fc337804cf590b7472e37f6b8b07f99920b8450c5a56709e5e7550cd7fe4970ec82c96')

build() {
  local _gemdir="$(gem env gemdir)"
  cd shindo-$pkgver
  gem build shindo.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    shindo-$pkgver.gem
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
  cd shindo-$pkgver
  PATH="$PWD/tmp_install/usr/bin:$PATH" GEM_HOME="tmp_install/$_gemdir" rake tests
}

package() {
  cd shindo-$pkgver
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
