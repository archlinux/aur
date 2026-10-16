# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Dan Serban
# Contributor: mickael9

pkgname=algodoo
pkgver=1.8.5
pkgrel=1
pkgdesc="A physics simulator program for education and fun (based on Phun)"
# i686 is no longer supported by Arch; uncomment for Arch Linux 32 and similar.
arch=(x86_64)
#arch=(i686 x86_64)
url="https://www.algodoo.com/"
license=(LicenseRef-Algodoo)
depends=(
  at-spi2-core bzip2 cairo fontconfig freetype2 gdk-pixbuf2 glib2
  glibc glu gsm gtk2 jasper lapack libcurl-gnutls libglvnd libice
  libjpeg-turbo libjpeg6-turbo libogg libpng12 libpulse libraw1394 libsm
  libtheora libusb libva libvorbis libvpx libx11 libxcb libxext libxi libxmu
  libxrender pango pixman schroedinger speex zlib
)
makedepends=(imagemagick)
options=(!strip !debug)
source=(algodoo.desktop
        algodoo.sh)
# Upstream no longer hosts the Linux builds; use the Wayback Machine copies.
_wayback=https://web.archive.org/web/20120314071715id_/http://www.algodoo.com/download
source_x86_64=("algodoo-$pkgver-x86_64.tgz::$_wayback/algodoo_${pkgver//./_}-Linux64.tgz")
#source_i686=("algodoo-$pkgver-i686.tgz::$_wayback/algodoo_${pkgver//./_}-Linux32.tgz")
sha256sums=('eaff4abf738745193900beb20b75fcb356219d20c2e60ee39c06e57ac577dcdf'
            '3267e793668f587f4b57a7ea1b88595317be344708c66c0fe8fd9be26084b73a')
sha256sums_x86_64=('8ef0a79235efd7b36b843de912c1c42bc722ded6ae3ba17161ce2a18c616644c')
#sha256sums_i686=('055cd4ea561c4f92e0d5f16bb802d58c650d9de6cfc4cb1900ff8f344101b0bb')

package() {
  # The 32-bit tarball has an extra top-level directory
  local _src=Algodoo
  [[ $CARCH == i686 ]] && _src=tarball/Algodoo

  install -d "$pkgdir/opt"
  cp -a --no-preserve=ownership $_src "$pkgdir/opt/algodoo"

  cd "$pkgdir/opt/algodoo/lib"
  # Use system lapack instead of the bundled one
  rm liblapack.so.3gf
  # Missing SONAME symlinks for bundled libraries
  case $CARCH in
    x86_64)
      ln -s libGLEW.so libGLEW.so.1.5
      ln -s libcxcore.so libcxcore.so.2.1
      ln -s libcv.so libcv.so.2.1
      ln -s libhighgui.so libhighgui.so.2.1
      ln -s libml.so libml.so.2.1
      ln -s libzip.so libzip.so.1
      ln -s libtiff.so libtiff.so.4
      ln -s libswscale.so libswscale.so.0
      ;;
    i686)
      ln -s libcxcore.so.2.1 libcxcore.so.1
      ln -s libcv.so.2.1 libcv.so.1
      ln -s libhighgui.so.2.1 libhighgui.so.1
      ln -s libml.so.2 libml.so.2.1
      ln -s libtiff.so.3 libtiff.so.4
      ln -s libpng12.so libpng12.so.0
      ;;
  esac
  # Old SONAMEs mapped onto current system libraries
  ln -s /usr/lib/liblapack.so liblapack.so.3gf
  ln -s /usr/lib/libjasper.so libjasper.so.1
  ln -s /usr/lib/libva.so libva.so.1
  ln -s /usr/lib/libvpx.so libvpx.so.0
  ln -s /usr/lib/libtheoraenc.so libtheoraenc.so.1
  ln -s /usr/lib/libtheoradec.so libtheoradec.so.1

  cd "$srcdir"
  install -Dm755 algodoo.sh "$pkgdir/usr/bin/algodoo"
  install -Dm644 algodoo.desktop -t "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  magick $_src/data/logos/icon.bmp "$pkgdir/usr/share/icons/hicolor/32x32/apps/algodoo.png"
  install -Dm644 $_src/legal/algodoo_license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
