#!/bin/bash
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Sergey M <yamldevelope@proton.me>
# Based on:
# https://github.com/microsoft/linux-vm-tools/blob/master/arch/install-config.sh

pkgname="hv-enhanced-session"
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
  '02-allow-colord.rules'
  'xdrp-sesman'
  'Xwrapper.config'
  'configure-rdp.sh'
  "$pkgname.service"
  'README.md'
)

sha256sums=('d2caa377132c1ddb741a9fbd1af22c4c4610e1e4636041d938adc4dcb6e1780c'
  'f25f22ad6dbbab522c1d44484797eedc7229f78a978cb5981421b470d4360183'
  'ff7b380d0dcf12763ac56ea03ceb8a426a7f142d59a95b5e2848a0de501bcc27'
  '0d0307fa4081ca69637e7a21f1bd2199dfc2b480c953b0d860950098461f0652'
  'e538852296d305729cb9025f29559410b22cbee33fbee03169979179dc1ff819'
  'd2d679a2fe1994ea4a2cc0b2eb961217250bcddfba544f4b5c0597dd1b38a8ba'
  'cafe12efadd031f8ab5f9647fcdd57d4065ab9e065724d75e34cd6b6e0e06143')

build() {
  :
}

prepare() {
  :
}

package() {
  cd "$srcdir"

  install -Dm644 hv_sock.conf -t "$pkgdir/etc/modules-load.d"
  install -Dm644 02-allow-colord.rules -t "$pkgdir/etc/polkit-1"
  install -Dm644 xdrp-sesman -t "$pkgdir/etc/pam.d"
  install -Dm644 Xwrapper.config -t "$pkgdir/etc/X11"
  install -Dm644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -d "$pkgdir/opt/$pkgname"
  install -Dm644 README.md -t "$pkgdir/opt/$pkgname"
  install -Dm755 configure-rdp.sh -t "$pkgdir/opt/$pkgname"

  echo "You will have to configure .xinitrc to start your windows manager, see https://wiki.archlinux.org/index.php/Xinit"
  echo "Run \"sudo systemctl enable --now $pkgname\" to enable enhanced session."
}
