# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_name=backends
pkgname=lib32-sane
pkgver=1.3.1
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
sha512sums=('2b6e0ffe64386aa5856a7e4f2b1c536ad9a6376fbf10c954dcc714c1792566a2a8a85a33a947b148ef3d23c1fbfeb5d114e5a99febe0e316ff78e3ab17a4beaf')
b2sums=('5939d8e7df6056b3fd4641dca325c36f8bf01d7edc2d372f920252ecc9dde5da02fa65a47ef2763d8ded00d39056619167d18acb73a475ef902c49d4d1afdcf6')

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
    lib32-avahi #libavahi-client.so libavahi-common.so
    lib32-curl libcurl.so
    lib32-glib2 libgobject-2.0.so
    lib32-libgphoto2 #libgphoto2.so libgphoto2_port.so
    lib32-libjpeg-turbo libjpeg.so
    lib32-libtiff libtiff.so
    lib32-libusb libusb-1.0.so
    lib32-libxml2 libxml2.so
    lib32-poppler-glib libpoppler-glib.so
  )

  cd $_name-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove conflicting files
  rm -rf "${pkgdir}"/{etc,usr/{share,lib,include,bin}}

  # install custom license
  install -vDm 644 ../LicenseRef-GPL-2.0-or-later-with-linking-exception.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
