# Maintainer: nomisge <nomisge @ live . de>
pkgname=asciidoctor-revealjs
_name=asciidoctor-reveal.js
pkgver=6.0.1
pkgrel=1
pkgdesc="Asciidoctor reveal.js is a converter for Asciidoctor and Asciidoctor.js that transforms an AsciiDoc document into an HTML5 presentation designed to be executed by the reveal.js presentation framework."
arch=('any')
url="https://github.com/asciidoctor/asciidoctor-reveal.js"
license=('MIT')
depends=(
	'ruby'
	'ruby-rake'
)
makedepends=(
	'rubygems'
	'ruby-bundler'
	'ruby-nokogiri'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=(!emptydirs)
sha256sums=('04950e545c4c84479809a492857443eaa57eb562e1d22851947291df1b4b7df4')



build() {
  cd "${srcdir}/$_name-${pkgver}"
  local gemdir="$(gem env gemdir)"

  gem build "${pkgname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --build-root "tmp_install" \
    "${pkgname}-${pkgver}.gem"

  rm --force --recursive --verbose \
    "tmp_install/${gemdir}/cache/" \
    "tmp_install/${gemdir}/gems/${pkgname}-${pkgver}/vendor/" \
    "tmp_install/${gemdir}/doc/${pkgname}-${pkgver}/ri/ext/"

  find "tmp_install/${gemdir}/gems/" \
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

  find "tmp_install/${gemdir}/extensions/" \
    -type f \
    \( \
    -iname "mkmf.log" -o \
    -iname "gem_make.out" \
    \) \
    -delete
}

package() {
  cd "${srcdir}/$_name-${pkgver}"
  cp -a -t "${pkgdir}" tmp_install/*
  install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./*.adoc
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.adoc
}

