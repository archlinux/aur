# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libgexiv2
_pkgbase=gexiv2
pkgver=0.14.2
pkgrel=1
pkgdesc="GObject-based wrapper around the Exiv2 library (32-bit)"
url="https://wiki.gnome.org/Projects/gexiv2"
arch=('x86_64')
license=('GPL2')
depends=('lib32-exiv2' 'lib32-glib2' 'libgexiv2')
makedepends=('meson' 'python-gobject')
source=("https://gitlab.gnome.org/GNOME/${_pkgbase}/-/archive/${_pkgbase}-${pkgver}/${_pkgbase}-${_pkgbase}-${pkgver}.tar.gz"
        "fix-32bit-compat.patch"
        "x86-linux-gnu")
sha512sums=('2657e72773afe74dd59268a03f74ed4d24bfa051e9ca405c13fa2cca75dd1482f92b4300ca5e1f033aba358a05582fe664922eaa319fa2b66cda8ef0e6dff8d3'
            '6208952fd6babbf58f057764ba6e5beb97bc8c0a4495b6937374177fb53d4274192376548b35d9ff70beabc565c45dafa5ab9e5b246401b3ff461159bee7faec'
            '23afdfc444563455a7a7ebccbc5e92e39bb2726d7785cd33ddbe856ea479a139778e5b816267025d5e183094fae040b0aaf6be5a166693879a102d5e6e859c3c')

prepare() {
  patch -d "${_pkgbase}-${_pkgbase}-${pkgver}" -p1 < fix-32bit-compat.patch
}

build() {
  mkdir -p "build"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  arch-meson "${_pkgbase}-${_pkgbase}-${pkgver}" "build" \
    -Dgtk_doc=false -Dintrospection=false -Dvapi=false -Dpython3=false \
    --cross-file x86-linux-gnu
  meson compile -C "build"
}

package() {
  meson install -C "build" --destdir "$pkgdir"
  rm -r "$pkgdir/usr/include"
}
