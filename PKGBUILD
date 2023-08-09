# Maintainer: Proudmuslim <proudmuslim-dev@protonmail.com>
# Previous Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=dangerzone
pkgver=0.4.2
pkgrel=3
pkgdesc="Take potentially dangerous PDFs, office documents, or images and convert them to a safe PDF"
url="https://github.com/firstlookmedia/dangerzone"
arch=('x86_64')
license=('MIT')
depends=('python-appdirs' 'python-markdown' 'python-click' 'python-pyxdg' 'python-requests' 'pyside2' 'python-termcolor' 'python-pip' 'podman')
makedepends=('python-setuptools' 'sed')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
"container.tar.gz::${url}/releases/download/v${pkgver}/container.tar.gz")
install=${pkgname}.install
sha256sums=('d8d79fae13a8aab21c29dbca2e59f575f8b640345ca09191eac780ecc666f3ad'
            '2e453c35f747a64f0144de7973fcb477e74ed49460d163272ac3d169b2428f5f')
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
