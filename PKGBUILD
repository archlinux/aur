# Maintainer: Deepanshu Sharwan <deepanshusharwan35@gmail.com>
pkgname=peppy
pkgver=3.2.0
pkgrel=1
pkgdesc="A lightweight application launcher for Wayland and X11 (latest git version)"
arch=('any')
url="https://github.com/deepanshusharwan/peppy"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-requests' 'python-gobject' 'hicolor-icon-theme')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
        git describe --tags --long \
            | head -n1 \
            | sed 's/^v//;s/-/./g;s/:/./g'
}


build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install launcher script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/peppy" <<EOF
#!/usr/bin/env python3
import main
EOF

    # Install icon
    install -Dm644 peppy.svg "$pkgdir/usr/share/icons/hicolor/64x64/apps/peppy.svg"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/peppy.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Peppy
GenericName=Application Launcher
Comment=A fast, lightweight launcher
Exec=peppy
Icon=peppy
Terminal=false
Categories=Utility;System;
EOF
}


