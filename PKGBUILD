# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=jddesktopentryedit
_app_id=page.codeberg.JakobDev.jdDesktopEntryEdit
pkgver=1.6
pkgrel=1
pkgdesc="A graphical program to create and edit desktop entries"
arch=('any')
url="https://codeberg.org/JakobDev/jdDesktopEntryEdit"
license=('GPL-3.0-or-later')
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
checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('311984a28213ea353bed3cb8bf74c40a5fbbfabcac49b907a2b3fe109e6505f3')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  # fix typo
  sed -i 's/inlcude/include/g' MANIFEST.in
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
