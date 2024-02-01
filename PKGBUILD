# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=toml-rb
pkgname=ruby-$_gemname
pkgver=3.0.1
pkgrel=1
pkgdesc="A parser for TOML using Citrus library"
arch=(any)
url=https://github.com/emancu/toml-rb
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-citrus ruby-racc)
checkdepends=(ruby-rake ruby-minitest)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('4ae7b7a1d9114b03c1481b13d0630138f7fa1185fdc1a93029ee4e674633047d')

prepare() {
  cd $_gemname-$pkgver
  sed -i '/standard/d' ${_gemname}.gemspec
  sed -i '/standard/d' Rakefile
}

build() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  gem build "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
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

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rake
}

package() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
