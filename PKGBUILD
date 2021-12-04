# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>
pkgname=gnuradio-fcdproplus
_pkgname=gr-fcdproplus
pkgver=3.8.0
pkgrel=9
# they still haven't done a release, so fake it
_commit=575fcafbb8f
pkgdesc="GNU Radio source block for Funcube Dongle Pro +"
arch=('x86_64')
url="https://github.com/dl1ksv/gr-fcdproplus"
license=('GPL3')
depends=('gnuradio' 'libusb' 'alsa-lib' 'boost-libs' 'hidapi')
makedepends=('git' 'cmake' 'boost' 'swig' 'systemd' 'ninja')
# systemd for FS#54735 (libudev.h)
replaces=('gr-fcdproplus')
#source=("gr-fcdpp-$pkgver.tgz::https://github.com/dl1ksv/gr-fcdproplus/archive/v$pkgver.tar.gz"
source=("gr-fcdpp-$_commit.tgz::https://github.com/dl1ksv/gr-fcdproplus/archive/$_commit.tar.gz"
        "88-fcdproplus.rules")
md5sums=('bfd926db8b413e92687603d179e91d6b'
         '465e12c454c6a22ebec9849181af7bdc')

#prepare() {
#  cd "$srcdir/$_pkgname-$pkgver"
#}

build() {
  cd "$srcdir/$_pkgname-$_commit"*
  mkdir -p build
  cd build
  cmake -G Ninja \
    -DPYTHON_EXECUTABLE=$(which python3) \
    -DPYTHON_INCLUDE_DIR=$(echo /usr/include/python3*) \
    -DPYTHON_LIBRARY=$(echo /usr/lib/libpython3.*.so) \
    -DCMAKE_INSTALL_PREFIX=/usr ../
  ninja
}

package() {
  cd "$srcdir/$_pkgname-$_commit"*/build/
  DESTDIR="${pkgdir}" ninja install
  install -Dm644 "$srcdir/88-fcdproplus.rules" "$pkgdir/etc/udev/rules.d/88-fcdproplus.rules"
}
