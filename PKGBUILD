# Maintainer: john peter sa <johnppetersa@gmail.com>
pkgname=mainline-arch
pkgver=1.5.1
pkgrel=1
pkgdesc="Tool to install and manage mainline kernels from the Arch Linux Archive"
arch=('x86_64')
url="https://github.com/johnpetersa19/mainline_arch"
license=('GPL3')

# Updated dependencies for the GTK4 / Libadwaita version
depends=('gtk4' 'libadwaita' 'vte4' 'json-glib' 'libgee' 'aria2')
makedepends=('meson' 'ninja' 'vala')
conflicts=('mainline')
provides=('mainline')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP') # Use 'makepkg -g' to generate the correct checksum

build() {
  # The directory inside the tarball is usually 'mainline_arch-1.5.0' or 'mainline-1.5.0'
  # Adjusting to match the standard GitHub archive naming
  cd "mainline_arch-${pkgver}"
  
  # Ensure we generate the build files before compiling
  python3 write_meson.py
  
  arch-meson build
  meson compile -C build
}

package() {
  cd "mainline_arch-${pkgver}"
  DESTDIR="$pkgdir" meson install -C build
}
