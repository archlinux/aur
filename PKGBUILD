# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.7.0
pkgrel=1
pkgdesc="Graphical interface to manage Flatpak, Snaps and AUR packages"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: for Flatpak support' 
            'snapd: for Snap support' 
            'pacman: for AUR support' 
            'wget: for AUR and AppImage support' 
            'sqlite3: for AppImage support'
            'git: to downgrade AUR packages ( optional )'
            'aria2: faster AppImages and AUR source downloads ( optional )'
            'ccache: can improve AUR packages compilation speed ( optional )' 
            'breeze: for KDE Plasma main theme be available ( optional )')
makedepends=('git' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('06be2073ffc3e0b1f12913e2489461c66f82cf5f1ce364ef456c14d07cd06c7791c8b66f5ad8a59ba0c1b78fa457701c14910e0763859d8caf92e4f19bab3baf')

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
