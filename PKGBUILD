# Maintainer: ghostbuster <aur@sieverdingbeck.com>
# Contributor: Vyacheslav Artemiev <artemiev.vyacheslav a gmail d com>
_pkgname=Nagstamon
pkgname=nagstamon-beta
pkgver=3.7.20210408.r2190.a2dd499

_pkgname=nagstamon
pkgname=$_pkgname-git
pkgver=3.7.20210408.r2190.a2dd499
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos' 'python-lxml' 'python-dbus' 'python-dateutil')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL2')
makedepends=('git' 'python-setuptools')
optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=(repo::git+https://github.com/HenriWahl/Nagstamon.git)
md5sums=('SKIP')

#pkgver() {
#  cd "${srcdir}/${_pkgname}"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

pkgver() {
  cd "$srcdir/repo"
  printf "%s.r%s.%s" "$(grep -e "VERSION\s=" Nagstamon/Config.py | sed -e "s/\s*VERSION\s*=\s*'//" -e "s/'\\s*$//" -e 's/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/repo"
  # setup.py imports AppInfo from Nagstamon.Config which leads to a import of keyring
  # importing keyring fails in a fakeroot environment, which seems to be somehow related to a the keyring connection init triggered by the import
  # to avoid the issue setup.py is rewritten here to resolve the need for the AppInfo import
  name=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "NAME " | sed -e "s/^[\t ]*NAME = '//" -e "s/'$//")
  version=$(sed '0,/class AppInfo/d' Nagstamon/Config.py  | grep "VERSION " | sed -e "s/^[\t ]*VERSION = '//" -e "s/'$//")
  sed -i setup.py -e "s/from Nagstamon.Config import AppInfo//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/"
  sed -i Nagstamon/setup.py -e "s/from Nagstamon.Config import AppInfo//" -e "s/AppInfo.NAME/'${name}'/" -e "s/AppInfo.VERSION/'${version}'/"
  sed -i setup.py -e "s/from Nagstamon.Helpers import get_distro//"
  sed -i setup.py -e "s/get_distro()/('arch', '', 'Arch Linux')/"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv $pkgdir/usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
