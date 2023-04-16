# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=flog
pkgname=ruby-$_gemname
pkgver=4.6.6
pkgrel=1
pkgdesc="Reports the most tortured code in an easy to read pain report"
arch=(any)
url=https://github.com/seattlerb/flog
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-path_expander ruby-ruby_parser ruby-sexp_processor)
checkdepends=(ruby-minitest)
makedepends=(ruby-hoe ruby-rdoc rubygems)
source=(${url}/archive/v${pkgver}/$_gemname-$pkgver.tar.gz)
sha256sums=('a67ac1754a48e3bc250a384afac58144f92b71befde3340a0bf029dbbde9fc8b')

prepare() {
  cd $_gemname-$pkgver

  # there is no license file in the repo, but we can extract one
  sed '/== License:/,$!d' README.rdoc > LICENSE
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
