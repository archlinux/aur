# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: jhrdka
# Contributor: Isaac Aggrey <isaac.aggrey@gmail.com>
# Contributor: ugaciaka <ugaciaka@gmail.com>

pkgname=lib32-lightscribe
_realname=lightscribe
pkgver=1.18.27.10
pkgrel=6
pkgdesc="LightScribe Host Software for Linux (32-bit)"
arch=('x86_64')
url="https://web.archive.org/web/20130116202922/http://lightscribe.com/downloadSection/linux/index.aspx"
license=('LicenseRef-LightScribe')
depends=('bash' 'lib32-glibc' 'lib32-gcc-libs')
makedepends=('patchelf')
provides=("bin32-lightscribe=$pkgver")
conflicts=('bin32-lightscribe' 'lightscribe')
replaces=('bin32-lightscribe')
backup=('etc/lightscribe.rc')
options=('!strip')
source=("https://web.archive.org/web/20200404105932/http://www.pawtec.com/lightscribe_files/Linux/LSS/$_realname-$pkgver-linux-2.6-intel.rpm")
sha256sums=('069703c3b5a572191f53697fcccb83504bb1c2405382d02d952fe5d4f12f2643')

prepare() {
  cd "$srcdir"
  sed -i 's|/usr/lib/lightscribe|/usr/lib32/lightscribe|g' etc/lightscribe.rc
  # bundled libstdc++.so.5 lives in a private directory
  patchelf --set-rpath '$ORIGIN/lightscribe' usr/lib/liblightscribe.so.1
}

package() {
  cd "$srcdir"
  install -Dm644 etc/lightscribe.rc "$pkgdir/etc/lightscribe.rc"

  install -Dm755 usr/lib/liblightscribe.so.1 "$pkgdir/usr/lib32/liblightscribe.so.1"
  ln -s liblightscribe.so.1 "$pkgdir/usr/lib32/liblightscribe.so"

  install -Dm755 usr/lib/lightscribe/libstdc++.so.5.0.7 \
    "$pkgdir/usr/lib32/lightscribe/libstdc++.so.5.0.7"
  ln -s libstdc++.so.5.0.7 "$pkgdir/usr/lib32/lightscribe/libstdc++.so.5"
  install -Dm755 usr/lib/lightscribe/elcu.sh "$pkgdir/usr/lib32/lightscribe/elcu.sh"
  install -Dm755 usr/lib/lightscribe/updates/fallback.sh \
    "$pkgdir/usr/lib32/lightscribe/updates/fallback.sh"

  install -Dm644 usr/share/doc/lightscribeLicense.rtf \
    "$pkgdir/usr/share/licenses/$pkgname/license.rtf"
}
