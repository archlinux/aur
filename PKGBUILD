# Maintainer: David Wu <xdavidwuph@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
pkgname=wpa_supplicant-openssl-1.0
_pkgname=wpa_supplicant
pkgver=2.9
pkgrel=1
pkgdesc='A utility providing key negotiation for WPA wireless networks (with openssl-1.0)'
url='http://hostap.epitest.fi/wpa_supplicant'
arch=(x86_64)
license=(GPL)
depends=(openssl-1.0 libdbus readline libnl)
provides=(wpa_supplicant)
conflicts=(wpa_supplicant)
source=(https://w1.fi/releases/${_pkgname}-${pkgver}.tar.gz{,.asc}
        config
)
validpgpkeys=('EC4AA0A991A5F2464582D52D2B6EF432EFC895FA') # Jouni Malinen
sha256sums=('fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17'
            'SKIP'
            '23aee0597750ec21b37654b5163e2f577c1204fc33bdfbf7bc2fb470e8a467db')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  local i; for i in "${source[@]}"; do
    case $i in
      *.patch)
        msg2 "Applying patch $i"
        patch -p1 -i "$srcdir/$i"
        ;;
    esac
  done

  cd "$srcdir/$_pkgname-$pkgver/$_pkgname"
  cp "$srcdir/config" ./.config
}

build() {
  cd "$srcdir/$_pkgname-$pkgver/$_pkgname"

  export CFLAGS="$CPPFLAGS $CFLAGS -I/usr/include/openssl-1.0"
  export LIBS="-L/usr/lib/openssl-1.0"
  export LIBS_p="-L/usr/lib/openssl-1.0"

  make LIBDIR=/usr/lib BINDIR=/usr/bin
  make LIBDIR=/usr/lib BINDIR=/usr/bin eapol_test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/$_pkgname"
  make LIBDIR=/usr/lib BINDIR=/usr/bin DESTDIR="$pkgdir" install
  install -Dm755 eapol_test "$pkgdir/usr/bin/eapol_test"

  install -d -m755 "$pkgdir/etc/wpa_supplicant"
  install -Dm644 wpa_supplicant.conf \
    "$pkgdir/usr/share/doc/wpa_supplicant/wpa_supplicant.conf"


  install -d -m755 "$pkgdir/usr/share/dbus-1/system-services"
  install -m644 \
    dbus/fi.w1.wpa_supplicant1.service \
    "$pkgdir/usr/share/dbus-1/system-services/"

  install -Dm644 dbus/dbus-wpa_supplicant.conf \
    "$pkgdir/etc/dbus-1/system.d/wpa_supplicant.conf"

  install -d -m755 "$pkgdir/usr/share/man/man"{5,8}
  install -m644 doc/docbook/*.5 "$pkgdir/usr/share/man/man5/"
  install -m644 doc/docbook/*.8 "$pkgdir/usr/share/man/man8/"
  rm -f "$pkgdir/usr/share/man/man8/wpa_"{priv,gui}.8

  install -d -m755 "$pkgdir/usr/lib/systemd/system"
  install -m644 systemd/*.service "$pkgdir/usr/lib/systemd/system/"
}
