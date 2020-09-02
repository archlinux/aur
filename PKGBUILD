# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.4.2
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
url="https://github.com/metabrainz/picard"
license=('GPL2')
arch=('x86_64')
depends=('glibc' 'python-dateutil' 'python-discid' 'python-markdown'
'python-mutagen' 'python-pyqt5')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('chromaprint: fingerprinting'
            'qt5-multimedia: media player toolbar'
            'qt5-translations: full UI translation')
# pypi sdist tarball does not contain tests
# https://tickets.metabrainz.org/browse/PICARD-1935
# source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/metabrainz/${pkgname}/archive/release-${pkgver}.tar.gz")
sha512sums=('17f6015dd06a1282e6dc216726a74cc7bf2a54a5694e09e2d7ae6f1b4c85f2f60f3de1218d952fa2c4e088b3330d1fd12e4b41cf819d7c3d2d96278532338e15')
b2sums=('a44e82ac1a0ad776eb371309ad13f0a5e9afe4a0fe8b898dbbcb71ac554da3ff7cf4a2d88a8e476c811dfeb515ca7371ca8effb326b9285e6c53ebeac6795c15')

prepare() {
  mv -v "${pkgname}-release-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
                          --optimize=1 \
                          --disable-autoupdate \
                          --root="${pkgdir}"
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
