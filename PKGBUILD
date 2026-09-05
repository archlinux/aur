# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Nemanja <nemanjan00@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=hostapd-mana-git
pkgver=20260831.eb22863ed
pkgrel=1
pkgdesc='IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator with Mana patches'
arch=(i686 x86_64 aarch64 armv7l)
url=https://github.com/sensepost/hostapd-mana
license=(BSD-3-Clause)
depends=(
  libnl
  openssl
)
makedepends=(
  git
)
options=('emptydirs')
source=(
  git+https://github.com/sensepost/hostapd-mana.git
  hostapd-mana.service
  hostapd-mana@.service
  hostapd-mana.tmpfiles
  hostapd-fhs-config.patch
)
sha256sums=('SKIP'
            '742e1c17fce996ac250333619a3392d70dd37aa23341f5e0ccaaafff52250ec3'
            'b2bdd3e4a9fb07b43c927ab078a1d144f3b1ec24ba8e3a6c6a24c6ef82a9d14a'
            '4e299ce300637f09467092ff4b9952db4be7db55ed99035b40a39c7340eda44d'
            '49e5db19df3be6ed2d4c30300973d07eba7fd2768baa82818ebcc08819fc33b0')


pkgver() {
  cd ${pkgname%-git}
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  patch -Np1 -d ${pkgname%-git} -i ../hostapd-fhs-config.patch
  cp ${pkgname%-git}/hostapd/defconfig ${pkgname%-git}/hostapd/.config
}

build() {
  make -C ${pkgname%-git}/hostapd
}

package() {
  cd ${pkgname%-git}/hostapd

  install -vDm 755 hostapd_cli "${pkgdir}"/usr/bin/hostapd_cli-mana
  install -vDm 755 hostapd "${pkgdir}"/usr/bin/hostapd-mana

  # systemd service
  install -vDm 644 "${srcdir}"/${pkgname%-git}.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 "${srcdir}"/${pkgname%-git}@.service -t "$pkgdir/usr/lib/systemd/system/"

  install -d "${pkgdir}"/etc/hostapd
  install -Dm644 ../COPYING "${pkgdir}"/usr/share/licenses/hostapd-mana/COPYING
  # docs
  install -d "${pkgdir}"/usr/share/doc/hostapd-mana
  install -t "${pkgdir}"/usr/share/doc/hostapd-mana -m644 hostapd.[a-z]* wired.conf hlr_auc_gw.milenage_db
  # man pages
  install -Dm644 hostapd.8 "${pkgdir}"/usr/share/man/man8/hostapd-mana.8
  install -Dm644 hostapd_cli.1 "${pkgdir}"/usr/share/man/man1/hostapd_cli-mana.1
  # tmpfiles.d
  install -vDm 644 "${srcdir}"/${pkgname%-git}.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
}
