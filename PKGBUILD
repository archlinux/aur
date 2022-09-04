# Maintainer: Melanie Scheirer <mel@nie.rs>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contribuor:  Gaetan Bisson <bisson@archlinux.org>

pkgname=hostapd-git-intel-lar
_gitname=${pkgname/d-git-intel-lar}
_name=${pkgname/-git-intel-lar}
pkgver=20220902.6f8af5974
pkgrel=1
pkgdesc='hostapd with prescan LAR workaround for Intel NICs'
url='http://w1.fi/hostapd/'
arch=(x86_64)
license=(BSD)
makedepends=(git)
depends=(libnl openssl sqlite)
source=('git://w1.fi/hostap.git'
         config
         hostapd.service
         'https://tildearrow.org/storage/hostapd-2.10-lar.patch')
sha256sums=('SKIP'
         '7b2bb1628c44ea41445fcde0e6e45484ab94280bef57cf36f7ea022186cf3a73'
         '989bc6855f44c0b360e3d4cd4a146c35b7c12f8a0ced627b4b033f58edcade8e'
         '561d03e730af458017e68d59a4caa834fcf310f9b16ac543e92063290f586b8d')
options=('emptydirs')
conflicts=('hostapd')
provides=('hostapd')

pkgver() {
  cd "$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "$_gitname"
  # fix include locations in main configuration file
  sed -e 's|/etc/hostapd|/etc/hostapd/hostapd|g' \
      -e 's|/var/run|/run|g' \
      -e 's|radius_attr.sqlite|/var/lib/hostapd/radius_attr.sqlite|g' \
      -e 's|hostapd.cred|/var/lib/hostapd/hostapd.cred|g' \
      -e 's|hostapd.ap_settings|/var/lib/hostapd/hostapd.ap_settings|g' \
      -e 's|hostapd_wps_pin_requests|hostapd/wps_pin_requests|g' \
      -i "$_name/$_name.conf"

  # extract license
  cat "${pkgname}/README" | head -n47 | tail -n5 > LICENSE

  # link build configuration into place:
  # an up-to-date version of the build configuration can be found in
  # hostapd/defconfig and should be diffed with the packaged one before every
  # build
  ln -svf "$srcdir/config" "$_name/.config"

  patch -p1 < "$srcdir/hostapd-2.10-lar.patch"
}

build() {
  make -C "$_gitname/$_name"
}

package() {
  cd "$_gitname"
  make -C "$_name" install DESTDIR="$pkgdir" BINDIR="/usr/bin"
  # systemd service
  install -vDm 644 "../$_name.service" -t "$pkgdir/usr/lib/systemd/system/"
  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_name/"
  # config
  install -vDm 640 "$_name/$_name."{accept,conf,deny,eap_user,radius_clients,vlan,wpa_psk} -t "$pkgdir/etc/$_name"
  # docs
  install -vDm 644 "$_name/"{hostapd.sim_db,wired.conf,hlr_auc_gw.{txt,milenage_db}} "$_name/"{README*,ChangeLog} -t "$pkgdir/usr/share/doc/$_name"
  # man pages
  install -vDm 644 "$_name/$_name.8" -t "$pkgdir/usr/share/man/man8/"
  install -vDm 644 "$_name/${_name}_cli.1" -t "$pkgdir/usr/share/man/man1/"
  # state dir
  install -vdm 750 "$pkgdir/var/lib/$_name"
}
