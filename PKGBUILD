# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=oj
pkgname=ruby-$_gemname
pkgver=3.16.1
pkgrel=1
pkgdesc="The fastest JSON parser and object serializer"
arch=(i686 x86_64)
url=http://www.ohler.com/oj/
license=(MIT)
options=(!emptydirs)
depends=(ruby)
checkdepends=(ruby-bundler ruby-rake ruby-rake-compiler ruby-minitest
              ruby-test-unit)
makedepends=(rubygems ruby-rdoc)
source=(https://github.com/ohler55/oj/archive/v$pkgver/$_gemname-$pkgver.tar.gz)
sha256sums=('92079e172ca4ae5731ef27ecb1cb8a3e6cd9605f1359cb73631bebcf62bef5e3')

prepare() {
  cd $_gemname-$pkgver

  # oj insists on running some tests with bundler
  sed -i 's/bundle exec//' Rakefile
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

  install -vDm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
