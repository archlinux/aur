# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# NOTE: DON'T FORGET TO CHECK IF THE DEBIAN PACKAGE HAS BEEN UPDATED!!!

pkgname=mirage
pkgver=0.11.1
pkgrel=2
_debian_pkgrel=1build4
pkgdesc="A fast and simple GTK+ Image Viewer"
arch=('any')
url="https://gitlab.com/thomasross/mirage"
license=('GPL3')
replaces=("${pkgname}-python3")
conflicts=("${pkgname}-python3")
depends=('python' 'gtk3' 'python-gobject' 'python-cairo' 'libgexiv2')
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/thomasross/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}-${pkgver}-${_debian_pkgrel}.debian.tar.xz::https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${pkgname}/${pkgver}-${_debian_pkgrel}/${pkgname}_${pkgver}-${_debian_pkgrel}.debian.tar.xz"
        "${pkgname}.patch"
        "${pkgname}-python310-fixes.patch")
sha256sums=('a97676c10b8e51130253a8afec8842b1234027a760244b117af9c35962dab29f'
            'a818b922af4b6c9fe4aa54f04988e34f922628fc2a942c78bbc357e396e7b304'
            '2de9c32689e1b0d2c559ea68b5eca4f0b37a53ddd8687b7a9c36b51c11ffee6b'
            '485546cf69a018ff5580af3f8aef921fe99624034f9e1915958285f5d8524a4d')

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
