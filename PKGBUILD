# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=nagstamon
_pkgver='3.3.20191010'
pkgname=nagstamon-beta
pkgver='3.3.0.20191010'
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos' 'python-lxml' 'python-dbus')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files/unstable/${_pkgname}-${_pkgver}.fedora30-1.src.rpm"
)
md5sums=(
        '9332508c5fa4ef5937701be565ab00f6'
)
sha256sums=(
        'ee94473892ab05ee289b9a5d027bb4e5913b48a0add30de41d1d2b8abb49abb6'
)

prepare() {
  cd "$srcdir/"
  tar -xzf "$_pkgname-$_pkgver.fedora30.tar.gz"
}

package() {
  cd "${srcdir}/$_pkgname-$_pkgver.fedora30"
  # setup.py imports AppInfo from Nagstamon.Config which leads to a import of keyring
  # importing keyring fails in a fakeroot environment, which seems to be somehow related to a the keyring connection init triggered by the import
  # to avoid the issue setup.py is rewritten here to resolve the need for the AppInfo import
  name=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "NAME " | sed -e "s/^[\t ]*NAME = '//" -e "s/'$//")
  version=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "VERSION " | sed -e "s/^[\t ]*VERSION = '//" -e "s/'$//")
  sed -i setup.py -e "s/from Nagstamon.Config import AppInfo//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/"
  sed -i Nagstamon/setup.py -e "s/from Nagstamon.Config import AppInfo//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

