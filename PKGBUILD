#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
_pkgname=id3tag
pkgname=ruby-$_pkgname
pkgver=1.1.0
pkgrel=2
pkgdesc="Native Ruby ID3 tag reader that aims for 100% coverage of ID3v2.x and ID3v1.x standards"
arch=("any")
url="https://github.com/krists/id3tag"
license=('MIT')
checkdepends=(ruby-rspec)
depends=(ruby ruby-nokogiri)
source=("https://github.com/krists/$_pkgname/archive/refs/tags/v$pkgver.zip")
b2sums=('70a4ac60683d8a9b5025e720370b4c8911352d48e6b48caeda231b33c983476d3caba019a4b2d3319ab32501c8a6b18ae5548e521d731a8c12146d82557e39cd')

# Most of this file comes from https://wiki.archlinux.org/title/Ruby_package_guidelines

prepare() {
  cd "${_pkgname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_pkgname}.gemspec"
}

build() {
  cd "${_pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem build "${_pkgname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_pkgname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_pkgname}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_pkgname}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  GEM_HOME="tmp_install/${_gemdir}" rspec
}

package() {
  cd "${_pkgname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE.txt --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/standard_documents"
  install --verbose -D --mode=0644 standard_documents/* --target-directory "${pkgdir}/usr/share/doc/${pkgname}/standard_documents"
}

# vim: syntax=bash
