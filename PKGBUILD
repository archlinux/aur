# Maintainer: Kim DaeHyun <kernalix7@kodenet.io>
#
# This PKGBUILD is a template. The __PKGVER__ / __SHA256__ placeholders are
# stamped by .github/workflows/aur-publish.yml on tag push (v*.*.*) before
# the file is pushed to ssh://aur@aur.archlinux.org/winpodx.git. Do not hand-
# edit the placeholders in-tree.

pkgname=winpodx
pkgver=0.5.3
pkgrel=1
pkgdesc="Windows app integration for Linux desktop (Podman/FreeRDP RemoteApp)"
arch=('any')
url="https://github.com/Kernalix7/winpodx"
license=('MIT')
# Arch's `python` is rolling and already >= 3.13, so tomllib is stdlib and
# the tomli fallback is a no-op here (marker-gated in pyproject.toml).
depends=(
  'python'
  'freerdp'
)
optdepends=(
  'podman: default container backend'
  'docker: alternative container backend'
  'libvirt: VM backend'
  'pyside6: Qt6 GUI and system tray'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kernalix7/winpodx/archive/v$pkgver.tar.gz")
sha256sums=('fb77f02f37ded51718a75c5b417245e6c0a4d6a697e2abf342daa16d8c6efa0b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 data/winpodx.desktop \
    "$pkgdir/usr/share/applications/winpodx.desktop"
  install -Dm644 data/winpodx-icon.svg \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/winpodx.svg"
  install -Dm644 data/winpodx.toml.example \
    "$pkgdir/usr/share/winpodx/winpodx.toml.example"
}
