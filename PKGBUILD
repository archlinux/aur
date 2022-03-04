# Maintainer: Markus Hartung <mail@hartmark.se>
_pkgname=aura-gpu
pkgname=aura-gpu-dkms-git
pkgver=r15.f168495
pkgrel=1
pkgdesc="Kernel module to expose aura gpu so we can access it from example OpenRGB."
arch=('i686' 'x86_64')
url="https://github.com/hartmark/aura-gpu"
license=('Unknown')
depends=('dkms')

provides=("$_pkgname")
source=(
  "git+https://github.com/hartmark/aura-gpu"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd aura-gpu
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  git apply ../../*.patch || echo "No patches found"
  install -d "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  cp -r ${srcdir}/${_pkgname}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

  sed -i -e "/^PACKAGE_VERSION=/ s/=.*/=${pkgver}/" "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  install -d "${pkgdir}"/etc/modules-load.d/
  echo "${_pkgname}" > "${pkgdir}"/etc/modules-load.d/${_pkgname}.conf

  echo "######################################################################################"
  echo "${_pkgname} will be autoloaded on reboot, to manually load straight away type:"
  echo "sudo modprobe ${_pkgname}"
  echo "######################################################################################"
}

# vim:set ts=2 sw=2 et:
