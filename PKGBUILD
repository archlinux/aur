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
pkgdesc="Enables Hyper-V Enhanced Session"
url="https://github.com/s3rgeym/hyperv-enhanced-session"
license=('GPL')

depends=(
  base{,-devel}
  xorg-xinit
  hyperv
  {xorg,}xrdp-git
)

optdepends=(
  'xf86-video-fbdev: fix resolution issue'
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
  'f25f22ad6dbbab522c1d44484797eedc7229f78a978cb5981421b470d4360183'
  '964c78a9fe0da00cb0121fe42a93d04be71c88ec67308390be4be53b80980e92'
  '7a0d70aa423511f13664e35b7831aab41f3d37461606f1ed14d6b0b0949a0628'
  'f0a32c2658bba8e91d65b2cd03eef69fd782d8b6104d3f61265cdf3d603f10cd'
  'dd6fb56f5c472489b1e01f49ebf581e1e7c3c6e4776ad8f3afd7a7411a0168cc'
  '06a5b6764c2d5270926c1cc5f51f0d1b0edc5e5b1960bb540111f02f53375af6'
  '679a2e1243106f6cf5ffc04a1ed2241167d39abe7aceec622192c5a91f41c08b')

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
