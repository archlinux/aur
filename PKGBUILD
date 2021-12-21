# Maintainer: Sick Codes <info at sick dot codes>

pkgname=qnx-modules-dkms
_pkgname=${pkgname%-*}
pkgver=r9.11df204
arch="$(uname -r)"
url='https://github.com/sickcodes/qnx-modules'
pkgrel=1
pkgdesc='QNX4 and QNX6 FileSystem Types as Kernel Modules (dkms). BlackBerry qnxfs compatible.'
arch=('x86_64' 'aarch64' 'i386')
license=('GPL3')
provides=("${_pkgname}")
depends=('dkms')
makedepends=('git')
source=("git+${url}.git"#commit=11df204f32640c7d5ea402f3afd828a085504a3a)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# prepare() {
#   cd "${srcdir}/${_pkgname}"
# }

package() {
  
  cd "${srcdir}/${_pkgname}"

  install -Ddm755 "${pkgdir}/usr/src/qnx4-${pkgver}/"
  install -Ddm755 "${pkgdir}/usr/src/qnx6-${pkgver}/"

  cp -dr --preserve=ownership "${srcdir}/${_pkgname}/qnx4/"* "${pkgdir}/usr/src/qnx4-${pkgver}/"
  cp -dr --preserve=ownership "${srcdir}/${_pkgname}/qnx6/"* "${pkgdir}/usr/src/qnx6-${pkgver}/"

  cd "${srcdir}/${_pkgname}/qnx4"
  make
  make DESTDIR="${pkgdir}/usr/src/qnx4-${pkgver}/" install

  cd "${srcdir}/${_pkgname}/qnx6"
  make
  make DESTDIR="${pkgdir}/usr/src/qnx6-${pkgver}/" install

  # Set name and version
  sed -e "s/@_PKGBASE@/qnx4/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/qnx4-${pkgver}/dkms.conf"

  sed -e "s/@_PKGBASE@/qnx6/" \
      -e "s/@PKGVER@/${pkgver}/" \
         "${pkgdir}/usr/src/qnx6-${pkgver}/dkms.conf"

  echo '** To activate qnx4 and/or qnx6 **
# $ sudo modprobe qnx4
# $ sudo modprobe qnx6'
  
}

# sudo modprobe qnx4 qnx6

# vim:set ts=2 sw=2 et:
