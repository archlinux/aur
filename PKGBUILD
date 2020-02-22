pkgname=paperwork-git
_pkgname=paperwork
pkgver=1.3.1+18+g980b0421
pkgrel=1
pkgdesc="Personal document manager for GNOME to manage scanned documents and PDFs"
arch=(any)
url="https://openpaper.work/"
license=(GPL3)
depends=('gtk3' 'libinsane' 'libnotify' 'poppler-glib' 'python-cairo' 'python-dateutil' 'python-distro'
         'python-gobject' 'python-levenshtein' 'python-natsort' 'python-pillowfight' 'python-pycountry'
         'python-pydbus' 'python-pyenchant' 'python-pyocr' 'python-setuptools' 'python-simplebayes'
         'python-termcolor' 'python-whoosh' 'python-xdg')
makedepends=('git')
provides=('paperwork')
conflicts=('paperwork')
source=("git+https://gitlab.gnome.org/World/OpenPaperwork/paperwork.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname/paperwork-backend
  python3 setup.py install --root="$pkgdir" --optimize=1

  cd ../paperwork-gtk
  python3 setup.py install --root="$pkgdir" --optimize=1

  cd "$pkgdir"/usr/lib/python3.8/site-packages/paperwork/frontend/
  PYTHONPATH=`echo "$pkgdir"/usr/lib/python*/site-packages/` python3 -c 'import shell; shell.install_system(icon_basedir="../../../../../share/icons", data_basedir="../../../../../share")'
}
