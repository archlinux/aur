# Maintainer: ghostbuster <ghost_buster+aur@posteo.de>
_pkgname=Nagstamon
pkgname=nagstamon
pkgver=3.16.2
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt6' 'qt6-multimedia' 'qt6-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos' 'python-lxml' 'python-dbus' 'python-dateutil' 'python-pysocks' 'python-arrow')
optdepends=('python-requests-gssapi: Will be used instead of python-requests-kerberos for kerberos auth if present')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
makedepends=('python-setuptools')
source=(
        "https://github.com/HenriWahl/Nagstamon/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
        '42e5ecd26b98d02bc424507b7a1321bdc406e0c072a77c92126afba81d5e9c49'
)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  # setup.py imports AppInfo from Nagstamon.Config which leads to a import of keyring
  # importing keyring fails in a fakeroot environment, which seems to be somehow related to a the keyring connection init triggered by the import
  # to avoid the issue setup.py is rewritten here to resolve the need for the AppInfo import
  name=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "NAME " | sed -e "s/^[\t ]*NAME = '//" -e "s/'$//")
  version=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "VERSION " | sed -e "s/^[\t ]*VERSION = '//" -e "s/'$//")
  sed -i setup.py -e "s/from Nagstamon.Config import AppInfo.*//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/" -e "s/  *OS$/OS = 'Linux'/"
  sed -i setup.py -e "s/from Nagstamon.Helpers import get_distro//" -e "s/get_distro()/('arch', '', 'Arch Linux')/"
  sed -i Nagstamon/QUI/qt.py -e "s/QT_VERSION_STR.split('.')/QT_VERSION_STR.split('.')[0:3]/"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv "$pkgdir/usr/bin/nagstamon.py" "$pkgdir/usr/bin/nagstamon"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
