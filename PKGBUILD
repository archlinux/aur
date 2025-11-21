# Maintainer: Marshal Horn <kamocat at gmail dot com>

pkgname=opentracecapture
pkgver=0.2.0
pkgrel=2
pkgdesc="Signal analysis library for logic analyzers, oscilloscopes, and multimeters."
arch=('x86_64')
url="https://opentracelab.github.io/website/"
license=('GPL-3.0-only') 
makedepends=('meson' 'ninja' 'pkgconf') # Add any other build dependencies here
depends=('glib2' 'libusb' 'libzip') # Add any runtime dependencies here
optdepends=('zlib: used for CRC32 in STF input' 
	'libtirpc: used by VXI, fallback when glibc >= 2.26'
        'libserialport>=0.1.1: used by some drivers'
        'hidapi>=0.8.0: used for some HID based "serial cables"'
        'bluez: for Bluetooth or BLE communication'
        'libftdi>=1.0: used by some drivers'
        'linux-gpib: used by some drivers'
        'libieee1284: used by some drivers'
        'nettle: used by some drivers'
        'check>=0.9.4: to run unit tests'
        'doxygen: for the C API docs'
	'graphviz: for the C API docs')
source=("v${pkgver}.tar.gz::https://github.com/OpenTraceLab/OpenTraceCapture/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4514756fe7d53c9b638693224e4a347dd209e25bbded28a602b4cf191ed0e520') #generate with makepkg -g

prepare() {
  patch -d "OpenTraceCapture-${pkgver}" -Np1 -i ../../gpib.patch
}

build() {
  cd "OpenTraceCapture-${pkgver}"
  arch-meson build # Configure Meson build directory
  meson compile -C build # Compile the project
}

check() {
  cd "OpenTraceCapture-${pkgver}"
  meson test -C build --print-errorlogs # Run tests (optional)
}

package() {
  cd "OpenTraceCapture-${pkgver}"
  meson install -C build --destdir "$pkgdir" # Install files to pkgdir
}
