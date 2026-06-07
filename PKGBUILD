# Maintainer: AndyHazz <andy.nmc@gmail.com>
pkgname=libfprint-goodix53x5
pkgver=1.94.10
pkgrel=9
pkgdesc="libfprint with Goodix HTK32 (27c6:5335/5385/5395) driver - Dell XPS 13 9305 / XPS 13 7390 / XPS 15 9570"
arch=('x86_64')
url="https://github.com/AndyHazz/goodix53x5-libfprint"
license=('LGPL-2.1-or-later')
depends=('libusb' 'libgusb' 'pixman' 'cairo' 'glib2' 'nss'
         'libjpeg-turbo' 'openssl' 'opencv')
makedepends=('git' 'meson' 'ninja' 'gcc' 'pkgconf' 'gtk-doc'
             'gobject-introspection')
optdepends=('fprintd: fingerprint authentication daemon')
provides=('libfprint' 'libfprint-2' 'libfprint-2.so')
conflicts=('libfprint' 'libfprint-2')
options=(!debug)
install="$pkgname.install"
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#tag=v${pkgver}"
        "git+https://github.com/AndyHazz/goodix53x5-libfprint.git#commit=59c3c783835b64adf6568c48eb24d697c7c4021f")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/libfprint"

  # Copy driver sources into the libfprint tree
  cp -r "$srcdir/goodix53x5-libfprint/drivers/goodix53x5" libfprint/drivers/
  cp -r "$srcdir/goodix53x5-libfprint/sigfm" libfprint/

  # Patch meson build files to register the driver and SIGFM library
  patch -p1 < "$srcdir/goodix53x5-libfprint/meson-integration.patch"
}

build() {
  cd "$srcdir/libfprint"
  meson setup builddir --prefix=/usr -Dinstalled-tests=false -Ddoc=false
  ninja -C builddir
}

package() {
  cd "$srcdir/libfprint"
  DESTDIR="$pkgdir" ninja -C builddir install

  # The driver now detaches the cdc_acm kernel driver itself when claiming the
  # USB interface, so the old 91-goodix-fingerprint.rules unbind hack is no
  # longer needed or shipped.
}
