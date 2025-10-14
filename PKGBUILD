# Maintainer:Magillos <kerown at gmail com>

pkgname=cable
pkgver=0.9.19
pkgrel=1
pkgdesc="A PyQt6 application to dynamically modify Pipewire and Wireplumber settings"
arch=('any')
url="https://github.com/magillos/Cable"
license=('GPL-3.0')
depends=('python' 'python-pyqt6' 'python-jack-client' 'jack_delay' 'python-requests' 'python-pyalsaaudio' 'python-packaging' 'aj-snapshot' 'pipewire-jack')
makedepends=('python-build' 'python-installer')

if [ -n "${USE_LOCAL}" ]; then
  source=("${USE_LOCAL_PATH:-./Cable-$pkgver.tar.gz}")
  sha256sums=('SKIP')
else
  source=("cable-$pkgver.tar.gz::https://github.com/magillos/Cable/archive/refs/tags/$pkgver.tar.gz")
  sha256sums=('9b2d8e48549ee27623fa5c23509828bb38a2717e403562e829238aa1dd804252')
fi

build() {
  cd "$srcdir/Cable-$pkgver"
  python -m build
}

package() {
  cd "$srcdir/Cable-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl


  install -Dm644 "jack-plug.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/jack-plug.svg"


  install -Dm644 "com.github.magillos.cable.desktop" "$pkgdir/usr/share/applications/com.github.magillos.cable.desktop"


  install -d "$pkgdir/usr/share/cable"


  install -D "connection-manager.py" "$pkgdir/usr/share/cable/connection-manager.py"
  install -D "Cable.py" "$pkgdir/usr/share/cable/Cable.py"


  cp -r cables "$pkgdir/usr/share/cable/"
  cp -r cable_core "$pkgdir/usr/share/cable/"
  cp -r graph "$pkgdir/usr/share/cable/"


  find "$pkgdir/usr/share/cable" -type f -exec chmod 644 {} \;
  find "$pkgdir/usr/share/cable" -type d -exec chmod 755 {} \;
}
