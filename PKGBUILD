#!/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Sergey M <yamldevelope@proton.me>
# Based on:
# https://github.com/microsoft/linux-vm-tools/blob/master/arch/install-config.sh

pkgname="hyperv-enhanced-session"
# AUR не поддерживает теги как и любые ветки кроме master
pkgver="0.1.0"
pkgrel=2
#arch=('x86_64')
arch=('any')
pkgdesc="Enables Hyper-V Enhanced Session via systemd."
url="https://github.com/s3rgeym/hyperv-enhanced-session"
license=('GPL')

provides=("$pkgname.service")

depends=(
  base{,-devel}
  xorg-xinit
  hyperv
  {xorg,}xrdp-git
)

optdepends=(
  'hyperv: hyper-v tools'
  'xf86-video-fbdev: frame buffer xorg driver fix resolution issue'
)

source=(
  'hv_sock.conf'
  'blacklist-vmw_vsock_vmci_transport.conf'
  '45-allow-colord.pkla'
  'xdrp-sesman'
  'Xwrapper.config'
  'configure_xrdp.sh'
  'xrdp_configured.txt'
  "$pkgname.service"
  'https://raw.githubusercontent.com/s3rgeym/hyperv-enhanced-session/main/README.md'
)

sha256sums=('d2caa377132c1ddb741a9fbd1af22c4c4610e1e4636041d938adc4dcb6e1780c'
            'dfdc916462b69871f606d3f35289b071d5598dd1ba9be12cd84902f963a0d43a'
            'c74e683f2acae8c89c336ca80dd54cfa3c0a1fc58a8c50b12d33874594389022'
            '35f160735e44ff9af70a0a562d945528ad2f54c2c2d7e7296c605e1aa092920f'
            'f0a32c2658bba8e91d65b2cd03eef69fd782d8b6104d3f61265cdf3d603f10cd'
            '206eae80672ad90cf5538a553f296d3574ce5ade445cd4b115db2a02be7018f0'
            '9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa'
            '87290e10f70895db5b469ea38228c92174b831ae7479ece6788349415a108eaf'
            'aa61cd73c97522cad318bb3b709e6a22c044fc69644df6693e4f66e18f2b2293')

build() {
  :
}

prepare() {
  :
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/{etc/{modules-load.d,polkit-1/localauthority/50-local.d,pam.d,X11},usr/lib/systemd/system,usr/share{/doc,}/$pkgname}
  install -Dm644 hv_sock.conf blacklist-vmw_vsock_vmci_transport.conf -t "$pkgdir"/etc/modules-load.d
  install -Dm644 45-allow-colord.pkla -t "$pkgdir"/etc/polkit-1/localauthority/50-local.d
  install -Dm644 xdrp-sesman -t "$pkgdir"/etc/pam.d
  install -Dm644 Xwrapper.config -t "$pkgdir"/etc/X11
  install -Dm644 "$pkgname.service" -t "$pkgdir"/usr/lib/systemd/system
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm755 configure_xrdp.sh -t "$pkgdir"/usr/share/$pkgname
  install -Dm755 xrdp_configured.txt -t "$pkgdir"/usr/share/$pkgname

  printf '%.0s=' {1..72}
  echo
  echo "You will have to configure .xinitrc to start your windows manager, see https://wiki.archlinux.org/index.php/Xinit"
  echo "Run \"sudo systemctl enable --now $pkgname\" to enable enhanced session."
  printf '%.0s=' {1..72}
  echo
}
