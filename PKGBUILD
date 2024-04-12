# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_name=backends
pkgname=lib32-sane
pkgver=1.3.0
pkgrel=1
pkgdesc="Scanner Access Now Easy (32-bit)"
arch=(x86_64)
url="https://gitlab.com/sane-project/backends"
license=(
  GPL-2.0-or-later
  LicenseRef-GPL-2.0-or-later-with-linking-exception
)
depends=(
  ${pkgname#lib32-}
  lib32-cairo
  lib32-gcc-libs
  lib32-glibc
  lib32-libpng
  lib32-libieee1284
  lib32-net-snmp
  lib32-v4l-utils
)
makedepends=(
  autoconf-archive
  lib32-avahi
  lib32-curl
  lib32-glib2
  lib32-libgphoto2
  lib32-libjpeg-turbo
  lib32-libtiff
  lib32-libusb
  lib32-libxml2
  lib32-poppler-glib
  python
  texlive-latexextra
)
optdepends=(
  'lib32-sane-airscan: for scanners working in driverless mode'
)
provides=(libsane.so)
source=(
  $url/-/archive/$pkgver/$_name-$pkgver.tar.gz
)
sha512sums=('e1b139d2588dee2d4478b4b3001c1d164ef293bf268720c73b001fdfd5b18b0a2052c692b9af55a09c06ec4242de6a0006c7956a7da4253fc5fd1e560d3b528b')
b2sums=('f6413f374f2d05bec08c3490c03ff6d69e0b902b5907acd6d96aa6ae255865adb9d3dd68b774795d33a8a19c27b5fe337af29e239e4178e1f3882f302d6bcdd2')

prepare() {
  # extract custom license exception
  sed '1,41p' $_name-$pkgver/backend/dll.c > LicenseRef-GPL-2.0-or-later-with-linking-exception.txt

  cd $_name-$pkgver
  # copy translation files so they become reproducible: https://gitlab.com/sane-project/backends/-/issues/647
  cp -v po/en{_GB,@quot}.po
  cp -v po/en{_GB,@boldquot}.po
  # create version files, so that autotools macros can use them:
  # https://gitlab.com/sane-project/backends/-/issues/440
  printf "%s\n" "$pkgver" > .tarball-version
  printf "%s\n" "$pkgver" > .version
  autoreconf -fiv
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  local configure_options=(
    --host=i686-pc-linux-gnu
    --prefix=/usr
    --libdir=/usr/lib32
    --disable-locking
    --disable-rpath
    --docdir="/usr/share/doc/$pkgname"
    --enable-pthread
    --localstatedir=/var
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-avahi
    --with-libcurl
    --with-pic
    --with-poppler-glib
    --with-systemd
    --with-usb
  )

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"

  # circumvent overlinking in libraries
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool
  make
}

package() {
  depends+=(
    lib32-avahi
    lib32-curl
    lib32-glib2
    lib32-libgphoto2
    lib32-libjpeg-turbo
    lib32-libtiff
    lib32-libusb
    lib32-libxml2
    lib32-poppler-glib
  )

  cd $_name-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove conflicting files
  rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin}}

  # install custom license
  install -vDm 644 ../LicenseRef-GPL-2.0-or-later-with-linking-exception.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
