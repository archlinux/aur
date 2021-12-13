# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
# NOTE: DON'T FORGET TO CHECK IF THE DEBIAN PACKAGE HAS BEEN UPDATED!!!
_pkgname=mirage
pkgname="${_pkgname}-python3"
pkgver=0.11.1
pkgrel=3
_debian_pkgrel=1build2
pkgdesc="A fast and simple GTK+ Image Viewer (Python3 port)"
arch=('any')
url="https://gitlab.com/thomasross/mirage"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('python' 'gtk3' 'python-gobject' 'python-cairo' 'libgexiv2')
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/thomasross/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
        "${pkgname}-${pkgver}.debian.tar.xz::https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${_pkgname}/${pkgver}-${_debian_pkgrel}/${_pkgname}_${pkgver}-${_debian_pkgrel}.debian.tar.xz"
        "${pkgname}.patch")
sha256sums=('2932f7e9e6a1da7785cae2664669eff6f12ca26163afb3d1a3c8e1cc3255e5ec'
            '48b5cf3ff7d50d602ea673a424ffd659ab8813ce7dd1837b574cf39eb732c50a'
            '2de9c32689e1b0d2c559ea68b5eca4f0b37a53ddd8687b7a9c36b51c11ffee6b')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/${pkgname}.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"

  cp "${srcdir}/debian/${_pkgname}.1" .

  local po_file; for po_file in po/*.po; do
    local po_file_lang="$(basename "$po_file" .po)"
    if [[ "$po_file_lang" != "messages" ]]; then
      local mo_file_dir="mo/${po_file_lang}"
      mkdir -p "$mo_file_dir"
      local mo_file="${mo_file_dir}/${_pkgname}.mo"
      echo "generating ${mo_file}"
      msgfmt "$po_file" -o "$mo_file"
    fi
  done

  glib-compile-resources --sourcedir="resources" --target="io.thomasross.${_pkgname}.gresource" "resources/${_pkgname}.gresource.xml"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
