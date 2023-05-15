#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
_pkgname=overdrive-m4b
pkgbase=$_pkgname-git
pkgname=$pkgbase
pkgver=1.0.0.r4.g80242f4
pkgrel=2
pkgdesc='A dirty script to convert OverDrive audiobooks to a single `.m4b` file. According to its author: use at your peril.'
arch=("any")
url="https://github.com/pflouret/$_pkgname"
license=('Apache')
checkdepends=(ruby-rspec)
depends=(ffmpeg grep id3lib libfdk-aac libmp4v2 ruby ruby-id3tag ruby-nokogiri xidel)
makedepends=(git)
source=("git+https://github.com/pflouret/$_pkgname.git")
provides=($_pkgname)
conflicts=($_pkgname)
b2sums=('SKIP')

# Most of this file comes from https://wiki.archlinux.org/title/Ruby_package_guidelines

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_pkgname}.gemspec"
}

build() {
  cd "${_pkgname}"

  local _gemdir="$(gem env gemdir)"

  gem build "${_pkgname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_pkgname}-${pkgver%%.r*}.gem"

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
  cd "${_pkgname}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: syntax=bash
