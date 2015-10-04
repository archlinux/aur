_pkgname=obozrenie
pkgname=$_pkgname-git
pkgver=r190.c1ac450
pkgrel=1
pkgdesc='Simple and easy to use game server browser'
arch=('any')
url='http://github.com/obozrenie'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'gvfs' 'python-gobject'
         'python-pytoml' 'python-xdg' 'gtk3' 'python-beautifulsoup4'
         'python-xmltodict' 'qstat')
makedepends=('git' 'python-babel' 'python-setuptools')
optdepends=('python-pygeoip: for geolocation support'
            'geoip-database: for geolocation support')
provides=('obozrenie')
conflicts=('obozrenie')
install='obozrenie.install'
source=('git+https://github.com/obozrenie/obozrenie.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname

  python setup.py install --root="${pkgdir}" --optimize='1'
  python setup.py compile_catalog -D io.obozrenie -d locale

  SRCPO=$(find | grep io.obozrenie.po)
  rm $SRCPO
  chmod -R 755 locale

  install -Dm755 obozrenie-gtk ${pkgdir}/usr/bin/obozrenie-gtk
  cp -r locale ${pkgdir}/usr/share/locale/
}
