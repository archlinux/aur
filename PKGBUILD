# Maintainer: Matt Collins <matt.mattop@gmail.com>

_pkgbase="gasket"
pkgname="$_pkgbase-dkms-git"
pkgver=.r235.09385d4
pkgrel=1
pkgdesc='Google Coral driver for PCIe-based Edge TPU devices, such as the M.2 and Mini PCIe Accelerator, Git version'
arch=('x86_64')
url='https://coral.withgoogle.com/'
license=('GPL2')
depends=('dkms')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
makedepends=('sed' 'binutils' 'git')
source=("git+https://github.com/google/gasket-driver.git")
sha256sums=('SKIP')

prepare() {
        echo "${srcdir}"
        echo "${pkgdir}"
}

pkgver() {
	cd "${srcdir}/gasket-driver/"
        printf '%s.r%s.%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  echo "${srcdir}"
  echo "${pkgdir}"
  cd "${srcdir}/gasket-driver/src"
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -pr * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  install -Dm644 "${srcdir}/gasket-driver/debian/gasket-dkms.dkms" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  install -Dm644 "${srcdir}/gasket-driver/debian/gasket-dkms.udev" "${pkgdir}/usr/lib/udev/rules.d/60-gasket-dkms.rules"
  sed -e "s/#MODULEVERSION#/${pkgver}/" -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
