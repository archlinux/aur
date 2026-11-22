# Maintainer: ldgnu <ldgnu@users.noreply.github.com>
pkgname=openaula-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="TUI, CLI y API para configurar el teclado AULA/Epomaker F108 Pro (binario estático)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/ldgnu/openaula"
license=('MIT')
depends=()
conflicts=('openaula')
provides=('openaula')
options=('!strip')

case "$CARCH" in
  x86_64)  arch_name=amd64
           sha256sums=('fb2bd13a6bd08eaec427937c61ef8de9808c07533fc79e4518c00498b78befdc') ;;
  aarch64) arch_name=arm64
           sha256sums=('7e79166d28b1e5910d03a3d84e316584613d53d026c56554ee2ccb114cb2a62b') ;;
  armv7h)  arch_name=arm
           sha256sums=('7a7d1414561038c1133d87f1b6e9a31d73e365a8da8327208d77d1234bba15b5') ;;
  i686)    arch_name=386
           sha256sums=('dda4b12097073de13b000747ab487dbae01379e69cff8a461eb7e672bc52e263') ;;
esac

source=("${pkgname}-${pkgver}-${arch_name}.tar.gz::${url}/releases/download/v${pkgver}/openaula_linux_${arch_name}.tar.gz")

package() {
  install -Dm755 "${srcdir}/openaula" "${pkgdir}/usr/bin/openaula"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  printf 'MIT License\n\nCopyright (c) 2025 Parsia\nCopyright (c) 2026 ldgnu\n' \
    > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/lib/udev/rules.d"
  cat > "${pkgdir}/usr/lib/udev/rules.d/99-openaula.rules" <<'RULE'
# openaula: AULA/Epomaker F108 Pro (cable USB-C y dongle 2.4 GHz)
SUBSYSTEM=="usb", ATTR{idVendor}=="0c45", ATTR{idProduct}=="800a", TAG+="uaccess"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0c45", ATTRS{idProduct}=="800a", TAG+="uaccess"
SUBSYSTEM=="usb", ATTR{idVendor}=="05ac", ATTR{idProduct}=="024f", TAG+="uaccess"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="024f", TAG+="uaccess"
RULE
}
