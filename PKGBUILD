# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=osm-bulk-upload-git
_pkgname="${pkgname%-git}"
pkgver=r9.5033f43
pkgrel=1
pkgdesc="set of tools for performing bulk imports to OpenStreetMap database"
url="https://wiki.openstreetmap.org/wiki/Upload.py"
depends=('python' 'python2')
makedepends=('git')
license=('GPL')
arch=('any')
provides=('osm-bulk-upload')
conflicts=('osm-bulk-upload')
source=("${_pkgname}"::'git+https://github.com/grigory-rechistov/osm-bulk-upload')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # python means python2
  cd "${srcdir}/${_pkgname}"
  sed -i 's%^#! /usr/bin/python$%&2%' *.py
}

package() {
  cd ${srcdir}/${_pkgname}
  install -dm755 "$pkgdir/usr/share/${_pkgname}" "$pkgdir/usr/bin"
  for file in *.py
  do
    install -Dm755 "${file}" "${pkgdir}/usr/share/${_pkgname}/${file}"
  done
  for file in osm2change conflict-view diff-patch osmpatch change2diff change2diff2 set-changeset-tag
  do
    ln -sf "/usr/share/${_pkgname}/${file}.py" "${pkgdir}/usr/bin/${file}"
  done
  ln -sf "/usr/share/${_pkgname}/upload.py" "${pkgdir}/usr/bin/osm-upload"
}

# vim:set ts=2 sw=2 et:
