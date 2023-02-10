# Maintainer: ghostbuster <ghost_buster+aur@posteo.de>
_pkgname=Nagstamon
pkgname=nagstamon
pkgver=3.10.1
pkgrel=2
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt6' 'qt6-multimedia' 'qt6-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos' 'python-lxml' 'python-dbus' 'python-dateutil' 'python-pysocks')
optdepends=('python-requests-gssapi: Will be used instead of python-requests-kerberos for kerberos auth if present')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
makedepends=('python-setuptools')
source=(
        "https://github.com/HenriWahl/Nagstamon/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
        '2de11f91bf5f9de96d9a1232360129349aa5b4483a668125b38ce3837346742f'
)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  # setup.py imports AppInfo from Nagstamon.Config which leads to a import of keyring
  # importing keyring fails in a fakeroot environment, which seems to be somehow related to a the keyring connection init triggered by the import
  # to avoid the issue setup.py is rewritten here to resolve the need for the AppInfo import
  name=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "NAME " | sed -e "s/^[\t ]*NAME = '//" -e "s/'$//")
  version=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "VERSION " | sed -e "s/^[\t ]*VERSION = '//" -e "s/'$//")
  sed -i setup.py -e "s/from Nagstamon.Config import AppInfo.*//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/" -e "s/  *OS$/OS = 'Linux'/" -e "s/ + '.' + DIST + DIST_VERSION$//"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv "$pkgdir/usr/bin/nagstamon.py" "$pkgdir/usr/bin/nagstamon"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
