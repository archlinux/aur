# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

_name=libirecovery
pkgname=$_name-1.0-3
pkgver=1.1.0
pkgrel=2
pkgdesc="Library and utility to talk to iBoot/iBSS via USB (libirecovery-1.0.so.3)"
arch=('x86_64')
url="https://libimobiledevice.org/"
license=('LGPL-2.1-only')
# libirecovery provides udev rules
depends=('libimobiledevice-glue' 'libirecovery' 'libusb')
source=("https://github.com/libimobiledevice/$_name/releases/download/$pkgver/$_name-$pkgver.tar.bz2"
        '0001-Allow-building-without-tools.patch'
        'autogen.sh')
sha256sums=('ee3b1afbc0cab5309492cfcf3e132c6cc002617a57664ee0120ae918318e25f9'
            '7fb1986bfaf4d92f7af8e13dce1c5a351897097ed18fc43b8845f8d830f61337'
            'ae2f821eaef4444ceccf934d4ecb15ddeeeda08c80a9d7ece0b46fbcd3fcac87')

prepare() {
  cd "$_name-$pkgver"

  # don't overlink to libplist-2.0.so
  sed -Ei 's/(\$\(limd_glue_LIBS)\)/\1:-lplist-2.0=)/' src/Makefile.{am,in}

  patch -Np1 -i "$srcdir/0001-Allow-building-without-tools.patch"
  cp -a "$srcdir/autogen.sh" .
}

build() {
  cd "$_name-$pkgver"

  ./autogen.sh --prefix=/usr --disable-static --without-tools --without-udev
  make
}

package() {
  cd "$_name-$pkgver"

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{include,lib/{libirecovery-1.0.so,pkgconfig}}
}
