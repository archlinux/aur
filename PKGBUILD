# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=jddesktopentryedit
_app_id=page.codeberg.JakobDev.jdDesktopEntryEdit
pkgver=1.0
pkgrel=1
pkgdesc="A graphical program to create and edit desktop entries"
arch=('any')
url="https://codeberg.org/JakobDev/jdDesktopEntryEdit"
license=('GPL3')
depends=('python-desktop-entry-lib' 'python-pyqt6' 'python-requests')
makedepends=('pyside6' 'python-build' 'python-installer' 'python-setuptools'
             'python-wheel' 'qt5-tools')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b3a44ab87b3acf3ab4df7c775bdac9ab80ba69ff1da1a05c5fe4d025a235cb52')

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

  install -Dm644 "deploy/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "deploy/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 jdDesktopEntryEdit/Icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_app_id.png"
}
