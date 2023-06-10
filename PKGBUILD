# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

_pkgname=pcsclite
pkgname=lib32-$_pkgname
pkgver=2.0.0
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library (32-bit)"
arch=('x86_64')
url='https://pcsclite.apdu.fr/'
license=('BSD')
depends=('libsystemd.so' 'libudev.so' 'libpolkit-gobject-1.so' $_pkgname)
makedepends=('lib32-systemd' 'lib32-polkit' 'autoconf-archive')
provides=('libpcsclite.so' 'libpcscspy.so')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>
source=("https://pcsclite.apdu.fr/files/pcsc-lite-${pkgver}.tar.bz2"{,.asc}
        "program-suffix.patch"
        "systemd-unit-conflicts.diff")
sha256sums=('d6c3e2b64510e5ed6fcd3323febf2cc2a8e5fda5a6588c7671f2d77f9f189356'
            'SKIP'
            'c63d6525a8514a30816f550b79fa1d269f1504951efc198ce4e503ab5f48a9c6'
            'e77aa9d0b6431d0de6a80d96bfd57e31b3c99e9ddcadf72990fe625b5cb128af')

prepare() {
  cd "pcsc-lite-$pkgver"
  patch -Np1 -i ../program-suffix.patch
  # Seems pcscd-32 needs exclusive access to devices
  patch -Np1 -i ../systemd-unit-conflicts.diff
  autoreconf -ifv
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "pcsc-lite-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libdir=/usr/lib32 \
    --program-suffix="-32" \
    --sysconfdir=/etc \
    --disable-static \
    --enable-filter \
    --enable-ipcdir=/run/pcscd \
    --enable-libudev \
    --enable-usbdropdir=/usr/lib32/pcsc/drivers \
    --enable-polkit \
    --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd "pcsc-lite-$pkgver"
  make DESTDIR="$pkgdir" install

  # Remove files shared with pcsclite
  rm -rv "$pkgdir"/{usr/include,usr/share}
  # pcsc-spy is just a Python script, and thus the one from 64-bit pcsclite works with this package
  rm -v "$pkgdir"/usr/bin/pcsc-spy-32
  # Keep pcscd-32 as it's useful for using with 32-bit only drivers

  install -D -m0644 "$srcdir/pcsc-lite-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/lib32/pcsc/drivers"
}

# vim:set sw=2 sts=-1 et:
