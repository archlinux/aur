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
sha256sums=('34f9fdb00df9dc54e2edfab308ebb3e1fc1d0cca5e7156fe821d80c624fd5639')

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
