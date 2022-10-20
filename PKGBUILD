# Maintainer: noobping <hello (at) noobping _dot_ dev>

pkgname=matrix-sydent
_pkgname=sydent
pkgver=2.5.2
pkgrel=1
pkgdesc="Reference Matrix Identity Server"
arch=(any)
license=(Apache)
url="https://github.com/matrix-org/sydent"
depends=('libffi' 'libxslt' 'openssl' 'python-pycparser' 'python-attrs' 'python-jinja' 'python-matrix-common' 'python-netaddr' 'python-phonenumbers' 'python-pyaml' 'python-pynacl' 'python-pyopenssl' 'python-service-identity' 'python-signedjson' 'python-sortedcontainers' 'python-twisted' 'python-typing_extensions' 'python-unpaddedbase64' 'python-virtualenv' 'python-zope-schema' 'sqlite')
optDepends=('python-prometheus_client')
makedepends=('python-setuptools' 'python-poetry')
install=${_pkgname}.install
source=("${_pkgname}-${pkgver/_rc/-rc}.tar.gz"::"${url}/archive/v${pkgver/_rc/-rc}.tar.gz"
        "sysusers-${_pkgname}.conf"
        "tmpfiles-${_pkgname}.conf"
        "${_pkgname}.service")
sha256sums=('ad69565b0d48dcd7c38eda02121b8be4a97546aee4900fb21751dcfe493c9fc6'
            '87886a4694e036fb3534fc9166f66920c28ff73ecd8add796813964644db8023'
            'bee989cd9e43758cfb31ef8cab465fbc05de73cbf7fdf916009178bee4b145ea'
            '95cc4df0083f667dc7fbdb884d74f38db0a2f74bcde3f34fe79994d23d4ce720')

package() {
  cd "${srcdir}"
  install -Dm644 ${_pkgname}.service -t  ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 sysusers-${_pkgname}.conf ${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf
  install -Dm644 tmpfiles-${_pkgname}.conf ${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf

  cd "${_pkgname}-${pkgver/_rc/-rc}"
  mkdir -p ${pkgdir}/usr/{bin,lib/python3.10/site-packages}
  cp -r "${_pkgname}" "${pkgdir}/usr/lib/python3.10/site-packages/${_pkgname}"
  HOME="${pkgdir}" poetry install --only-root --no-interaction --no-cache --no-plugins

  cd "${pkgdir}"  
  mv .cache/pypoetry/virtualenvs/matrix-sydent*/bin/sydent usr/bin/sydent
  sed -i '1c\#!/bin/python' usr/bin/sydent
  echo "/usr/lib/python3.10/site-packages/${_pkgname}" > usr/lib/python3.10/site-packages/${_pkgname}.pth
  
  mv .cache/pypoetry/virtualenvs/matrix-sydent*/lib/python*/site-packages/matrix_sydent*-info usr/lib/python3.10/site-packages/${_pkgname}.dist-info
  rm -fr .local .cache usr/lib/python3.10/site-packages/sydent.dist-info/direct_url.json usr/lib/python3.10/site-packages/sydent.dist-info/RECORD
}
