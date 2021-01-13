# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=yubihsm2-sdk
pkgver=2020.10
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
	"https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-2020-10-fedora32-amd64.tar.gz"
	"70-yubihsm2.rules"
	"yubihsm-connector.service"
	"yubihsm-connector.yaml"
)
sha256sums=('f0aa5c933850b4365ba91c84ba4e7e7cedc504f19f97f400a41afeeb20e629c2'
            '13cc09150fe3b03665f864f86a5f8057259cc41a014d3631ca13c8c7b0445d2a'
            '3f2e731277d0fbdda8fe7fbff1e04eaf8d2ea40e5ea2b8db7d882f4a5af463b2'
            '6f5415db4913d31c0bc6dc398f89e93308251a6f86d07354dc16f062b8e726e0')

prepare() {
  cd $srcdir

  mkdir -p yubihsm-connector
  bsdtar -xf yubihsm2-sdk/yubihsm-connector-2.2.0-1.fc32.x86_64.rpm -C yubihsm-connector

  mkdir -p yubihsm-devel
  bsdtar -xf yubihsm2-sdk/yubihsm-devel-2.0.3-1.fc32.x86_64.rpm -C yubihsm-devel

  mkdir -p yubihsm-setup
  bsdtar -xf yubihsm2-sdk/yubihsm-setup-2.1.0-1.fc32.x86_64.rpm -C yubihsm-setup

  mkdir -p yubihsm-shell
  bsdtar -xf yubihsm2-sdk/yubihsm-shell-2.0.3-1.fc32.x86_64.rpm -C yubihsm-shell

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
  install -Dt "$pkgdir/usr/bin" yubihsm-shell/usr/bin/yubihsm-shell
  install -Dt "$pkgdir/usr/bin" yubihsm-shell/usr/bin/yubihsm-wrap
  cp -d yubihsm-shell/usr/lib64/libyubihsm_http.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm_http.so.2.0.3
  cp -d yubihsm-shell/usr/lib64/libyubihsm.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm.so.2.0.3
  cp -d yubihsm-shell/usr/lib64/libyubihsm_usb.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm_usb.so.2.0.3
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
