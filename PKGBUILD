_modulename=usb_oc
pkgname=${_modulename}-dkms
pkgver=1.0
pkgrel=3
pkgdesc="Kernel module for overclocking USB devices"
arch=('any')
url="https://github.com/p0358/usb_oc-dkms"
license=("GPL-2.0-only")
depends=("dkms")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db2f78fab0eedd65faed8437478984519ce143eef2661e376e75d7f23ff1c1d8')

package() {
  cd "$srcdir/usb_oc-dkms-$pkgver"

  # Copy module into /usr/src
  install -dm755 "${pkgdir}"/usr/src/${_modulename}-${pkgver}
  cp -r {src,dkms.conf,Makefile} "${pkgdir}"/usr/src/${_modulename}-${pkgver}

  # Set name and version
  sed -i -e "s|^PACKAGE_VERSION=.*|PACKAGE_VERSION=\"${pkgver}\"|" "${pkgdir}"/usr/src/${_modulename}-${pkgver}/dkms.conf
  sed -i -Ee "s|^MODULE_VERSION(\"[^\"]*\")\;|MODULE_VERSION\(\"${pkgver}\"\)\;|" "${pkgdir}"/usr/src/${_modulename}-${pkgver}/src/usb_oc.c

  # Install license and readme
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}/
}
