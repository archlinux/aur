# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libgexiv2
_pkgbase=gexiv2
pkgver=0.14.1
pkgrel=3
pkgdesc="GObject-based wrapper around the Exiv2 library (32-bit)"
url="https://wiki.gnome.org/Projects/gexiv2"
arch=('x86_64')
license=('GPL2')
depends=('lib32-exiv2' 'lib32-glib2' 'libgexiv2')
makedepends=('meson' 'python-gobject')
source=("https://gitlab.gnome.org/GNOME/${_pkgbase}/-/archive/${_pkgbase}-${pkgver}/${_pkgbase}-${_pkgbase}-${pkgver}.tar.gz"
        "https://gitlab.gnome.org/GNOME/${_pkgbase}/-/commit/06adc8fb.patch"
        "fix-32bit-compat.patch"
        "x86-linux-gnu")
sha512sums=('fbaf69681e031323ccc5233dbcf44e1fd66c23be29c4c731bec74417c3f4a01a3ac7af64cbd2e3ccfd8e2509d616eaa42d0a6a0eee8eab938db966ff0967afa2'
            '8e8fbdfbf13bb95a63b1e39b56a5c3de217fa4a743b4dd59f9cd53e07d92fbf60adbb964f7765d1635ea957aae4796870d87d78e0f313be4a3d42e0b34f05f02'
            '17145efdd464e196b92c9922920b73ff3bb1b7341c6c19c6443b6fcebce64c21e6e3ce4c425f7b76ad1d570d2104f48f6ec765762f6e64881b518a862c77e0e4'
            '23afdfc444563455a7a7ebccbc5e92e39bb2726d7785cd33ddbe856ea479a139778e5b816267025d5e183094fae040b0aaf6be5a166693879a102d5e6e859c3c')

prepare() {
  # Fix build with exiv2 0.28
  patch -d "${_pkgbase}-${_pkgbase}-${pkgver}" -p1 < 06adc8fb.patch
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

