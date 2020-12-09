# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

_name=news-updater
pkgname=nextcloud-news-updater
pkgver=11.0.0
pkgrel=3
pkgdesc="A parallel feed updater for the Nextcloud News app"
arch=('any')
url="https://github.com/nextcloud/news-updater"
license=('GPL3')
depends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('nextcloud-app-news: for updating a local instance of the Nextcloud News app')
backup=("etc/webapps/nextcloud/news/${pkgname}.ini")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/${_name}/archive/${pkgver}.tar.gz"
        "${pkgname}-11.0.0-tests.patch::https://github.com/nextcloud/news-updater/pull/31/commits/8abcb143ab12119441e80b855e735c766c7c984c.patch"
        "${pkgname}.ini"
        "${pkgname}.service"
        "${pkgname}.timer")
sha512sums=('ec47d65c7d2f97a413582771e2ca16102be589b4ed01a917f05e38d161d06926df98cbcb2e5f72b1e89f627efb0f146fbc4d39866ab6481eb93de2a446664f92'
            '3bf01849c889f03d8bf57986e4a97815ae41caf4c100c6e86c79875554fc951079f664d83be96aa7004d8f3b9030027a5c3995a03002c700e1b1e1573f264385'
            'd661d65e3da1d80cc785d40c803663f2e149b53dbb3e1b0e66f1d5c1b07eb3983a9ffeee40b44b04f89bcc787c5cfb7f46e8c408df020a372bc918426b76007b'
            'd18c3633a79c4f26867156a8075403e8d5cd0714e718540589df3359e54df1ebca338e2113712fedfe31d79198104c48ac8d985a6a208732764cd3d4edd31104'
            'dd06c06249bc9537555517d97a66dbaefcfcc27547a03abb3cf8bcb15edbda1f49cb03191dbebb8ad6737bdf46c1f25567636fa1c206b60a39d22ce41c506aaa')
b2sums=('8d327c0c6a64e18a0335cd8f0774c81247dbafe3f5794cc6bac6863e8f8d9e0fc268b9275729ad94d1c7ac9ea2533fccee24f7048adf41e6fe4ffdb64f6400e5'
        '87a499defdff3609cd0ee43d7b81def146d42194904946fa5cb376625423fecae6a6039637a66dfeece762670580be1d34439b9746e777c3a789d5e0971f5de7'
        'a50439972435dc8ed2277633bd5819c51bbf24af317b64210968e3415d0cdae23a333dc5bc912ed6ce1fb40c1cc27addf31a830a4a45ca63dd0ad28dfdb31209'
        '2ceb1aee05f9448e17cc9755344fa9a22b90e0865a4f13a2f9961ed2730ff6668f42ce2c47932363edca8cb2e54a59855fa67bdbfbd3e182a22447b039c9c6c8'
        'a56604d3d29ebbf4fb807bfeec32a90fe5688bd516633f1990e11afd664ba730b941e522c393a21f85b8be2f10cfa08288f0884dc693bcc30b7cc12dc967a0a6')
install="${pkgname}.install"

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../"${pkgname}-11.0.0-tests.patch"
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
                          --root="${pkgdir}"
  # configuration
  install -vDm 644 "../${pkgname}.ini" \
    -t "${pkgdir}/etc/webapps/nextcloud/news/"
  # systemd service/timer
  install -vDm 644 "../${pkgname}."{service,timer} \
    -t "${pkgdir}/usr/lib/systemd/system/"
  # docs
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
