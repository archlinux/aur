# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=nagstamon
_pkgver='3.3.20190208'
pkgname=nagstamon-beta
pkgver='3.3.0.20190208'
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos' 'python-lxml' 'python-dbus')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files/unstable/${_pkgname}-${_pkgver}.fedora29-1.src.rpm"
)
md5sums=(
        'aa083b69857ea1f6f894ee5488ab5bc9'
)
sha256sums=(
        '1680d78e09a9e0177443a3d5abc112b4b50a9947408c4e4e97aa88323d21775c'
)

prepare() {
  cd "$srcdir/"
  tar -xzf "$_pkgname-$_pkgver.fedora29.tar.gz"
}

package() {
  cd "${srcdir}/$_pkgname-$_pkgver.fedora29"
  # setup.py imports AppInfo from Nagstamon.Config which leads to a import of keyring
  # importing keyring fails in a fakeroot environment, which seems to be somehow related to a the keyring connection init triggered by the import
  # to avoid the issue setup.py is rewritten here to resolve the need for the AppInfo import
  name=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "NAME " | sed -e "s/^[\t ]*NAME = '//" -e "s/'$//")
  version=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "VERSION " | sed -e "s/^[\t ]*VERSION = '//" -e "s/'$//")
  sed -i setup.py -e "s/from Nagstamon.Config import AppInfo//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/"
  sed -i Nagstamon/setup.py -e "s/from Nagstamon.Config import AppInfo//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

