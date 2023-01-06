# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

pkgname=libvirt-glib-vnc
pkgver=4.0.0
pkgrel=3
pkgdesc='Libvirt-Glib runtime libraries and headers exclusively for VNC support.'
arch=('x86_64')
url="https://gitlab.com/libvirt/libvirt-glib"
license=(
  'LGPL2.1'
)
depends=(
  'libcap-ng'
  'libvirt-vnc'
)
makedepends=(
  'gobject-introspection'
  'intltool'
  'meson'
  'python'
  'vala'
)
conflicts=(
  'libvirt-glib'
)
source=(
  "https://libvirt.org/sources/glib/libvirt-glib-${pkgver}.tar.xz"{,'.asc'}
  "libvirt-glib-meson.build.patch"
)
sha256sums=(
  '8423f7069daa476307321d1c11e2ecc285340cd32ca9fc05207762843edeacbd'
  'SKIP'
  '274acd43b641abfc5b378ad866ac0dad78abd942ac347e2049eefa3ce2e5362c'
)
validpgpkeys=(
  '453B65310595562855471199CA68BE8010084C9C' # Jiří Denemark <jdenemar@redhat.com>
  'DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF' # Daniel P. Berrange <dan@berrange.com>
)

prepare() {
  cd "${srcdir}/libvirt-glib-${pkgver}"
  patch meson.build < "${srcdir}/libvirt-glib-meson.build.patch"
}

build() {
  cd "${srcdir}/libvirt-glib-${pkgver}"
  arch-meson build \
    --prefix=/usr \
    --buildtype=plain \
    --auto-features disabled \
    -Ddocs=disabled \
    -Dintrospection=disabled \
    -Dtests=disabled \
    -Dvapi=disabled

  ninja -C build
}

package() {
  cd "${srcdir}/libvirt-glib-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
