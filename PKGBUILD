# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jddesktopentryedit
_app_id=page.codeberg.JakobDev.jdDesktopEntryEdit
pkgver=1.4
pkgrel=1
pkgdesc="A graphical program to create and edit desktop entries"
arch=('any')
url="https://codeberg.org/JakobDev/jdDesktopEntryEdit"
license=('GPL-3.0-or-later')
depends=('python-desktop-entry-lib' 'python-pyqt6' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel' 'qt5-tools')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ef14f679e4352888618c24c88e1c354b17c519013c1c1b6603a32e3ac70bb042')

prepare() {
  rm -rf "$pkgname-$pkgver"
  mv "$pkgname" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  appstream-util validate-relax --nonet "deploy/$_app_id.metainfo.xml"
  desktop-file-validate "deploy/$_app_id.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  python install-unix-datafiles.py --prefix "${pkgdir}/usr"
}
