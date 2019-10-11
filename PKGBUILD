# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.6.3
pkgrel=1
pkgdesc="Graphical interface to manage Flatpak, Snaps and AUR applications"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: for Flatpak support' 
            'snapd: for Snap support' 
            'pacman: for AUR support' 
            'wget: for AUR support' 
            'git: to downgrade AUR packages ( optional )'
            'aria2: faster AUR source downloads ( optional )'
            'ccache: can improve AUR packages compilation speed ( optional )' 
            'breeze: for KDE Plasma main theme be available ( optional )')
makedepends=('git' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('2a2cc0b81e41b818a71cce08b6dbfb7c8befa6ef6587ed4723ad062d12fc5547fb8816f9d6ec8152b57729b85258436599f3891aeba8b5839309e5282759d724')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py test || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/local/bin

  mv bauh.desktop $pkgdir/usr/share/applications/
  mv bauh_tray.desktop $pkgdir/usr/share/applications/
  
  chmod +x bauh-tray
  mv bauh-tray $pkgdir/usr/local/bin/
}
