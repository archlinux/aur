# Maintainer: Jacob Emmert-Aronson <jacob at mlaronson dot com>
# Contributor: Xiao-Long Chen <chenxiaolong at cxl dot epac dot to>
# Contributor: Paul Viren <paul dot viren at ircameras dot com>

pkgname=gmock
pkgver=1.7.0
_ubuntu_ver=0ubuntu1
pkgrel=1
pkgdesc="Google Mock - A library for writing and using C++ mock classes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/googlemock/"
license=('BSD')
depends=('python2' 'gtest')
options=(!libtool)
source=("http://googlemock.googlecode.com/files/${pkgname}-${pkgver}.zip"
        "import_private_module.patch"
	"reenable_make_install.patch")
sha512sums=('0ab7bb2614f8c00e4842a6819dbc6d9323c42241335078c23eaee53ed420d42f1845d44334eccbf7c114cc88f6ac7a493e20d9b46c58cdba645bbd400eb6db55'
            'fa942ad2fa02b0f5f18748a2800375695b532c5d11316630e007f691367c29b1b7dc2a8e42ad7ad1462aea9fbef65ac8732d7ac3c8408bb08956df363df8d106'
            'a8202488b7354c55c8d02f0bb833e3ff7cc39d7da8f93a634314349c07c940b90d6de356a699254ee332859c71c2b8f177d11eae1382da6e183a482f7faa7b70')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/import_private_module.patch"
  patch -Np1 -i "${srcdir}/reenable_make_install.patch"

  find -name \*.py -exec sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' {} \;
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --enable-external-gtest
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  mkdir -p "${pkgdir}/usr/share/licenses/gmock/"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d -m755 "${pkgdir}/usr/bin/"
  install -d -m755 "${pkgdir}/usr/share/${pkgname}/"
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -d -m755 "${pkgdir}/usr/src/gmock/src"
  install -m755 "scripts/generator/gmock_gen.py" "${pkgdir}/usr/bin/"
  install -m 0644 $srcdir/$pkgname-$pkgver/src/*.cc $pkgdir/usr/src/gmock/src
  cp -r --preserve=mode,links "scripts/generator/cpp" "${pkgdir}/usr/share/${pkgname}/"
  for i in README CONTRIBUTORS; do
    install -m644 ${i} "${pkgdir}/usr/share/doc/${pkgname}/"
  done
  for f in $(ls "${pkgdir}"/usr/bin/*.py); do mv ${f} $(echo ${f} | sed s/\.py//); done
  rm -f "${pkgdir}"/usr/lib/libgtest*
  rm -rf "${pkgdir}"/usr/include/gtest*
}

# vim:set ts=2 sw=2 et:

