# Maintainer: Pradana Aumars <paumars@protonmail.com>

pkgname=qira
pkgver=1.3
pkgrel=1
pkgdesc='QEMU Interactive Runtime Analyser'
url='https://qira.me'
arch=('x86_64' 'i686')
license=('MIT')
depends=('qemu' 'python2-ipaddress' 'python2-flask-socketio' 'python2-pillow' 'python2-capstone' 'python2-pydot' 'python2-pyelftools' 'python2-pip' 'python2-virtualenv' 'python2-socketio' 'python2-gevent')
makedepends=('python2-setuptools')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/geohot/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0f30169035a42f237a0711049ddbaee0')

prepare() {
  cd ${pkgname}-${pkgver}
  find . -type d -print0 | xargs -0 chmod +rx
  find . -type f -print0 | xargs -0 chmod +r
  find . -type f -executable -print0 | xargs -0 chmod +x
}

package() {
  cd ${pkgname}-${pkgver}
  cd qiradb
  python2 setup.py install -O1 --root="${pkgdir}"
  cd ..
  mv qiradb/VERSION VERSION

  sed -i "/import sys/c\import sys\nsys.path.append('/usr/lib64/python2.7/site-packages')" middleware/qira.py
  
  virtualenv2 venv
  source venv/bin/activate  

  install -d "${pkgdir}/opt/${pkgname}"
  cp -r . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
