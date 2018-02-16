# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

_name=news-updater
pkgname=nextcloud-news-updater
pkgver=10.0.1
pkgrel=2
pkgdesc="This Python library is a parallel feed updater for the nextCloud News app"
arch=('any')
url="https://github.com/nextcloud/news-updater"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
optdepends=('nextcloud-app-news: Updating a local instance of the nextCloud News app')
backup=("etc/webapps/nextcloud/news/${pkgname}.ini")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/${_name}/archive/${pkgver}.tar.gz"
  "${pkgname}.ini"
  "${pkgname}.service"
  "${pkgname}.timer")
sha512sums=('dc57079df5490d63317525c322318dd3bf2dc88630827ff8cac8512e0e9fa3330793c556d63c6ca264fb4ad3dff2d9014bbf8f951e1a2f30a0c8fafcbc9eeafd'
            'a36b8da6028e6f1901013c5fc3373eb16c7fc01902a7ed2b3320db84e339428fe43e301079cf1cb9955dd9e9c622c9fea2d945ac6f2f931c7c987bda1868e04c'
            '21ce177a2cf36832d5dd51b00673734998982397d42366e4448c1ae84f570590acb26b209b918cbc215001ea0b8ae95765def2a688c7753c66c24caed44ef8e9'
            'dd06c06249bc9537555517d97a66dbaefcfcc27547a03abb3cf8bcb15edbda1f49cb03191dbebb8ad6737bdf46c1f25567636fa1c206b60a39d22ce41c506aaa')
install=${pkgname}.install

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build --optimize=1 --root="${pkgdir}"
  install -vDm0644 "${srcdir}/${pkgname}.ini" "${pkgdir}/etc/webapps/nextcloud/news/${pkgname}.ini"
  install -vDm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -vDm0644 "${srcdir}/${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
}
