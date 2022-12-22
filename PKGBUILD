# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=yubihsm2-sdk
pkgver=2022.06
pkgrel=1
pkgdesc="YubiHSM2 SDK"
url="https://developers.yubico.com/YubiHSM2/Releases/"
arch=(x86_64)
license=(Apache "custom:https://www.yubico.com/support/terms-conditions/yubico-license-agreement/")
# bind contains pkcs11.h
# libusb contains libusb-1.0.so
# openssl contains libcrypto.so
depends=(bind curl libusb)

source=(
	"https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-2022-06-fedora36-amd64.tar.gz"
	"70-yubihsm2.rules"
	"yubihsm-connector.service"
	"yubihsm-connector.yaml"
)
sha256sums=('e67b2ba3c4d418382ddafc5a7f1ae13e1e43fb51d5c7189776e9107eef7ff42d'
            'ecd8ad2475463759ae8aa261542856f7f00428a7759252c4b435f5e6775d5cd0'
            '3f2e731277d0fbdda8fe7fbff1e04eaf8d2ea40e5ea2b8db7d882f4a5af463b2'
            '6f5415db4913d31c0bc6dc398f89e93308251a6f86d07354dc16f062b8e726e0')

prepare() {
  cd $srcdir

  mkdir -p yubihsm-connector
  bsdtar -xf yubihsm2-sdk/yubihsm-connector-3.0.3-1.fc36.x86_64.rpm -C yubihsm-connector

  mkdir -p yubihsm-devel
  bsdtar -xf yubihsm2-sdk/yubihsm-devel-2.3.2-1.fc36.x86_64.rpm -C yubihsm-devel

  mkdir -p yubihsm-setup
  bsdtar -xf yubihsm2-sdk/yubihsm-setup-2.3.1-1.fc36.x86_64.rpm -C yubihsm-setup

  mkdir -p yubihsm-shell
  bsdtar -xf yubihsm2-sdk/yubihsm-shell-2.3.2-1.fc36.x86_64.rpm -C yubihsm-shell

}

package() {
  # yubihsm-connector
  install -Dt "$pkgdir/usr/bin" yubihsm-connector/usr/bin/yubihsm-connector
  install -Dt "$pkgdir/usr/share/licenses/$pkgname/yubihsm-connector"  yubihsm-connector/usr/share/licenses/yubihsm-connector/LICENSE

  # yubihsm-devel
  install -Dt "$pkgdir/usr/include" yubihsm-devel/usr/include/yubihsm.h
  # install -Dt "$pkgdir/usr/include/pkcs11" yubihsm-devel/usr/include/pkcs11/pkcs11.h
  install -Dt "$pkgdir/usr/include/pkcs11" yubihsm-devel/usr/include/pkcs11/pkcs11y.h

  mkdir "$pkgdir/usr/lib"
  cp -d yubihsm-devel/usr/lib64/libyubihsm_http.so "$pkgdir/usr/lib"
  cp -d yubihsm-devel/usr/lib64/libyubihsm.so "$pkgdir/usr/lib"
  cp -d yubihsm-devel/usr/lib64/libyubihsm_usb.so "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib/pkgconfig" yubihsm-devel/usr/lib64/pkgconfig/yubihsm.pc

  # yubihsm-setup
  install -Dt "$pkgdir/usr/bin" yubihsm-setup/usr/bin/yubihsm-setup

  # yubihsm-shell
  shell_version=2.3.2
  install -Dt "$pkgdir/usr/bin" yubihsm-shell/usr/bin/yubihsm-shell
  install -Dt "$pkgdir/usr/bin" yubihsm-shell/usr/bin/yubihsm-wrap
  cp -d yubihsm-shell/usr/lib64/libyubihsm_http.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm_http.so.${shell_version}
  cp -d yubihsm-shell/usr/lib64/libyubihsm.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm.so.${shell_version}
  cp -d yubihsm-shell/usr/lib64/libykhsmauth.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libykhsmauth.so.${shell_version}
  cp -d yubihsm-shell/usr/lib64/libyubihsm_usb.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm_usb.so.${shell_version}
  install -Dt "$pkgdir/usr/lib/pkcs11" yubihsm-shell/usr/lib64/pkcs11/yubihsm_pkcs11.so
  install -Dt "$pkgdir/usr/share/licenses/$pkgname/yubihsm-shell"  yubihsm-shell/usr/share/licenses/yubihsm-shell/LICENSE

  # udev rule
  # NB: /usr/lib/udev/rules.d/30-systemd-udev-reload.hook a triggers on installation
  # of this file, so we don't need additional post_{install,upgrade} scripts
  install -m644 -Dt "$pkgdir/usr/lib/udev/rules.d" 70-yubihsm2.rules

  # sample systemd service
  install -Dm644 yubihsm-connector.service -t $pkgdir/usr/lib/systemd/system
  install -Dm644 yubihsm-connector.yaml -t $pkgdir/etc

}
