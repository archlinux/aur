# Maintainer: Marco "MegaDrive" Matos <pessoal@marcomatos.com.br>

pkgname=epass2003-sdk-linux
pkgver=20180514
pkgrel=2
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
sha256sums=('5ef6fcc6b8a886dfbe6efbdbde4b2997ce036c52599f0755de4a41fac656cdd9')
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
