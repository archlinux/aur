# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-formatador
pkgver=1.1.0
pkgrel=1
pkgdesc='STDOUT text formatting'
arch=(any)
url='https://github.com/geemus/formatador'
license=(MIT)
depends=(ruby)
checkdepends=(ruby-rake ruby-shindo)
options=(!emptydirs)
source=(https://github.com/geemus/formatador/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('cde51ce5fbe5871628344010d3d311afdf4de279f69133146045b9834a45f2c8')

build() {
  local _gemdir="$(gem env gemdir)"
  cd formatador-$pkgver
  gem build formatador.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    formatador-$pkgver.gem
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
  cd formatador-$pkgver
  GEM_HOME="tmp_install/$_gemdir" rake
}

package() {
  cd formatador-$pkgver
  cp -a tmp_install/* "$pkgdir"/
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
