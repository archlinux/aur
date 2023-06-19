# Maintainer Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone
pkgver=0.4.1
pkgrel=3
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF"
url="https://github.com/firstlookmedia/dangerzone"
arch=('x86_64')
license=('MIT')
depends=('python-appdirs' 'python-click' 'python-pyxdg' 'python-requests' 'pyside2' 'python-termcolor' 'python-pip' 'podman')
makedepends=('python-setuptools' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
"container.tar.gz::${url}/releases/download/v${pkgver}/container.tar.gz")
install=${pkgname}.install
sha256sums=('0ed442dfe72749a6895b6b870dec7fb4f7ed5b591d5869d18009755cbcac30e9'
            '55cc6a4f17af86f0f226d8f92ebf57d3fecd4cfc7cf043359e05cc2766c01af3')
pythonpath="#!/usr/bin/env python3"

package() {
  cd ${pkgname}-${pkgver}
  # Poetry Setup
  python -m venv dangerzone
  source ./dangerzone/bin/activate
  python -m pip install poetry
  poetry install

  #Docker image setup
  install -Dm644 "${srcdir}/container.tar.gz" "${pkgdir}/usr/share/dangerzone/container.tar.gz"

  #Install
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr

  # Fix headers
  sed -i "1s|.*|$pythonpath|" ${pkgdir}/usr/bin/dangerzone ${pkgdir}/usr/bin/dangerzone-cli
}
