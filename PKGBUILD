# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.4.4
pkgrel=4
pkgdesc="An award-winning free and open-source video editor"
arch=('any')
url="https://www.openshot.org/"
license=('GPL3')
depends=('ffmpeg' 'python-mlt' 'python-pyqt5' 'python-requests' 'libopenshot'
'libopenshot-audio' 'python-pyzmq' 'qt5-base' 'qt5-svg' 'qt5-webkit')
optdepends=('faac: for exporting audio using AAC')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/openshot-qt/archive/v$pkgver.tar.gz"
        "${pkgname}-hicolor-icons.patch::https://github.com/OpenShot/openshot-qt/pull/2837.patch")
sha512sums=('efa71f97a83b89e691b7dab09288ba7d3e91eb25119669fa8f6e28becb8d4cb3e60a923f936ee4ff9a593d016fe3a6b0348153cff937ab7d21a5517de5dfa10c'
            '97ebbe5d289d89c5da307076d7a3a0f517f57e8fd8123a920d031585bd48e1ccdcaa9f8180e976dd602e562d0bd2373e4bf5059dc72cf04b61b462b72a8bba1f')

prepare() {
  mv -v "${pkgname}-qt-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  # Fix hicolor icon paths
  patch -Np1 -i "../${pkgname}-hicolor-icons.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
                          --optimize=1 \
                          --prefix=/usr \
                          --root="${pkgdir}"
  install -vDm 644 {AUTHORS,{CONTRIBUTING,README}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
