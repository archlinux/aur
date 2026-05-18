# Maintainer: Jakov Petrina Trnski <jkv.petrina@gmail.com>
pkgname=vfio-tools-git
pkgver=r56.0e50fd1
pkgrel=1
pkgdesc="A collection of tools and scripts that aim to make PCI passthrough a little easier"
url="https://github.com/PassthroughPOST/VFIO-Tools"
arch=('any')
license=('BSD-2-Clause')
depends=('bash' 'libvirt' 'pciutils' 'dialog')
optdepends=('ddcutil: monitor input switching via switch_displays.sh hook')
provides=('vfio-tools')
conflicts=('vfio-tools')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  install -Dm755 libvirt_hooks/qemu "${pkgdir}/etc/libvirt/hooks/qemu"
  install -dm755 "${pkgdir}/etc/libvirt/hooks/qemu.d"

  local hook
  for hook in libvirt_hooks/hooks/*.sh; do
    install -Dm755 "${hook}" "${pkgdir}/usr/share/vfio-tools/hooks/$(basename "${hook}")"
  done

  install -Dm755 vfioselect/vfioselect "${pkgdir}/usr/bin/vfioselect"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
