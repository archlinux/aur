# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=vorta
pkgver=0.7.1
pkgrel=6
pkgdesc="A GUI for BorgBackup"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
depends=('borg' 'python-appdirs' 'python-apscheduler' 'python-pyqt5' 'python-peewee' 'python-paramiko' 'python-dateutil' 'python-secretstorage' 'python-psutil' 'python-llfuse' 'python-setuptools')
makedepends=('qt5-tools')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/borgbase/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/borgbase/vorta/commit/9af1eb5ba648fed97260a6d3ca2aa7221cd1fb74.diff")
sha256sums=('2b9ec44daf1929b7fa7f359619324332daa25774562a1d71123c505b9b5006a7'
            '4854149163b334c6a604a888cc31f6688be8c9ed5855021491657f88c92f39d7')

build() {

  cd "$pkgname-$pkgver"
  make translations-to-qm
  patch -p1 < "$srcdir/9af1eb5ba648fed97260a6d3ca2aa7221cd1fb74.diff"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 package/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.borgbase.Vorta.svg"
  install -Dm644 package/icon-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.borgbase.Vorta-symbolic.svg"
  install -Dm644 "src/$pkgname/assets/metadata/com.borgbase.Vorta.appdata.xml" -t \
    "$pkgdir/usr/share/metainfo"
  install -Dm644 "src/$pkgname/assets/metadata/com.borgbase.Vorta.desktop" -t \
    "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
