# Maintainer: Pavel Dvorak <dvorapa~seznam~cz>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: loqs
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

# Changes here should reflect changes in https://github.com/archlinux/svntogit-packages/commits/packages/wpa_supplicant/trunk

pkgname=wpa_supplicant-wep
pkgver=2.10
pkgrel=8
pkgdesc="A utility providing key negotiation for WPA wireless networks, with WEP enabled"
url=https://w1.fi/wpa_supplicant/
arch=(x86_64)
license=(GPL)
depends=(openssl libdbus readline libnl pcsclite)
options=(debug)
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
  $archbase/disable-eapol-werror.patch
  $archbase/0001-nl80211-add-extra-ies-only-if-allowed-by-driver.patch
  $archbase/0002-AP-guard-FT-SAE-code-with-CONFIG_IEEE80211R_AP.patch
)
sha256sums=(20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f
            08915b040d03a3e07cdc8ea6c76b497e00059e01ce85b67413dfe41d4fc68992
            60f6a1cf2e124813dfce1da78ee1818e2ff5236aafa4113c7ae3b3f2a0b84006
            d42bdbf3d4980b9f0a819612df0c39843c7e96c8afcb103aa656c824f93790b0
            8fba11e4a5056d9e710707ded93341f61fdfef6c64ced992e3936cbd2d41a011
            c3c0fb363f734c1512d24fd749b3ff7515f961b27bfadd04c128434b5c9f4a93
            877e28a711d2b67856a6c3fd46b7bf96850c4fbfc837ca55457d1f49bdf485dd
            9aca193cc26682765467cf9131240e5de71f9b49a765a934284da5e308ea904e
            7901d42eda48f82106901cbeb5e7be39025c878d5085a0a0d54ccbe36c3ecef4
            24e844b0a08fe3fede1676cedfe29643375ae56ab1a5fe4f5783765a7b759c15)

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

  # https://salsa.debian.org/debian/wpa/-/commit/13e1d28e4f987a220c546df94df86bb9b2371874
  patch -Np1 -i ../disable-eapol-werror.patch

  # http://lists.infradead.org/pipermail/hostap/2022-January/040178.html
  patch -Np1 -i ../0001-nl80211-add-extra-ies-only-if-allowed-by-driver.patch

  # https://lists.infradead.org/pipermail/hostap/2022-April/040352.html
  patch -Np1 -i ../0002-AP-guard-FT-SAE-code-with-CONFIG_IEEE80211R_AP.patch

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
