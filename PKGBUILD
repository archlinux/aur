# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh-staging
pkgver=0.6.3.RC
pkgrel=1
_commit="ad7d2c67ed3cbd219c8216ab758bf9e1098d0889"
pkgdesc="Free graphical interface to manage Flatpak, Snaps and AUR applications / packages (staging: it is a testing branch which receives updates frequently and may not be working properly)"
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
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('770f68aa552fbff3b8bb3d88e86c776b8a546debe1b8cd7e83d093bf57d53b1322b3cd3d3a9719c2d5e549ccd9d7f4b2fa17df029eeee529177fe3b761b9f104')

build() {
  cd "${srcdir}/bauh-${_commit}"
  python3 setup.py build
  python3 setup.py test || return 1
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
