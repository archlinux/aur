# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jddesktopentryedit
_app_id=page.codeberg.JakobDev.jdDesktopEntryEdit
pkgver=1.2
pkgrel=2
pkgdesc="A graphical program to create and edit desktop entries"
arch=('any')
url="https://codeberg.org/JakobDev/jdDesktopEntryEdit"
license=('GPL3')
depends=('python-desktop-entry-lib' 'python-pyqt6' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel' 'qt5-tools')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0c949570a05632f17772eb7bcea3f711909964e718b593f61c47a5b44d3b33f0')

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
