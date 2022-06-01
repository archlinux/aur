# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=virt-viewer
pkgname=$_pkgname-light
pkgver=11.0
pkgrel=3
pkgdesc='A lightweight interface for interacting with the graphical display of virtualized guest OS. This package contains a patch drop the header bar.'
arch=('x86_64')
url='https://gitlab.com/virt-viewer/virt-viewer'
license=('GPL')
depends=('gtk-vnc' 'libvirt' 'libvirt-glib')
makedepends=('meson' 'intltool' 'gobject-introspection')
replaces=("${_pkgname}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://virt-manager.org/download/sources/virt-viewer/virt-viewer-${pkgver}.tar.xz"{,.asc}
    "https://gitlab.com/Paper_/virt-viewer/-/commit/41cc016278e713d3db156761fce6437dff81a53a.patch")
b2sums=('41914a60361f0a47a0b0b54962d228ffaec67c6b69c664bb6fe683b7074dd5e2136d2bf3528b6e1b6b785cc4e337125fe16fdd94dd603dd42e8fde543931241a'
        'SKIP'
        'd1b79f2bdc2749049767d7e22cf530c04438547fb3485fd0ab084222600ddcb08b8a27e104216c5da9b25d9c792d1cdf085d1c23c988194c3c6c22cf05eaa0e2')
validpgpkeys=('DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF') # Daniel P. Berrange

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/41cc016278e713d3db156761fce6437dff81a53a.patch"
}

build() {
  arch-meson "${_pkgname}-${pkgver}" build \
    -Dbash_completion=disabled \
    -Dlibvirt=enabled \
    -Dovirt=disabled \
    -Dspice=disabled \
    -Dvnc=enabled \
    -Dvte=disabled

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
