# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: JakobDev<jakobdev at gmx dot de>
pkgname=jddesktopentryedit
_app_id=page.codeberg.JakobDev.jdDesktopEntryEdit
pkgver=1.8
pkgrel=2
pkgdesc="A graphical program to create and edit desktop entries"
arch=('any')
url="https://codeberg.org/JakobDev/jdDesktopEntryEdit"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python-desktop-entry-lib'
  'python-pyqt6'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'qt6-tools'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('b096fa2cea881f994c9e385fa68e6a64e505fa328661a8c05d68b91d9233c686')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "deploy/${_app_id}.metainfo.xml"
  desktop-file-validate "deploy/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  python install-unix-datafiles.py --prefix "$pkgdir/usr"
}
