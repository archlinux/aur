# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=hostapd-git
pkgver=2.11.r957.g4bc754d9c
pkgrel=1
pkgdesc="User space daemon for access point and authentication servers"
arch=('i686' 'x86_64')
url="https://w1.fi/hostapd/"
license=('BSD-3-Clause')
depends=('glibc' 'libnl' 'openssl' 'sqlite')
makedepends=('git')
provides=("hostapd=$pkgver")
conflicts=('hostapd')
backup=(etc/hostapd/hostapd.{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk})
options=('!lto')
source=("git+https://w1.fi/hostap.git"
        "config::https://gitlab.archlinux.org/archlinux/packaging/packages/hostapd/-/raw/main/config?ref_type=heads"
        "hostapd.service::https://gitlab.archlinux.org/archlinux/packaging/packages/hostapd/-/raw/main/hostapd.service?ref_type=heads"
        "hostapd@.service::https://gitlab.archlinux.org/archlinux/packaging/packages/hostapd/-/raw/main/hostapd@.service?ref_type=heads")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "hostap"

  # fix include locations in main configuration file
  sed -e 's|/etc/hostapd|/etc/hostapd/hostapd|g' \
      -e 's|/var/run|/run|g' \
      -e 's|radius_attr.sqlite|/var/lib/hostapd/radius_attr.sqlite|g' \
      -e 's|hostapd.cred|/var/lib/hostapd/hostapd.cred|g' \
      -e 's|hostapd.ap_settings|/var/lib/hostapd/hostapd.ap_settings|g' \
      -e 's|hostapd_wps_pin_requests|hostapd/wps_pin_requests|g' \
      -i "hostapd/hostapd.conf"

  # link build configuration into place:
  # an up-to-date version of the build configuration can be found in
  # hostapd/defconfig and should be diffed with the packaged one before every
  # build
  ln -svf "$srcdir/config" "hostapd/.config"
}

pkgver() {
  cd "hostap"

  _tag=$(git tag -l --sort -v:refname | grep -E '^hostap_[0-9_\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^hostap_//;s/_/./g'
}

build() {
  cd "hostap"

  make -C "hostapd"
}

package() {
  cd "hostap"

  make \
    -C "hostapd" \
    DESTDIR="$pkgdir" \
    BINDIR="/usr/bin" \
    install

  # systemd service
  install -Dm644 "$srcdir"/hostapd{,@}.service -t "$pkgdir/usr/lib/systemd/system"
  # license
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/hostapd"
  # config
  install -Dm640 hostapd/hostapd.{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "$pkgdir/etc/hostapd"
  # docs
  install -Dm644 hostapd/{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} hostapd/{README*,ChangeLog} -t "$pkgdir/usr/share/doc/hostapd"
  # man pages
  install -Dm644 "hostapd/hostapd.8" -t "$pkgdir/usr/share/man/man8"
  install -Dm644 "hostapd/hostapd_cli.1" -t "$pkgdir/usr/share/man/man1"
  # state dir
  install -dm750 "$pkgdir/var/lib/hostapd"
}
