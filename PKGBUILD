# Maintainer: Markus Hartung <mail@hartmark.se>
_pkgname=aura-gpu
pkgname=aura-gpu-dkms-git
pkgver=r11.815ee6c
pkgrel=1
pkgdesc="Kernel module to expose aura gpu so we can access it from example OpenRGB."
arch=('i686' 'x86_64')
url="https://github.com/hartmark/aura-gpu"
license=('Unknown')
depends=('dkms')

provides=("$_pkgname")
source=(
  "git+https://github.com/hartmark/aura-gpu"
  "dkms.conf"
)
sha256sums=('SKIP'
            '7f4e4f40a625d5ff9a52e47dadda3f72bd210b69502558642bccc4c335a45f12')

pkgver() {
  cd aura-gpu
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e "s/@CFLGS@//" \
      -e "s/@VERSION@/$pkgver/" \
      -i "$srcdir/dkms.conf"
}

package() {
  cd "$srcdir/$_pkgname"

  install -d "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  cp -r ${srcdir}/${_pkgname}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgname}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  install -d "${pkgdir}"/etc/modules-load.d/
  echo "${_pkgname}" > "${pkgdir}"/etc/modules-load.d/${_pkgname}.conf
  echo "######################################################################################"
  echo "${_pkgname} will be autoloaded on reboot, to manually load straight away type:"
  echo "sudo modprobe ${_pkgname}"
  echo "######################################################################################"
}

# vim:set ts=2 sw=2 et:
