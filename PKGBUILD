# Maintainer: Selim Bucher <me@selim.one>
pkgname=ni-wine
pkgver=2.2.0
pkgrel=1
pkgdesc="Native Instruments software under Wine — setup, launch, and product management"
# The package ships a 32-bit Windows DLL (built from source in build()),
# so it is no longer arch-independent.
arch=('x86_64')
url="https://github.com/selimbucher/native-instruments"
license=('MIT')
depends=('python' 'wine' 'winetricks' 'cabextract' '7zip' 'msitools'
         'procps-ng' 'xorg-server-xvfb' 'zenity' 'xdg-utils'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
             'mingw-w64-gcc')
optdepends=('wine-staging: recommended Wine build for Native Instruments'
            'xdotool: repositions off-screen windows on X11 desktops'
            'yad: nicer-looking setup progress dialog')
# Pinned upstream commit for this release. GitHub's auto-generated archive tarballs are
# not byte-stable (the v2.1.3 tarball was regenerated with a different
# compression envelope in Aug 2026, breaking the recorded sha256), so we fetch
# via git and pin the commit hash instead.
_commit=b66d8152171f55692bad3cc98e4109c3ec87e73b
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  # The msi shim (shim/README.md): a forwarding msi.dll for the Kontakt
  # installer, cross-compiled here rather than shipped as a binary.
  make -C shim CC=i686-w64-mingw32-gcc
  cp shim/msi_shim32.dll src/ni_wine/data/msi_shim32.dll
  python -m build --wheel --no-isolation
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
