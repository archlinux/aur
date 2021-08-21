# Maintainer: Vic Luo <vicluo96(at)gmail.com>

_pkgbase=dxgkrnl
pkgname=dxgkrnl-dkms-git
pkgdesc="DirectX linux drivers for GPU-PV (dkms)"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/WSL2-Linux-Kernel/"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'linux-headers')
provides=("dxgkrnl")
conflicts=("dxgkrnl")
pkgver=5.6.rc2.r73841.gbb562a9d7106
pkgrel=1
# epoch 0: ver number has "v" as the prefix
epoch=1

source=(
	"git+https://github.com/microsoft/WSL2-Linux-Kernel.git#branch=linux-msft-wsl-5.10.y"
	"dkms.conf"
	"extra-defines.h"
)

pkgver() {
  cd "WSL2-Linux-Kernel"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

sha256sums=('SKIP'
            'a6b89d054a3d0cc9d18b3ed1c0efd6acde4b22b3fad9cc6a378073af1e585f7b'
            '25e71dcbd2a787d5a5b610ec218287cd781def3b0d821f31b071f5f7183cbc71')

package() {
  mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r WSL2-Linux-Kernel/drivers/hv/dxgkrnl/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -Dm644 extra-defines.h "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/extra-defines.h
}
