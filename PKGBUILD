# Maintainer:Magillos <kerown at gmail com>

pkgname=cable
pkgver=0.9.8.1
pkgrel=1
pkgdesc="A PyQt6 application to dynamically modify Pipewire and Wireplumber settings"
arch=('any')
url="https://github.com/magillos/Cable"
license=('GPL-3.0')
depends=('python' 'python-pyqt6' 'python-jack-client' 'jack_delay' 'python-requests' 'python-pyalsaaudio' 'python-packaging')
makedepends=('python-setuptools')
if [ -n "${USE_LOCAL}" ]; then
  source=("${USE_LOCAL_PATH:-./Cable-$pkgver.tar.gz}")
  sha256sums=('SKIP')
else
  source=("cable-$pkgver.tar.gz::https://github.com/magillos/Cable/archive/refs/tags/$pkgver.tar.gz")
  sha256sums=('733e2c1c21e13245f507b166dd63fab8db97f33722841f8bae2ca4f7288e2f47')
fi

build() {
  cd "$srcdir/Cable-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Cable-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # Install the icon
  install -Dm644 "jack-plug.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/jack-plug.svg"

  # Install the desktop entry
  install -Dm644 "com.github.magillos.cable.desktop" "$pkgdir/usr/share/applications/com.github.magillos.cable.desktop"

  # Create the /usr/share/cable directory if it doesn't exist
  install -d "$pkgdir/usr/share/cable"

  # Install connection-manager.py and Cable.py to /usr/share/cable
  install -D "connection-manager.py" "$pkgdir/usr/share/cable/connection-manager.py"
  install -D "Cable.py" "$pkgdir/usr/share/cable/Cable.py"

  # Install the entire cables directory
  cp -r cables "$pkgdir/usr/share/cable/"
  cp -r cable_core "$pkgdir/usr/share/cable/"
  cp -r graph "$pkgdir/usr/share/cable/"

  # Ensure files have the correct permissions
  find "$pkgdir/usr/share/cable" -type f -exec chmod 644 {} \;
  find "$pkgdir/usr/share/cable" -type d -exec chmod 755 {} \;
}
