# Maintainer: HLFH <gaspard@dhautefeuille.eu>

_name=news-updater
_pkgname=nextcloud-news-updater
pkgname=nextcloud-news-updater-git
pkgver=11.0.0.r15.g4603ee1
pkgrel=2
pkgdesc="A parallel feed updater for the Nextcloud News app"
arch=(any)
url="https://github.com/nextcloud/news-updater"
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
optdepends=('nextcloud-app-news: for updating a local instance of the Nextcloud News app')
conflicts=('nextcloud-news-updater')
source=(
  $_pkgname::git+https://github.com/nextcloud/$_name
  $_pkgname.service
  $_pkgname.timer
)
b2sums=('SKIP'
        '7fc5816ee39f6cd6890a3c43a47ba4c85f6944a2f418ee73cef0738286094f78a5941be6fd1c720a19bd36905f44a7739babc93992dac7efdc890a2734a6daca'
        'a56604d3d29ebbf4fb807bfeec32a90fe5688bd516633f1990e11afd664ba730b941e522c393a21f85b8be2f10cfa08288f0884dc693bcc30b7cc12dc967a0a6')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  python setup.py build
}

check() {
  cd $_pkgname
  pytest -v
}

package() {
  cd $_pkgname
  python setup.py install --optimize=1 --root="$pkgdir"
  # systemd service/timer
  install -vDm 644 ../$_pkgname.{service,timer} -t "$pkgdir/usr/lib/systemd/system/"
  # docs
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$_pkgname/"
}
