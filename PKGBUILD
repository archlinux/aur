# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

_pkgname=goexif
pkgname=goexif-git
pkgver=r135.709fab3
pkgrel=2
pkgdesc="Provides decoding of basic exif and tiff encoded data"
arch=('i686' 'x86_64')
url="https://github.com/rwcarlsen/goexif"
license=('BSD-2Clause')
makedepends=('go')
provides=('goexif')
source=("git://github.com/rwcarlsen/goexif.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  local dir_ext="build/src/github.com/rwcarlsen/goexif"
  mkdir -p "${dir_ext}"
  cp -ra tiff "${dir_ext}/tiff/"
  cp -ra mknote "${dir_ext}/mknote/"
  cp -ra exif "${dir_ext}/exif/"
  cp -ra exifstat "${dir_ext}/exifstat/"
}

build() {
  cd "$_pkgname"
  export GOPATH="${PWD}/build"
  cd exifstat
  go build
}

package() {
  cd "${_pkgname}"
  local dir_ext="${pkgdir}/usr/lib/go/src/github.com/rwcarlsen/goexif"
  mkdir -p "${dir_ext}"

  cp -ra "exif" "${dir_ext}/exif"
  cp -ra "exifstat" "${dir_ext}/exifstat"
  cp -ra "mknote" "${dir_ext}/mknote"
  cp -ra "tiff" "${dir_ext}/tiff"

  cd exifstat
  install -Dm755 exifstat "${pkgdir}/usr/bin/exifstat"
}

