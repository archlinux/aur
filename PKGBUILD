# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/bitcasa

pkgname=bitcasa
pkgver=0.9.9.126
pkgrel=1
pkgdesc="Infinite Storage in the cloud"
arch=('x86_64' 'i686')
url="http://www.bitcasa.com"
license=('custom')
depends=('fuse')
makedepends=('binutils' 'tar')
_source_arch="i386"
[ "$CARCH" = "x86_64" ] && _source_arch="amd64"
source=(
  "http://dist.bitcasa.com/release/apt/pool/main/b/bitcasa/bitcasa_${pkgver}_${_source_arch}.deb"
  "LICENSE"
)
sha256sums=(
  '83e50d0352378824f415a4801c8dcddd06b8a490d7b461b61fe7ff263dd0fe38' # bitcasa_0.9.9.126_i386.deb
  'c08193ed3cda1f08d4cbdab2d36b746b33947ae218b967c66eac19427f96d4f2' # LICENSE
)
[ "$CARCH" = "x86_64" ] && sha256sums[0]='174c944cf8c67b17f8894c184419d16420c625616271434df575399877e0f9fb' # bitcasa_0.9.9.126_amd64.deb

build() {
  cd $srcdir/
  msg "Extracting..."
  tar zxf data.tar.gz
  msg2 "Done extracting!"
}

package() {
  install -d "$pkgdir/usr/bin"

  msg "Installing files"
  # Install Mount binary
  install -Dm755 "$srcdir/sbin/mount.bitcasa" "$pkgdir/usr/bin/mount.bitcasa"

  # Install Share files
  for i in de en en_GB es fr it ja ko pt zh_CN zh_TW
  do
    install -d "$pkgdir/usr/share/locale/$i/LC_MESSAGES"
    install -Dm644 "$srcdir/usr/share/locale/$i/LC_MESSAGES/Bitcasa.mo" "$pkgdir/usr/share/locale/$i/LC_MESSAGES/Bitcasa.mo"
    install -d "$pkgdir/usr/share/man/$i/man8"
    install -Dm644 "$srcdir/usr/share/man/$i/man8/mount.bitcasa.8.gz" "$pkgdir/usr/share/man/$i/man8/mount.bitcasa.8.gz"
  done

  # Install var files
  install -d "$pkgdir/var/lib/bitcasa"
  install -Dm644 "$srcdir/var/lib/bitcasa/ca.pem" "$pkgdir/var/lib/bitcasa/ca.pem"
  install -Dm644 "$srcdir/var/lib/bitcasa/cache.conf" "$pkgdir/var/lib/bitcasa/cache.conf"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/bitcasa/LICENSE"
  msg2 "Done installing files"
}

# vim:set ts=2 sw=2 et:
