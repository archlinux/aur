# based on core/wpa_supplicant at commit 4520ea7463806e470c2638fe9635954381496073
# Maintainer:
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: loqs

_pkgbase=wpa_supplicant
pkgname=${_pkgbase}-openssl1
pkgver=2.10
pkgrel=2
pkgdesc='A utility providing key negotiation for WPA wireless networks, with openssl 1.1'
url='https://w1.fi/wpa_supplicant/'
arch=(x86_64)
license=(GPL)
depends=(openssl-1.1 libdbus readline libnl)
provides=(wpa_supplicant)
conflicts=(wpa_supplicant)
source=(
  https://w1.fi/releases/${_pkgbase}-${pkgver}.tar.gz
  wpa_supplicant_tls.patch                        # More permissive TLS fallback
  wpa_supplicant_dbus_service_syslog.patch        # Unit improvements from Ubuntu
  wpa_supplicant_service_ignore-on-isolate.patch  # More unit improvements from Ubuntu
  wpa_supplicant_config
  add_extra-ies_only_if_allowed_by_driver.patch
)
sha256sums=('20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f'
            '08915b040d03a3e07cdc8ea6c76b497e00059e01ce85b67413dfe41d4fc68992'
            '60f6a1cf2e124813dfce1da78ee1818e2ff5236aafa4113c7ae3b3f2a0b84006'
            'd42bdbf3d4980b9f0a819612df0c39843c7e96c8afcb103aa656c824f93790b0'
            '89dc439b958574e9231c58bea6c83faec469909c9f84476bfc83fa35b3e97bd1'
            'aaedf87f1530d4e6cb00bf7981d1f868409ed892cc41b83c5613019e7b51f380')

prepare() {
  cd $_pkgbase-$pkgver
  patch -p1 -i ../wpa_supplicant_tls.patch                        # More permissive TLS fallback
  patch -p1 -i ../wpa_supplicant_dbus_service_syslog.patch        # Unit improvements from Ubuntu
  patch -p1 -i ../wpa_supplicant_service_ignore-on-isolate.patch  # More unit improvements from Ubuntu
  patch -p1 -i ../add_extra-ies_only_if_allowed_by_driver.patch # http://lists.infradead.org/pipermail/hostap/2022-January/040178.html

  cd $_pkgbase
  cp "$srcdir/wpa_supplicant_config" ./.config
}

build() {
  CFLAGS+=" -I/usr/include/openssl-1.1"
  LDFLAGS+=' -L/usr/lib/openssl-1.1'

  cd $_pkgbase-$pkgver/$_pkgbase

  make LIBDIR=/usr/lib BINDIR=/usr/bin
  make LIBDIR=/usr/lib BINDIR=/usr/bin eapol_test
}

package() {
  cd $_pkgbase-$pkgver/$_pkgbase

  make LIBDIR=/usr/lib BINDIR=/usr/bin DESTDIR="$pkgdir" install

  install -Dm755 eapol_test "$pkgdir/usr/bin/eapol_test"

  install -dm755 "$pkgdir/etc/wpa_supplicant"
  install -Dm644 wpa_supplicant.conf -t "$pkgdir/usr/share/doc/wpa_supplicant"

  install -Dm644 dbus/fi.w1.wpa_supplicant1.service \
    -t "$pkgdir/usr/share/dbus-1/system-services"

  install -Dm644 dbus/dbus-wpa_supplicant.conf \
    "$pkgdir/usr/share/dbus-1/system.d/wpa_supplicant.conf"

  install -Dm644 doc/docbook/*.5 -t "$pkgdir/usr/share/man/man5"
  install -Dm644 doc/docbook/*.8 -t "$pkgdir/usr/share/man/man8"
  rm "$pkgdir"/usr/share/man/man8/wpa_{priv,gui}.8

  install -Dm644 systemd/*.service -t "$pkgdir/usr/lib/systemd/system"
}
