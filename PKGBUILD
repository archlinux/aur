# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: John Gerritse <tyrannis dot hawk at gmail dot com>
# Contributor: tdy <tdy@archlinux.info>

pkgname=trelby
pkgver=2.4.9
pkgrel=4
pkgdesc="The free, multiplatform, feature-rich screenwriting program!"
arch=('any')
url="https://github.com/limburgher/trelby"
license=('GPL2')
depends=(
       'python'
       'python-lxml'
       'python-wxpython'
       'python-reportlab'
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
conflicts=(trelby-git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/limburgher/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        ${pkgname}.xml)
sha256sums=('05b1a97f97779dd8dc383314e74c17e39c2331f47e970323c7176718d4df874e'
            'eb9332ff5bd22988ac87231851876df76220a581e1f5bfc5b782cff10ccffe42')

prepare() {
  cd ${pkgname}-${pkgver}
  gzip -c names.txt > names.txt.gz
  gzip -c dict_en.dat > dict_en.dat.gz
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py sdist

}

check() {
  cd ${pkgname}-${pkgver}
  pytest
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 "trelby.desktop" "${pkgdir}/usr/share/applications/trelby.desktop"
  install -Dm644 "resources/icon256.png" "${pkgdir}/usr/share/trelby/resources/icon256.png"
  install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm755 "${pkgdir}/opt/trelby/bin/trelby" "${pkgdir}/usr/bin/trelby"
}
