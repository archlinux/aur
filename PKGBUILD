# Maintainer: Selim Bucher <me@selim.one>
pkgname=ni-wine
pkgver=2.1.3
pkgrel=2
pkgdesc="Native Instruments software under Wine — setup, launch, and product management"
arch=('any')
url="https://github.com/selimbucher/native-instruments"
license=('MIT')
depends=('python' 'wine' 'winetricks' 'cabextract' '7zip' 'msitools'
         'procps-ng' 'xorg-server-xvfb' 'xdotool' 'zenity' 'xdg-utils'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('wine-staging: recommended Wine build for Native Instruments'
            'firefox: automatic download-URL capture (any firefox- or chromium-family browser works)'
            'chromium: automatic download-URL capture (alternative to firefox)'
            'yad: nicer-looking setup progress dialog')
# Pinned commit of tag v$pkgver. GitHub's auto-generated archive tarballs are
# not byte-stable (the v2.1.3 tarball was regenerated with a different
# compression envelope in Aug 2026, breaking the recorded sha256), so we fetch
# via git and pin the commit hash instead.
_commit=8d11359a56527f80e8fd62a73148ba784b37f2b7
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
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
