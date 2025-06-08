# Maintainer: tx0 <me at tx0 dot su>
# Contributor: kmille <github at androidloves dot me>

_pkgbase=silk-guardian
pkgname=silk-guardian-blacklist-dkms
pkgver=v1.0.2
_pkgver=${pkgver:1:5}
pkgrel=1
pkgdesc="kill switch for unknown usb devices (DKMS)"
arch=('x86_64' 'aarch64')
url="https://github.com/timoxa0/silk-guardian"
license=('MIT')
makedepends=('git')
depends=('python-jinja' 'python-yaml' 'python-pyusb' 'dkms')
conflicts=('lkrg-dkms' 'lkrg-dkms-git' 'silk-guardian-dkms')
source=("https://github.com/timoxa0/silk-guardian/archive/${pkgver}.tar.gz")
sha256sums=('fc2f684cdad93c1a43b196ac59f21ce6590ec28719fa76e8ad81b903aa5cd840')

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

