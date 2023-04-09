# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Thomas Jost <thomas.jost@gmail.com>

pkgname=subdownloader
pkgver=2.1.0
pkgrel=7
pkgdesc="Automatic download/upload of subtitles using fast hashing"
arch=('any')
url="https://github.com/subdownloader/subdownloader"
license=('GPL3')
depends=('python-argcomplete' 'python-argparse' 'python-commonmark'
'python-langdetect' 'python-progressbar' 'python-pymediainfo')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx-argparse')
checkdepends=('python-pytest')
optdepends=('python-pyqt5: for the GUI')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c61e5eb5c9f1cb452b42a2643e67d9c82550af3dd36940e2d7f4afb8229f8d394a0eafca662f5446c13230b6541dec25e6d33c486a3324d4a5e3c2d7b3a1faa8')
b2sums=('b44ed7c898b63b750f55687783b29c6a0dc6a7c30bc4c65ec737c3498d2dfb77b6d7b11196a3e7179a6c4f727ab1a706be04bd4cedc8afa5a74e59738a467200')

build(){
  cd "${pkgname}-${pkgver}"
  python setup.py build
  python setup.py build_sphinx
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}"
  # man page
  install -vDm 644 "build/sphinx/man/${pkgname}.1" \
    "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  # freedesktop.org
  install -vDm 644 "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -vDm 644 "scripts/gui/rc/images/${pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm 644 {ChangeLog,README.md}
}
