# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>

pkgname=ruby-highline
pkgver=2.1.0
_commit=33cee8a7a7946e27b3be8459721f69c73eee7694
pkgrel=1
pkgdesc='A higher level command-line oriented interface'
arch=(x86_64)
url='https://github.com/JEG2/highline'
license=(MIT)
depends=(ruby)
makedepends=(git)
checkdepends=(ruby-rake ruby-minitest ruby-simplecov)
options=(!emptydirs)
source=(git+https://github.com/JEG2/highline.git#commit=$_commit)
sha256sums=('SKIP')

build() {
  local _gemdir="$(gem env gemdir)"
  cd highline
  gem build highline.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    highline-$pkgver.gem
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
  cd highline
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd highline
  cp -a tmp_install/* "$pkgdir"/
}
