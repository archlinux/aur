# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Joakim Hernberg <jhernberg at alchemy dot lu>

pkgname=rt-tests
pkgver=1.1
pkgrel=1
pkgdesc="A collection of latency testing tools for the linux(-rt) kernel"
arch=('x86_64')
url="https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/about/"
license=('GPL2')
depends=('python2' 'numactl')
source=("https://git.kernel.org/pub/scm/utils/${pkgname}/${pkgname}.git/snapshot/${pkgname}-1.1.tar.gz")
sha512sums=('2698bf131b21e9e632ffb4605d965f0e1158b5b3c332c9b8ca71f34a2eeb72cc5c5a18932aaf8ce9e5d03b8a81330d0e8306b99f321852b1234a80f7bf8fce2c')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i s/'shell python'/'shell python2'/ Makefile
  sed -i 's/python/python2/' src/hwlatdetect/hwlatdetect.py
  sed -i s/'mpath = os.path.join(path, m) + ".ko"'/'mpath = os.path.join(path, m) + ".ko.gz"'/g src/hwlatdetect/hwlatdetect.py
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix=/usr DESTDIR="${pkgdir}" install
  install -vDm644 MAINTAINERS "${pkgdir}/usr/share/doc/${pkgname}/MAINTAINERS"
  install -vDm644 README.markdown "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
