# Maintainer: Matt Collins <matt.mattop@gmail.com>

_pkgbase="gasket"
pkgname="$_pkgbase-dkms-git"
pkgver=r236.5815ee3
pkgrel=2
pkgdesc='Google Coral driver for PCIe-based Edge TPU devices, such as the M.2 and Mini PCIe Accelerator, Git version'
arch=('x86_64')
url='https://coral.withgoogle.com/'
license=('GPL2')
depends=('dkms')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
makedepends=('sed' 'binutils' 'git')
source=("git+https://github.com/google/gasket-driver.git"
        "https://github.com/google/gasket-driver/commit/4b2a1464f3b619daaf0f6c664c954a42c4b7ce00.patch"
        "https://github.com/google/gasket-driver/commit/6fbf8f8f8bcbc0ac9c9bef7a56f495a2c9872652.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
        cd "${srcdir}/gasket-driver/"
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gasket-driver
  patch -Np1 -i ../../4b2a1464f3b619daaf0f6c664c954a42c4b7ce00.patch # no_llseek patch for kernels >= 6.12
  patch -Np1 -i ../../6fbf8f8f8bcbc0ac9c9bef7a56f495a2c9872652.patch # MODULE_IMPORT_NS patch for kernels >= 6.13
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
