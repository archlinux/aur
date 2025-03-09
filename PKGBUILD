# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=jddesktopentryedit
_app_id=page.codeberg.JakobDev.jdDesktopEntryEdit
pkgver=1.5
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'lrelease.patch')
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('ab75e16d9dc01b41faa05bb393c031436764578481cb0524c2a1354cdf50b7de'
            '7fb40d8ff93d6ca8ec30faf92b98301805ec5266b1190d3f9330c236c379c1a7')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  # use qt6-tools lrelease
  patch -Np1 -i ../lrelease.patch
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
