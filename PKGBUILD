# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=nagstamon
_pkgver='3.1.20180523'
pkgname=nagstamon-beta
pkgver='3.1.0.20180523'
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos' 'python-lxml' 'python-dbus')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files/unstable/${_pkgname}-${_pkgver}.fedora27-1.src.rpm"
)
md5sums=(
        'dd14d78e4eb051547e5717180d0b8b2b'
)
sha256sums=(
        'ff16831729cc0cea128c8b6454643b9cb74cb21d9c189d1373580aec69c674ed'
)

prepare() {
  cd "$srcdir/"
  tar -xzf "$_pkgname-$_pkgver.fedora27.tar.gz"
}

package() {
  cd "${srcdir}/$_pkgname-$_pkgver.fedora27"
  # setup.py imports AppInfo from Nagstamon.Config which leads to a import of keyring
  # importing keyring fails in a fakeroot environment, which seems to be somehow related to a the keyring connection init triggered by the import
  # to avoid the issue setup.py is rewritten here to resolve the need for the AppInfo import
  name=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "NAME " | sed -e "s/^[\t ]*NAME = '//" -e "s/'$//")
  version=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "VERSION " | sed -e "s/^[\t ]*VERSION = '//" -e "s/'$//")
  sed -i setup.py -e "s/from Nagstamon.Config import AppInfo//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/"
  sed -i Nagstamon/setup.py -e "s/from Nagstamon.Config import AppInfo//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

