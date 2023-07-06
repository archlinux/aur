# Maintainer: kmille <github at androidloves dot me>

_pkgbase=silk-guardian
pkgname=silk-guardian-dkms
pkgver=v1.0.1
_pkgver=${pkgver:1:5}
pkgrel=1
pkgdesc="kill switch for unknown usb devices (DKMS)"
arch=('x86_64')
url="https://github.com/kmille/silk-guardian"
license=('MIT')
makedepends=('git')
depends=('python-jinja' 'python-yaml' 'python-pyusb' 'dkms' 'linux-headers')
conflicts=('lkrg-dkms' 'lkrg-dkms-git')
source=("https://github.com/kmille/silk-guardian/archive/${pkgver}.tar.gz")
sha256sums=('a9124217797029974231ee3f248972d9bd8e80413fa39e4a1b8fad7c2121ba69')

prepare() {
  sed -e "s/@PKGVER@/${pkgver}/" -i "${srcdir}/${_pkgbase}-${_pkgver}/dkms.conf"
}

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  # Copy sources (including Makefile)
  cp -r "${srcdir}/${_pkgbase}-${_pkgver}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/" -type d -exec chmod 755 {} \;
  chmod 0755 "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/silk-helper.py"

  local _p="${pkgdir}/usr/lib/modules-load.d/${_pkgbase}.conf"
  install -D -m0644 /dev/null "${_p}"
  printf "silk" > "${_p}"
}

