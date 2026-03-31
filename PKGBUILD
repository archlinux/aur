# Maintainer: clalos <clalos at users dot noreply dot github dot com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: loqs

pkgname=wpa_supplicant-wep2
pkgver=2.11
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
install=wpa_supplicant.install
source=(
  "git+https://w1.fi/hostap.git?signed#tag=hostap_${pkgver//./_}"
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

  # https://w1.fi/cgit/hostap/commit/?id=c330b5820eefa8e703dbce7278c2a62d9c69166a
  0008-Send-CTRL-EVENT-SIGNAL-CHANGE-message-to-control-interfaces-only.patch
)
b2sums=('163d2e6644902f36b3b5f25e328221fa34495d745801e8d3dce874b05366c81370ef75c8f7e0198e206a3d04c5ea4bb501bf97693fa481e15cf5067d80ab0c1e'
        'a059f15a21a3bb22b8094f0501ea9b15f4259b53cd3613173b3a945398fef721ca50539f6709eb30ce47eadc717e0264a9c2d6e4957c971aa03bdef6115cdb60'
        '96b82aaa5315e931424150d47e52f70186e2eea3928a5c97792473b69e8f92463863e8044e073bf940d597a3620f63381bd6996a594c85977785cdce4038f768'
        'bd00e0f6c04db9c2dc274763b97dace4d886fb105b0a605bb15877ee84e4a93a7b95ab9a0242b4937c748c8e7991e3dddb795ac4c2b0e99be0f5e48098041b70'
        'aaa7604faf1fede451582c8b981579cc86724a66c783d8368d1c122e0c381b75842d83bd85a982c1d4461d65bc74e62d34768762d15b4005a24a17e1392a109a'
        '7175e7aab682370aef1b3358eaa839dcb009e12940aa2b9949c8c3254406341433e84af09d09ad670bf41f5201d979af02095c87a368b76465a952b1be9de049'
        '6472d571f18c3ee718315888b9c756c4579a4b411e8c6994002f9a79fb0a36fbebe8b3d419af0f9ea881dd1bc439d03dbe3c6d6661e670f16575197c31f0bd7a'
        'c1ce2e8d6f42cbc8181aeb2bdc19d4a22bff804c18f6e505d8315a294c67c936e90135046812ec37765be3d0f433e31554604deb1d7b160549d7e3284610a22b'
        '28bf078147cc2f3395d3f907d6d900c7976dbd9948a9513f1d7ef32a40b89fee55e243c9302d24eda62dc1f813857fa09ae79e6faf52881e463a163acb437380'
        '821949ae71cc50a0922b922c3dd41027fe32798aa2f2eb466d361dfb867a795126a3cbec7fb1584bf20e9dd55388e44b5f0908d8b2442644f20545b0580f59d4')
validpgpkeys=(
  EC4AA0A991A5F2464582D52D2B6EF432EFC895FA # Jouni Malinen <j@w1.fi>
)

prepare() {
  cd hostap

  local src
  for src in "${source[@]}"; do
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Cherry-pick a nullptr crash fix.
  git cherry-pick -n 015f6a5a0cd1c8b0d40441b9fd9e4c8658bc9493

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
