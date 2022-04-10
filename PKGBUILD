#!/bin/bash

# Maintainer: dreieck

_pkgname=postforward
pkgname="${_pkgname}-git"
pkgver=1.1.1_2+r16.20201206.ce7f4fd
epoch=1
pkgrel=1

pkgdesc="A mail forwarding utility which aims to compliment postsrsd: Instead of rewriting all incoming mail regardless of final destination, only to-be-forwarded mail is passed to postsrsd."
url="http://github.com/zoni/postforward"
license=('BSD')

arch=(
  'i686'
  'x86_64'
  'arm'
  'arm64'
  'aarch64'
)

depends=(
  'postsrsd'
)
makedepends=(
  'git'
  'go'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
replaces=()
conflicts=(
  "${_pkgname}"
)

options=('emptydirs' 'strip')

source=(
  "${_pkgname}::git+https://github.com/zoni/${_pkgname}.git"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^v||' | sed 's|\-[^-]*$||' | tr '-' '_')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf %s "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}


build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -v -D -m755 postforward "${pkgdir}/usr/bin/postforward"

  for _docfile in CHANGES.md README.md; do
    install -v -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -v -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
