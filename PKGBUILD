# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=yaskkserv
pkgver=1.1.0
pkgrel=1
pkgdesc='Yet Another SKK Japanese input method dictionary server'
arch=('x86_64' 'i686')
url='http://umiushi.org/~wac/yaskkserv/'
license=('GPL')
depends=('openssl')
makedepends=('perl' 'skk-jisyo')
source=(http://umiushi.org/~wac/$pkgname/$pkgname-$pkgver.tar.xz
        yaskkserv.socket
        yaskkserv.service)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LC_ALL=C ./configure --prefix=/usr --enable-google-japanese-input \
    --disable-gnutls --enable-openssl --enable-systemd
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install_all
  mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"

  mkdir -p "$pkgdir/usr/share/skk"
  "$pkgdir/usr/bin/yaskkserv_make_dictionary" /usr/share/skk/SKK-JISYO.L "$pkgdir/usr/share/skk/SKK-JISYO.L.yaskkserv"

  local _systemd_dir="$pkgdir/usr/lib/systemd/system"
  mkdir -p "$_systemd_dir"
  install -m644 "$srcdir/yaskkserv.socket" "$_systemd_dir/"
  install -m644 "$srcdir/yaskkserv.service" "$_systemd_dir/"
}

# vim:set ts=2 sw=2 et:
sha512sums=('9956a9b2fe587491b7c5f76482f13f91d1c87d445f2ff7effa5ffb68efe076f54f1c63e95b980d889963ac507ed49fa37f76f9deb239da7b7409da5be025c000'
            '4c169aa6226963a719a5f22182203820f1bc1ed182e247aff575d0f7ee097244d959df6aaf68d0059937f155e0ad1c975281b7cc685fb08bbd4c139b57b30c09'
            '253da9a8d9ee60abde0d1b427c7307030eef87320a6a2c695b72101a1c5127caa0887db9a5f0a2b89a17e666f58ca296d798a94511cbb35e783d7c30cf30e3dd')
