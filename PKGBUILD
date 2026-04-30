# Maintainer: Marco "MegaDrive" Matos <pessoal@marcomatos.com.br>

pkgname=epass2003-sdk-linux
pkgver=20141128
pkgrel=1
pkgdesc="EnterSafe Castle SDK with Cryptoki (PKCS#11) for Linux, supporting ePass2003 and ePass2003auto USB tokens."
arch=('x86_64')
url="https://github.com/marcotuliomatos/ePass2003-SDK-Linux"
license=('LicenseRef-proprietary')
depends=('glibc' 'gcc-libs')
optdepends=('nss' 'pcsc-tools' 'opensc')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('23e17e6e5fc22fb0cc355bd896cdf7ccdc831e79c2e6fcb7316700d52575681f')
options=('!strip')

package() {
  cd "${srcdir}/ePass2003-SDK-Linux-${pkgver}/x86_64"

  install -Dm755 redist/libcastle.so.1.0.0 \
    "${pkgdir}/usr/lib/libcastle.so.1.0.0"

  ln -s libcastle.so.1.0.0 \
    "${pkgdir}/usr/lib/libcastle.so"

  install -Dm755 redist/pkimanager \
    "${pkgdir}/usr/bin/pkimanager"

  install -Dm755 redist/pkimanager_admin \
    "${pkgdir}/usr/bin/pkimanager_admin"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/lib/udev/rules.d/70-epass2003.rules" <<'EOF'
SUBSYSTEM=="usb", ACTION=="add|change", ATTR{idVendor}=="096e", ATTR{idProduct}=="0807", TAG+="uaccess", MODE="0660"
SUBSYSTEM=="usb", ACTION=="add|change", ATTR{idVendor}=="096e", ATTR{idProduct}=="080f", TAG+="uaccess", MODE="0660"
SUBSYSTEM=="usb", ACTION=="add|change", ATTR{idVendor}=="096e", ATTR{idProduct}=="080a", TAG+="uaccess", MODE="0660"
EOF
}
