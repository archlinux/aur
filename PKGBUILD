# Maintainer: Marshal Horn <kamocat at gmail dot com>

pkgname=opentracecapture
pkgver=0.1.2_alpha.12
pkgrel=1
pkgdesc="A brief description of your project."
arch=('x86_64')
url="https://example.com/your-project"
license=('GPL-3.0-only') 
makedepends=('meson' 'ninja' 'pkg-config') # Add any other build dependencies here
depends=('glib2' 'libusb' 'libzip') # Add any runtime dependencies here
optdepends=('zlib: used for CRC32 in STF input' 
	'libtirpc: optional, used by VXI, fallback when glibc >= 2.26'
        'libserialport>=0.1.1: used by some drivers'
        'librevisa>=0.0.20130412: used by some drivers'
        'hidapi>=0.8.0: used for some HID based "serial cables"'
        'bluez: for Bluetooth or BLE communication'
        'libftdi1>=1.0: used by some drivers'
        'libgpib: used by some drivers'
        'libieee1284: used by some drivers'
        'libgio>=2.32.0: used by some drivers'
        'nettle: used by some drivers'
        'check>=0.9.4: to run unit tests'
        'doxygen: for the C API docs'
	'graphviz: for the C API docs')
source=("v${pkgver//_/-}.tar.gz::https://github.com/OpenTraceLab/OpenTraceCapture/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('3717ea78c8c19a8951243e737f0c1e12a19f1084ca46a6072e3e6e3f53cb7c64')

prepare() {
  patch -d "OpenTraceCapture-${pkgver//_/-}" -Np1 -i ../../gpib.patch
}

build() {
  cd "OpenTraceCapture-${pkgver//_/-}"
  arch-meson build # Configure Meson build directory
  meson compile -C build # Compile the project
}

check() {
  cd "OpenTraceCapture-${pkgver//_/-}"
  meson test -C build --print-errorlogs # Run tests (optional)
}

package() {
  cd "OpenTraceCapture-${pkgver//_/-}"
  meson install -C build --destdir "$pkgdir" # Install files to pkgdir
}
