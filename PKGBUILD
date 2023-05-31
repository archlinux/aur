# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=4.2.1
pkgrel=3
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL2')
depends=('git' 'hicolor-icon-theme' 'python-numpy' 'python-polib' 'python-pyqt5'
         'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-jaraco.packaging'
             'python-rst.linker' 'python-setuptools-scm' 'python-sphinx'
             'python-wheel')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('python-pygments: syntax highlighting'
            'python-send2trash: enables "Send to Trash" functionality.'
            'tcl: to use the built-in ssh-askpass handler')
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz"
        '0001-Unvendorize-polib.py.patch')
sha256sums=('400fed3bac785f7d6c513b19d6a795953367029510ac5dc8b4320864d75cbbac'
            '00db8356a4bc6f1d9dade64ab04b6f8bada2df22b246e21551ce925de9f95625')

prepare() {
  cd "$pkgname-$pkgver"

  # Remove vendorized polib.py
  patch -Np1 -i ../0001-Unvendorize-polib.py.patch
  rm cola/polib.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation

  make prefix=/usr man
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate share/applications/*.desktop
  appstream-util validate-relax --nonet share/metainfo/*.appdata.xml
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  make prefix=/usr DESTDIR="$pkgdir" install-man
}
