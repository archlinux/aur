# Maintainer: Gradia <gradia@disroot.org>

pkgname=clonaut-git
pkgver=0.4.0.r0.g0000000
pkgrel=1
pkgdesc='Desktop GUI for rclone: remotes, transfers with progress, safety trash, dry runs and scheduled syncs'
arch=('any')
url='https://github.com/gradia64/Clonaut'
license=('GPL-3.0-only')
depends=('python' 'python-requests' 'python-pyqt6' 'rclone' 'hicolor-icon-theme')
provides=('clonaut')
conflicts=('clonaut')
optdepends=('pyside6: alternative Qt binding (used instead of PyQt6 when installed)')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

_appid=io.github.gradia64.Clonaut

pkgver() {
  cd "$pkgname"
  # es. v0.4.0-3-gabc1234 → 0.4.0.r3.gabc1234
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  # Qt senza schermo, binding del pacchetto, rclone vero di sistema
  QT_QPA_PLATFORM=offscreen CLONAUT_QT=pyqt6 \
    python -m pytest -q -p no:cacheprovider tests
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "packaging/$_appid.desktop" "$pkgdir/usr/share/applications/$_appid.desktop"
  install -Dm644 "packaging/$_appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$_appid.metainfo.xml"
  install -Dm644 "packaging/icons/$_appid.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid.svg"
  local size
  for size in 48 64 128 256; do
    install -Dm644 "packaging/icons/$_appid-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_appid.png"
  done

  sed "s/@VERSION@/${pkgver%%.r*}/" packaging/clonaut.1 | gzip -9n > clonaut.1.gz
  install -Dm644 clonaut.1.gz "$pkgdir/usr/share/man/man1/clonaut.1.gz"

  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/clonaut"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
