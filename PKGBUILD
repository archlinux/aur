# Maintainer: clalos <clalos at users dot noreply dot github dot com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: loqs

pkgname=wpa_supplicant-wep2
pkgver=2.12
pkgrel=1
epoch=2
pkgdesc='A utility providing key negotiation for WPA wireless networks (with WEP support)'
url='https://w1.fi/wpa_supplicant/'
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
  glibc
  libdbus
  libnl
  openssl
  pcsclite
  readline
)
makedepends=(
  docbook-sgml
  docbook-utils
  git
  perl-sgmls
)
provides=('wpa_supplicant')
conflicts=('wpa_supplicant')
source=(
  "git+https://git.w1.fi/hostap.git?signed#tag=hostap_${pkgver//./_}"
  wpa_supplicant_config

  # More permissive TLS fallback
  0001-Enable-TLSv1.0-by-default.patch

  # https://salsa.debian.org/debian/wpa/-/commit/13e1d28e4f987a220c546df94df86bb9b2371874
  0002-Disable-Werror-for-eapol_test.patch

  # https://lists.infradead.org/pipermail/hostap/2022-May/040511.html
  # https://bugs.archlinux.org/task/76474
  0003-Allow-legacy-renegotiation-to-fix-PEAP-issues-with-s.patch

  # Unit improvements from Ubuntu
  0004-Tweak-D-Bus-systemd-service-activation-configuration.patch
  0005-Add-IgnoreOnIsolate-yes-to-keep-wpa-supplicant-runni.patch

  # More unit improvements from Debian
  0006-Add-reload-support-to-the-systemd-unit-files.patch

  # https://lists.infradead.org/pipermail/hostap/2022-January/040178.html
  0007-nl80211-add-extra-ies-only-if-allowed-by-driver.patch

  # Fix authentication regressions with Broadcom brcmfmac fullmac devices.
  0008-Revert-Mark-authorization-completed-on-driver-indica.patch
)
b2sums=('632b255467f1c7b52fccaf217ff471a89a59943b74bef3536f7b5eb6146527dc9e86c67e8c40162a3809f14a97dc94c3a339bc77d356c9ef16cfcf41fcd00208'
        '3e6782a1d6817696b00542615c71a178c755de403d1f099b3c47ac83725957747a0c94acae3bbd9c9d4ad7caff183724097896772370cac9d55060fc151c9dab'
        'ec738735c4e820f87082b8bd86f07c458cf9c8137734f65b01cbc88ead66c90d7c362a88465cedaff1eacad3e6d43bc97d846e3d7c22132038b026c28c70a63a'
        'df0cebf38b8c9c03055db2d5a60d21b64b277165d7238173ef21e7bdbffca883795b9fa517bdfd4ab1eb9d288d1237f339d9e6bdb92d679e662eefe98843e42c'
        '28ebf66b30a421830470ff191b0ff6ca10a91acc66d36024ccfce0e024f17cd05f136564982cc0fb6b99ec4d791d1e501b6dd7c4130f3cae10a5f8e7e6a350b1'
        '7175e7aab682370aef1b3358eaa839dcb009e12940aa2b9949c8c3254406341433e84af09d09ad670bf41f5201d979af02095c87a368b76465a952b1be9de049'
        '6472d571f18c3ee718315888b9c756c4579a4b411e8c6994002f9a79fb0a36fbebe8b3d419af0f9ea881dd1bc439d03dbe3c6d6661e670f16575197c31f0bd7a'
        'c1ce2e8d6f42cbc8181aeb2bdc19d4a22bff804c18f6e505d8315a294c67c936e90135046812ec37765be3d0f433e31554604deb1d7b160549d7e3284610a22b'
        'c70aa659f2e5e5cd59d7f5006eda115f780a6bdcb3e006505c9dde560c590d596da368795ee42991d4735b9c8e55eb9412a58dfc17239f518c5ecdb013347cce'
        '72742bba49ea105419d510f64c3d728d672efa4a91612bfd7d22d5c46d98e0d496ae7713f971074442621f6e87d5623fa33675b6b329278422f50b3a4afdbf1b')
validpgpkeys=(
  EC4AA0A991A5F2464582D52D2B6EF432EFC895FA # Jouni Malinen <j@w1.fi>
)

prepare() {
  cd hostap

  local src
  for src in "${source[@]}"; do
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    git apply -3 < "../$src"
  done

  cp ../wpa_supplicant_config wpa_supplicant/.config
}

_make() {
  local make_options=(
    BINDIR=/usr/bin
    LIBDIR=/usr/lib
    "$@"
  )

  make "${make_options[@]}"
}

build() {
  cd hostap/wpa_supplicant

  _make
  _make eapol_test
  _make -C doc/docbook man
}

package() {
  cd hostap/wpa_supplicant

  _make DESTDIR="$pkgdir" install

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

  install -Dm644 ../README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=-1 et:
