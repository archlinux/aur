# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Shujie Zhang <zhang.shujie87@gmail.com>

_name=news-updater
pkgname=nextcloud-news-updater
pkgver=11.0.0
pkgrel=5
pkgdesc="A parallel feed updater for the Nextcloud News app"
arch=(any)
url="https://github.com/nextcloud/news-updater"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
optdepends=('nextcloud-app-news: for updating a local instance of the Nextcloud News app')
backup=(etc/webapps/nextcloud/news/$pkgname.ini)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/nextcloud/$_name/archive/$pkgver.tar.gz
  $pkgname-11.0.0-tests.patch::https://github.com/nextcloud/news-updater/commit/8abcb143ab12119441e80b855e735c766c7c984c.patch
  $pkgname-11.0.0-better_errors.patch::https://github.com/nextcloud/news-updater/commit/b295ee1be1f6ed0ee847c274637c5638ed88563f.patch
  $pkgname-11.0.0-news15.patch::https://github.com/nextcloud/news-updater/commit/e7f51442581fb430cc52a3ccbfec920412ab5d65.patch
  $pkgname.ini
  $pkgname.service
  $pkgname.timer
)
sha512sums=('ec47d65c7d2f97a413582771e2ca16102be589b4ed01a917f05e38d161d06926df98cbcb2e5f72b1e89f627efb0f146fbc4d39866ab6481eb93de2a446664f92'
            '3bf01849c889f03d8bf57986e4a97815ae41caf4c100c6e86c79875554fc951079f664d83be96aa7004d8f3b9030027a5c3995a03002c700e1b1e1573f264385'
            'faaaf485ad724e9180d685c3498e08ffc064070d631d2b90b58c69c8edc0678326215e9da47c51942f386a224783731b9f62038cb41f246f4922b5c45f7a5964'
            'd9cd07d67f3b98e6bcfccc76f9450e2cd3ce1e9a06e75e3eb58775dcf76704e2f38342d9656eb788e8eb202ee5fefc789ae73976514931da7375c53ea1154e32'
            'd661d65e3da1d80cc785d40c803663f2e149b53dbb3e1b0e66f1d5c1b07eb3983a9ffeee40b44b04f89bcc787c5cfb7f46e8c408df020a372bc918426b76007b'
            'd3e3dd77c7dbcbe193c0a078fa8170146a0e92cb3da040b9fae12e04a269592b52ae9c4800c3b5b05e06c349194b1ebca04f8bc8aec4334cb1e099535feaebb6'
            'dd06c06249bc9537555517d97a66dbaefcfcc27547a03abb3cf8bcb15edbda1f49cb03191dbebb8ad6737bdf46c1f25567636fa1c206b60a39d22ce41c506aaa')
b2sums=('8d327c0c6a64e18a0335cd8f0774c81247dbafe3f5794cc6bac6863e8f8d9e0fc268b9275729ad94d1c7ac9ea2533fccee24f7048adf41e6fe4ffdb64f6400e5'
        '87a499defdff3609cd0ee43d7b81def146d42194904946fa5cb376625423fecae6a6039637a66dfeece762670580be1d34439b9746e777c3a789d5e0971f5de7'
        'e08c3a2b9ac5313cdb688c8f80aa8f9b21e162986c28d658f2b64612824d0cecb418bd54383bff63d8ee5118856d997406a361a2251d03f52559f404bc435102'
        'd8e8bd10cbcc9efce77dff474f7c82eb9c8f264a77985cc155915fe577e90b94dd36cfea7a36a34e0279431d1d6d006e838e7166da913f9da426cead21096e96'
        'a50439972435dc8ed2277633bd5819c51bbf24af317b64210968e3415d0cdae23a333dc5bc912ed6ce1fb40c1cc27addf31a830a4a45ca63dd0ad28dfdb31209'
        'b20bd35ea57696deda29d1dfdebd9d15b9315471fafe0249b60b46b79251895b4db924982f0e6459d3d1d87bea831fefd23f02886fbdafb4d4d052e97382dc58'
        'a56604d3d29ebbf4fb807bfeec32a90fe5688bd516633f1990e11afd664ba730b941e522c393a21f85b8be2f10cfa08288f0884dc693bcc30b7cc12dc967a0a6')
install=$pkgname.install

prepare() {
  cd $_name-$pkgver
  # do not install tests: https://github.com/nextcloud/news-updater/pull/31
  patch -Np1 -i ../$pkgname-11.0.0-tests.patch
  # add support for better errors: https://github.com/nextcloud/news-updater/pull/34
  patch -Np1 -i ../$pkgname-11.0.0-better_errors.patch
  # add support for news >= 15.0.0: https://github.com/nextcloud/news-updater/pull/32
  patch -Np1 -i ../$pkgname-11.0.0-news15.patch
}

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  pytest -v
}

package() {
  cd $_name-$pkgver
  python setup.py install --optimize=1 --root="$pkgdir"
  # configuration
  install -vDm 644 ../$pkgname.ini -t "$pkgdir/etc/webapps/nextcloud/news/"
  # systemd service/timer
  install -vDm 644 ../$pkgname.{service,timer} -t "$pkgdir/usr/lib/systemd/system/"
  # docs
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
