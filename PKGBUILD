# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=ruby-formatador
pkgver=1.2.3
pkgrel=1
pkgdesc='STDOUT text formatting'
arch=(any)
url='https://github.com/geemus/formatador'
license=(MIT)
depends=(
  ruby-reline
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-rake
  ruby-shindo
)
options=(!emptydirs)
source=(https://github.com/geemus/formatador/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a5b0303ec28f6fa666cf0d9bf8ec84f26c8a963cc998572f7c8059cb4a1b4f7b')

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
