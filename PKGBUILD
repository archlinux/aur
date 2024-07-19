# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# NOTE: DON'T FORGET TO CHECK IF THE DEBIAN PACKAGE HAS BEEN UPDATED!!!

pkgname=mirage
pkgver=0.11.2
pkgrel=1
_debian_pkgrel=1build1
pkgdesc="A fast and simple GTK+ Image Viewer"
arch=('any')
url="https://gitlab.com/thomasross/mirage"
license=('GPL3')
replaces=("${pkgname}-python3")
conflicts=("${pkgname}-python3")
depends=('python' 'gtk3' 'python-gobject' 'python-cairo' 'libgexiv2')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/thomasross/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}-${pkgver}-${_debian_pkgrel}.debian.tar.xz::https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${pkgname}/${pkgver}-${_debian_pkgrel}/${pkgname}_${pkgver}-${_debian_pkgrel}.debian.tar.xz"
        "${pkgname}.patch"
        "${pkgname}-python310-fixes.patch")
sha256sums=('97faf83a3292df043a295c8bac2726f066983dcb51c26c77e0454599bd9e62da'
            '34827dca17ebb6537060e23bdbd974fac48e6e205dbb583fb33e3ddd839f14a6'
            'd348ba1883857b6fe3d7c6c22359b7a76e16c817b364e483ed9afbfc43d121f4'
            'db7a3f7056485bc4fe49ce85358304de445aaf101c4cc7ff2de622398513095a')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}-python310-fixes.patch"
}

build() {
  cd "${pkgname}-${pkgver}"

  cp "${srcdir}/debian/${pkgname}.1" .

  local po_file; for po_file in po/*.po; do
    local po_file_lang="$(basename "$po_file" .po)"
    if [[ "$po_file_lang" != "messages" ]]; then
      local mo_file_dir="mo/${po_file_lang}"
      mkdir -p "$mo_file_dir"
      local mo_file="${mo_file_dir}/${pkgname}.mo"
      echo "generating ${mo_file}"
      msgfmt "$po_file" -o "$mo_file"
    fi
  done

  glib-compile-resources --sourcedir="resources" --target="io.thomasross.${pkgname}.gresource" "resources/${pkgname}.gresource.xml"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
