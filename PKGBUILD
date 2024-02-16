# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=gemoji
pkgname=ruby-$_gemname
pkgver=4.1.0
pkgrel=1
pkgdesc="Character information and metadata for Unicode emoji"
arch=(any)
url=https://github.com/github/gemoji
license=(MIT)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-i18n ruby-minitest)
makedepends=(rubygems ruby-rdoc)
source=(${url}/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('68c26ccc2901eca303f29d38efe65b66434f92461fb218a00fd7919fb7839c21')

prepare() {
  cd $_gemname-$pkgver

  sed -i 's/MiniTest/Minitest/g' test/test_helper.rb
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

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
