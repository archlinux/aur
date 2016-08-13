# Maintainer: Christoph Hoopmann <choopm at 0pointer.org>
# Contributor: Pascal E. <archlinux at hardfalcon dot net>
# Contributor: Andrej Gelenberg <andrej.gelenberg at udo dot edu>
pkgname=libnfc
pkgver=1.7.1
pkgrel=4
pkgdesc="libre NFC SDK and Programmers API"
arch=('i686' 'x86_64')
url="https://code.google.com/p/libnfc/"
license=('LGPL3')
depends=('libusb-compat' 'pcsclite')
makedepends=('cmake')
source=("https://bintray.com/artifact/download/nfc-tools/sources/libnfc-${pkgver}.tar.bz2")
sha256sums=('945e74d8e27683f9b8a6f6e529557b305d120df347a960a6a7ead6cb388f4072')

prepare()
{
  cd "$srcdir/${pkgname}-${pkgver}"
  # issue #287: set soversion
  sed -i "s|PROPERTIES SOVERSION 0|PROPERTIES SOVERSION 5 VERSION 5.0.1|g" libnfc/CMakeLists.txt

  # use uaccess 
  sed -i "s|MODE=\"0664\", GROUP=\"plugdev\"|TAG+=\"uaccess\"|g" contrib/udev/42-pn53x.rules
}

build()
{
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package()
{
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  install -D -m644 ../libnfc.conf.sample "$pkgdir"/etc/nfc/libnfc.conf.sample
  install -D -m644 ../contrib/udev/42-pn53x.rules "$pkgdir"/usr/lib/udev/rules.d/42-pn53x.rules
  install -D -m644 ../contrib/linux/blacklist-libnfc.conf "$pkgdir"/etc/modprobe.d/blacklist-libnfc.conf
}
