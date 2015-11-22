# Maintainer: eagletmt <eagletmt@gmail.com>
pkgname=yaskkserv
pkgver=0.6.2
pkgrel=1
pkgdesc='Yet another SKK Japanese input method dictionary server'
arch=('x86_64' 'i686')
url='http://umiushi.org/~wac/yaskkserv/'
license=('GPL')
depends=('openssl')
makedepends=('perl' 'skk-jisyo')
source=(http://umiushi.org/~wac/$pkgname/$pkgname-$pkgver.tar.xz
        yaskkserv.service)
install=yaskkserv.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LC_ALL=C ./configure --prefix=/usr --enable-google-japanese-input \
    --disable-gnutls --enable-openssl
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
  install -m644 "$srcdir/yaskkserv.service" "$_systemd_dir/"
}

# vim:set ts=2 sw=2 et:
sha1sums=('552a3eee3afd42b942936696d61be8ffdbc186cd'
          '807a07e4dbd456ddea198505862667da563c787f')
