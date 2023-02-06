# Maintainer: Szabolcs Sipos <archur [at] balfug [dot] com>

buildarch=28

pkgname=raspberrypi-devicetree-git
pkgdesc="Downstream devicetrees and overlays for Raspberry Pi"
pkgver=1.20230106
pkgrel=1
epoch=1
arch=('any')
url="https://github.com/raspberrypi/firmware"
_repository="https://github.com/raspberrypi/firmware.git"
provides=('raspberrypi-devicetree')
conflicts=('uboot-raspberrypi' 'linux-raspberrypi' 'linux-raspberrypi4')
license=(GPL2)
options=(!strip)

prepare() {
  rm -rf "${srcdir}"/*
  git clone --filter=blob:none --no-checkout "${_repository}" "${srcdir}"/firmware
  cd "${srcdir}"/firmware

  latest_tag=$(git tag -l --sort=-version:refname "1.20*" | head -n 1)
  echo "${latest_tag}" > "${srcdir}"/PKGVER

  git -c advice.detachedHead=false checkout tags/"${latest_tag}"
}

pkgver() {
  cat "${srcdir}"/PKGVER
}

package() {
  mkdir -p "${pkgdir}"/boot
  cp -r "${srcdir}"/firmware/boot/{*.dtb,overlays} "${pkgdir}"/boot
}
