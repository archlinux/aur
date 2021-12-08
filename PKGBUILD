# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=vorta-git
_pkgname=vorta
pkgver=r582.17eb71a
pkgrel=1
pkgdesc="A GUI for BorgBackup (git)"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
provides=('vorta')
conflicts=('vorta')
depends=('borg' 'python-appdirs' 'python-pyqt5' 'python-peewee' 'python-paramiko' 'python-dateutil' 'python-secretstorage' 'python-psutil' 'python-llfuse' 'python-setuptools')
makedepends=('qt5-tools' 'python-pip' 'git')
options=(!emptydirs)
source=("$pkgname"::"git+https://github.com/borgbase/${_pkgname}")
sha256sums=('SKIP')
          
build() {
  cd "${srcdir}/${pkgname}"
  make translations-to-qm
  python setup.py build
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 package/icon-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.borgbase.Vorta-symbolic.svg"
  install -Dm644 "src/$_pkgname/assets/metadata/com.borgbase.Vorta.appdata.xml" -t \
    "$pkgdir/usr/share/metainfo"
  install -Dm644 "src/$_pkgname/assets/metadata/com.borgbase.Vorta.desktop" -t \
    "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
