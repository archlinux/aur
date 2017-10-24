# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

pkgname=nextcloud-news-updater
pkgver=10.0.0
pkgrel=2
pkgdesc="This Python library is a parallel feed updater for the nextCloud News app"
arch=('any')
url="https://github.com/nextcloud/news-updater"
license=('GPL3')
depends=('python-setuptools')
optdepends=('nextcloud-app-news: Updating a local instance of the nextCloud News app')
backup=("etc/webapps/nextcloud/news/${pkgname}.ini")
options=('!strip')
source=("${pkgname}.tar.gz::https://github.com/nextcloud/news-updater/archive/${pkgver}.tar.gz"
  "${pkgname}.ini"
  "${pkgname}.service"
  "${pkgname}.timer")
sha512sums=('de67edebe05606f044f73d93a48b67251182f80175c7ce1e40d62d9835ba05928d5b43303f385120fb96df4c71735c5abe7310efb63d00e972d4f1a166ee0470'
            'a36b8da6028e6f1901013c5fc3373eb16c7fc01902a7ed2b3320db84e339428fe43e301079cf1cb9955dd9e9c622c9fea2d945ac6f2f931c7c987bda1868e04c'
            '21ce177a2cf36832d5dd51b00673734998982397d42366e4448c1ae84f570590acb26b209b918cbc215001ea0b8ae95765def2a688c7753c66c24caed44ef8e9'
            'dd06c06249bc9537555517d97a66dbaefcfcc27547a03abb3cf8bcb15edbda1f49cb03191dbebb8ad6737bdf46c1f25567636fa1c206b60a39d22ce41c506aaa')
install=${pkgname}.install

build() {
  cd "news-updater-${pkgver}"
  python setup.py build
}

package() {
  cd "news-updater-${pkgver}"
  python setup.py install --skip-build --optimize=1 --root="${pkgdir}"
  install -d "${pkgdir}"/etc/webapps/nextcloud/news
  install -Dm0644 "${srcdir}/${pkgname}.ini" "${pkgdir}/etc/webapps/nextcloud/news/${pkgname}.ini"
  install -Dm0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${srcdir}/${pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
}
