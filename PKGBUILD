# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jddesktopentryedit
_app_id=page.codeberg.JakobDev.jdDesktopEntryEdit
pkgver=1.1
pkgrel=1
pkgdesc="A graphical program to create and edit desktop entries"
arch=('any')
url="https://codeberg.org/JakobDev/jdDesktopEntryEdit"
license=('GPL3')
depends=('python-desktop-entry-lib' 'python-pyqt6' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel' 'qt5-tools' 'gettext')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c67fe26e2fdd39b6a82d7df1601b5f1e59995caa134f84919bee4abc71ea6086')

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
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
