# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=yubihsm2-sdk
pkgver=2019.12
pkgrel=2
pkgdesc='YubiHSM2 SDK'
url='https://developers.yubico.com/YubiHSM2/Releases/'
arch=(x86_64)
license=(Apache 'custom:https://www.yubico.com/support/terms-conditions/yubico-license-agreement/')
# bind contains pkcs11.h
# libusb contains libusb-1.0.so
# openssl contains libcrypto.so
depends=(bind libusb openssl)

source=(
	"https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-2019-12-fedora31-amd64.tar.gz"
	"70-yubihsm2.rules"
)
sha256sums=(
	"1d3006b444c473040abc3f715c46b18b4a5a4b73ae7a592bbb3092a6779c004c"
	"13cc09150fe3b03665f864f86a5f8057259cc41a014d3631ca13c8c7b0445d2a"
)

prepare() {
  cd $srcdir

  mkdir -p yubihsm-connector
  bsdtar -xf yubihsm2-sdk/yubihsm-connector-2.1.0-1.fc31.x86_64.rpm -C yubihsm-connector

  mkdir -p yubihsm-devel
  bsdtar -xf yubihsm2-sdk/yubihsm-devel-2.0.2-1.fc31.x86_64.rpm -C yubihsm-devel

  mkdir -p yubihsm-setup
  bsdtar -xf yubihsm2-sdk/yubihsm-setup-2.1.0-1.x86_64.rpm -C yubihsm-setup

  mkdir -p yubihsm-shell
  bsdtar -xf yubihsm2-sdk/yubihsm-shell-2.0.2-1.fc31.x86_64.rpm -C yubihsm-shell

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
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm_http.so.2.0.2
  cp -d yubihsm-shell/usr/lib64/libyubihsm.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm.so.2.0.2
  cp -d yubihsm-shell/usr/lib64/libyubihsm_usb.so.2 "$pkgdir/usr/lib"
  install -Dt "$pkgdir/usr/lib" yubihsm-shell/usr/lib64/libyubihsm_usb.so.2.0.2
  install -Dt "$pkgdir/usr/lib/pkcs11" yubihsm-shell/usr/lib64/pkcs11/yubihsm_pkcs11.so
  install -Dt "$pkgdir/usr/share/licenses/$pkgname/yubihsm-shell"  yubihsm-shell/usr/share/licenses/yubihsm-shell/LICENSE

  # udev rule
  # NB: /usr/lib/udev/rules.d/30-systemd-udev-reload.hook a triggers on installation
  # of this file, so we don't need additional post_{install,upgrade} scripts
  install -m644 -Dt "$pkgdir/usr/lib/udev/rules.d" 70-yubihsm2.rules
}
