# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=flay
pkgname=ruby-$_gemname
pkgver=2.13.0
pkgrel=1
pkgdesc="Analyzes code for structural similarities"
arch=(any)
url=https://github.com/seattlerb/flay
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-erubi ruby-path_expander ruby-ruby2ruby ruby-ruby_parser
         ruby-sexp_processor)
checkdepends=(ruby-minitest)
makedepends=(ruby-rdoc ruby-hoe rubygems)
source=(${url}/archive/v${pkgver}/$_gemname-$pkgver.tar.gz)
sha256sums=('dd612bbcddae6171975841049ea036d9308e3d09c0cb241202e80d0c5e9508a9')

prepare() {
  cd $_gemname-$pkgver

  # there is no license file in the repo, but we can extract one
  sed '/== License:/,$!d' README.rdoc > LICENSE

  # this test expects no error output to stderr but we
  # get a bunch of deprecation warnings from sexp (but no other
  # error output)
  sed -i '285d' test/test_flay.rb
}

build() {
  cd $_gemname-$pkgver
  local _gemdir="$(gem env gemdir)"

  rake gem

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "pkg/${_gemname}-${pkgver}.gem"

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
  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd $_gemname-$pkgver

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install -v -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -v -Dm0644 *.rdoc -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=2 sw=2 et:
