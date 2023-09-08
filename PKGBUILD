#!/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Sergey M <yamldevelope@proton.me>
# Based on:
# https://github.com/microsoft/linux-vm-tools/blob/master/arch/install-config.sh

pkgname="hyperv-enhanced-session"
pkgver=0.1.0
pkgrel=1
#arch=('x86_64')
arch=('any')
pkgdesc="Hyper-V Enhanced Session Support"
url="https://github.com/s3rgeym/hyperv-enhanced-session"
license=('GPL')

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
  'configure-rdp.sh'
  "$pkgname.service"
  'README.md'
)

sha256sums=('d2caa377132c1ddb741a9fbd1af22c4c4610e1e4636041d938adc4dcb6e1780c'
            'dfdc916462b69871f606d3f35289b071d5598dd1ba9be12cd84902f963a0d43a'
            'c74e683f2acae8c89c336ca80dd54cfa3c0a1fc58a8c50b12d33874594389022'
            '35f160735e44ff9af70a0a562d945528ad2f54c2c2d7e7296c605e1aa092920f'
            'f0a32c2658bba8e91d65b2cd03eef69fd782d8b6104d3f61265cdf3d603f10cd'
            'dd6fb56f5c472489b1e01f49ebf581e1e7c3c6e4776ad8f3afd7a7411a0168cc'
            '4bf48c3e5c31e38efd3f1369d2443e40da24e2b2b24b38ea8ca6fcd2060186a3'
            '972ede1b2a0abb35f860c019fe0f25e8ee29af1d343e3ee792ba858a9b1f251f')

build() {
  :
}

prepare() {
  :
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/{etc/{modules-load.d,polkit-1/localauthority/50-local.d,pam.d,X11},usr/lib/systemd/system,opt/$pkgname}
  install -Dm644 hv_sock.conf blacklist-vmw_vsock_vmci_transport.conf -t "$pkgdir"/etc/modules-load.d
  install -Dm644 45-allow-colord.pkla -t "$pkgdir"/etc/polkit-1/localauthority/50-local.d
  install -Dm644 xdrp-sesman -t "$pkgdir"/etc/pam.d
  install -Dm644 Xwrapper.config -t "$pkgdir"/etc/X11
  install -Dm644 "$pkgname.service" -t "$pkgdir"/usr/lib/systemd/system
  install -Dm644 README.md -t "$pkgdir"/opt/$pkgname
  install -Dm755 configure-rdp.sh -t "$pkgdir"/opt/$pkgname

  echo "You will have to configure .xinitrc to start your windows manager, see https://wiki.archlinux.org/index.php/Xinit"
  echo "Run \"sudo systemctl enable --now $pkgname\" to enable enhanced session."
}
