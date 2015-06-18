# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=qira
pkgver=1.1
pkgrel=1
pkgdesc='QEMU Interactive Runtime Analyser'
url='https://github.com/BinaryAnalysisPlatform/qira'
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qemu' 'python2-ipaddr' 'python2-flask-socketio' 'python2-pillow' 'python2-capstone' 'python2-pydot' 'python2-pyelftools')
makedepends=('python2-setuptools')
source=(https://github.com/BinaryAnalysisPlatform/${pkgname}/raw/master/releases/${pkgname}-${pkgver}.tar.xz)
sha512sums=('11ee4d9390a28825342fe9921633aad186eebe05f2aeb875378aec193e5cb62ca8807869eeb751c8f8c0d8806e33640a6ed468d274e14ebc92b935a7e358c923')

prepare() {
  cd ${pkgname}
  find . -type d -print0 | xargs -0 chmod +rx
  find . -type f -print0 | xargs -0 chmod +r
  find . -type f -executable -print0 | xargs -0 chmod +x
}

build() {
  cd ${pkgname}/qiradb
  python2 setup.py build
}

package() {
  cd ${pkgname}

  pushd qiradb
  python2 setup.py install -O1 --single-version-externally-managed --root="${pkgdir}"
  popd

  mv qiradb/VERSION VERSION
  rm -r qiradb

  install -d "${pkgdir}/opt/${pkgname}"
  cp -r . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
