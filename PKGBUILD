# Maintainer:  Jeffrey Zhang <zhang.lei.fly@gmail.com>

_pkgname=virt-viewer
pkgname=$_pkgname-no-header
pkgver=11.0
pkgrel=2
pkgdesc='A lightweight interface for interacting with the graphical display of virtualized guest OS. This package contains a patch drop the header bar.'
arch=('x86_64')
url='https://gitlab.com/virt-viewer/virt-viewer'
license=('GPL')
depends=('gtk-vnc' 'libvirt' 'spice-gtk' 'libvirt-glib' 'libgovirt' 'vte3')
makedepends=('meson' 'intltool' 'spice-protocol' 'gobject-introspection' 'bash-completion')
replaces=('virtviewer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "https://virt-manager.org/download/sources/virt-viewer/virt-viewer-${pkgver}.tar.xz"{,.asc}
    "drop-header.patch")
b2sums=('41914a60361f0a47a0b0b54962d228ffaec67c6b69c664bb6fe683b7074dd5e2136d2bf3528b6e1b6b785cc4e337125fe16fdd94dd603dd42e8fde543931241a'
        'SKIP'
        '6571f7637f8328118bb4469d52a92936820ebc7a037bb9cf6e6bd257889ec43b18d4c9c952cf1d968ef4b8c4a08ea4358cec47754d869b6e59153a0f2dddf578')
validpgpkeys=('DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF') # Daniel P. Berrange

build() {
  (cd ${_pkgname}-${pkgver}; patch -p1 < "${srcdir}/drop-header.patch")
  arch-meson virt-viewer-${pkgver} build \
    -Dlibvirt=enabled \
    -Dvnc=enabled \
    -Dspice=enabled \
    -Dovirt=enabled \
    -Dvte=enabled \
    -Dbash_completion=enabled

  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
