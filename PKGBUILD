# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

pkgname=libvirt-vnc-viewer
pkgver=11.0
pkgrel=4
pkgdesc='Libvirt VNC Viewer GUI application.'
arch=('x86_64')
url='https://gitlab.com/virt-viewer/virt-viewer'
license=(
  'GPL'
)
depends=(
  'gtk-vnc'
  'libvirt-glib-vnc'
  'libvirt-vnc'
)
makedepends=(
  'gobject-introspection'
  'intltool'
  'meson'
)
conflicts=(
  'virt-viewer'
)
source=(
  "https://virt-manager.org/download/sources/virt-viewer/virt-viewer-${pkgver}.tar.xz"{,.asc}
  "https://gitlab.com/Paper_/virt-viewer/-/commit/41cc016278e713d3db156761fce6437dff81a53a.patch"
  "meson.build.patch"
  "src-meson.build.patch"
)
sha256sums=(
  'a43fa2325c4c1c77a5c8c98065ac30ef0511a21ac98e590f22340869bad9abd0'
  'SKIP'
  '53a905df3678fdf1be238e3e5e27a8b60126d9238a5058da8476fdcb80ccaf71'
  'c50cc3766e4c93530c1a79ea406a2015c804b7575b32d4c1d32fe3168a53d265'
  '18f8eff99c1bc199ac60863bf6851ba8afe9b0e42d1a0f528507792c4a3a4338'
)
validpgpkeys=(
  'DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF' # Daniel P. Berrange
)

prepare() {
  cd "${srcdir}/virt-viewer-${pkgver}"
  patch -p1 < "${srcdir}/41cc016278e713d3db156761fce6437dff81a53a.patch"
  patch meson.build < "${srcdir}/meson.build.patch"
  patch src/meson.build < "${srcdir}/src-meson.build.patch"
}

build() {
  cd "${srcdir}/virt-viewer-${pkgver}"

  arch-meson build \
    --auto-features disabled \
    -Dbash_completion=disabled \
    -Dlibvirt=enabled \
    -Dovirt=disabled \
    -Dspice=disabled \
    -Dvnc=enabled \
    -Dvte=disabled

  ninja -C build
}

package() {
  cd "${srcdir}/virt-viewer-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C build install
}
