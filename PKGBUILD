# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkgname=mumailer
pkgname=("python-mumailer" "mumailer")
pkgver=0.4.2
pkgrel=1
pkgdesc="Simple mailer agent using SMTP"
url="http://www.muflone.com/mumailer"
arch=('any')
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-yaml')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a9040fbd41d3d9b3fa372ddc80596146389bd994ac130ad1cb95eba4fb2c77ff')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package_python-mumailer() {
  pkgdesc="Python package to easily send email messages using SMTP"

  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  for _file in "${pkgdir}/usr/lib/python3.10/site-packages/mumailer/samples"/*.py
  do
    chmod +x "${_file}"
    sed -i '1i#!/usr/bin/python' "${_file}"
  done
  rm "${pkgdir}/usr/bin/mumailer"
  rmdir "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s "/usr/lib/python3.10/site-packages/mumailer/samples" "${pkgdir}/usr/share/doc/${pkgname}"
}

package_mumailer() {
  depends=('python-mumailer')
  pkgdesc="Simple mailer agent using SMTP"

  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="build" dist/*.whl
  install -m 755 -D "build/usr/bin/mumailer" "${pkgdir}/usr/bin/${pkgname}"
}

