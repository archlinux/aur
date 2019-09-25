# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.6.0
pkgrel=2
_commit="dae9befefcd7c22598be718f09c0ecc2b6970141"
pkgdesc="Free graphical interface to manage Flatpak, Snaps and AUR applications / packages"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: for Flatpak support' 
            'snapd: for Snap support' 
            'pacman: for AUR support' 
            'wget: for AUR support' 
            'git: to downgrade AUR packages ( optional )'
            'aria2c: faster AUR source downloads ( optional )'
            'ccache: can improve AUR packages compilation speed ( optional )' 
            'breeze: for KDE Plasma main theme be available ( optional )')
makedepends=('git' 'python-setuptools')
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('93ef993fd77ed67d4cbad80c50706f0a6d4e8221dded24016c18ff6dd13bc1ec538db481a9d82fdfded531eaa8c789eeebd9574819a3da8743d02fd319b1d0a1')

build() {
  cd "${srcdir}/bauh-${_commit}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/bauh-${_commit}"
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
