# Maintainer: Selim Bucher <me@selim.one>
pkgname=ni-wine
pkgver=2.4.4
pkgrel=1
pkgdesc="Native Instruments software under Wine: setup, launch and product management"
# ships a 32-bit Windows DLL built in build(), so not arch-independent
arch=('x86_64')
url="https://github.com/selimbucher/native-instruments"
license=('MIT')
depends=('python' 'wine>=11' 'winetricks' 'cabextract' '7zip' 'msitools'
         'procps-ng' 'xorg-server-xvfb' 'zenity' 'xdg-utils'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
             'mingw-w64-gcc')
checkdepends=('python-pytest')
optdepends=('wine-staging: recommended Wine build for Native Instruments'
            'xdotool: repositions off-screen windows on X11 desktops'
            'yad: nicer-looking setup progress dialog')
# pinned to the release commit: GitHub's archive tarballs are not byte-stable
# (v2.1.3's was regenerated in Aug 2026 with a different sha256)
_commit=e8bc3c4d733bded38d14e5cc7f6601c56c568b36
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  # the Kontakt installer msi shim (shim/README.md), built here, no binary shipped
  make -C shim CC=i686-w64-mingw32-gcc
  cp shim/msi_shim32.dll src/ni_wine/data/msi_shim32.dll
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  python -m pytest
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 src/ni_wine/data/native-access.desktop \
    "$pkgdir/usr/share/applications/native-access.desktop"
  install -Dm644 src/ni_wine/data/native-access.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/native-access.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
