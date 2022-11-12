# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: loqs
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

# Changes here should reflect changes in https://github.com/archlinux/svntogit-packages/commits/packages/wpa_supplicant/trunk

pkgname=wpa_supplicant-wep
pkgver=2.10
pkgrel=7
pkgdesc="A utility providing key negotiation for WPA wireless networks, with WEP enabled"
url=https://w1.fi/wpa_supplicant/
arch=(x86_64)
license=(GPL)
depends=(openssl libdbus readline libnl)
provides=(wpa_supplicant)
conflicts=(wpa_supplicant)
install=wpa_supplicant.install
archbase=https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/wpa_supplicant/trunk
source=(
  https://w1.fi/releases/wpa_supplicant-$pkgver.tar.gz
  $archbase/wpa_supplicant_tls.patch
  $archbase/wpa_supplicant_dbus_service_syslog.patch
  $archbase/wpa_supplicant_service_ignore-on-isolate.patch
  $archbase/wpa_supplicant-legacy-server-connect.patch
  $archbase/lower_security_level_for_tls_1.patch
  wpa_supplicant_config
  $archbase/add_extra-ies_only_if_allowed_by_driver.patch
)
sha256sums=(20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f
            08915b040d03a3e07cdc8ea6c76b497e00059e01ce85b67413dfe41d4fc68992
            60f6a1cf2e124813dfce1da78ee1818e2ff5236aafa4113c7ae3b3f2a0b84006
            d42bdbf3d4980b9f0a819612df0c39843c7e96c8afcb103aa656c824f93790b0
            8fba11e4a5056d9e710707ded93341f61fdfef6c64ced992e3936cbd2d41a011
            c3c0fb363f734c1512d24fd749b3ff7515f961b27bfadd04c128434b5c9f4a93
            117f89641786d4c67f4622151fbe7be9f38c0a78cc3330f039c4c73786560879
            aaedf87f1530d4e6cb00bf7981d1f868409ed892cc41b83c5613019e7b51f380)

prepare() {
  cd wpa_supplicant-$pkgver

  # More permissive TLS fallback
  patch -Np1 -i ../wpa_supplicant_tls.patch

  # Unit improvements from Ubuntu
  patch -Np1 -i ../wpa_supplicant_dbus_service_syslog.patch

  # More unit improvements from Ubuntu
  patch -Np1 -i ../wpa_supplicant_service_ignore-on-isolate.patch

  # https://bugzilla.redhat.com/show_bug.cgi?id=2072070#c24
  patch -Np1 -i ../wpa_supplicant-legacy-server-connect.patch

  # http://lists.infradead.org/pipermail/hostap/2022-May/040571.html
  # https://bugs.archlinux.org/task/76474
  patch -Np1 -i ../lower_security_level_for_tls_1.patch

  # http://lists.infradead.org/pipermail/hostap/2022-January/040178.html
  patch -Np1 -i ../add_extra-ies_only_if_allowed_by_driver.patch

  cp "$srcdir/wpa_supplicant_config" wpa_supplicant/.config
}

build() {
  cd wpa_supplicant-$pkgver/wpa_supplicant

  make LIBDIR=/usr/lib BINDIR=/usr/bin
  make LIBDIR=/usr/lib BINDIR=/usr/bin eapol_test
}

package() {
  cd wpa_supplicant-$pkgver/wpa_supplicant

  make LIBDIR=/usr/lib BINDIR=/usr/bin DESTDIR="$pkgdir" install

  install -Dm755 eapol_test -t "$pkgdir/usr/bin"

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
