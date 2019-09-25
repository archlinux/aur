# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh-staging
pkgver=0.6.0.RC
pkgrel=7
_commit="230d5751e2aff29dca0316c5b7519530fe225078"
pkgdesc="Free non-official graphical interface to manage Flatpak, Snaps and AUR applications / packages (staging: it is a testing branch which receives updates frequently and may not be working properly)"
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
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('2474f40537e077bb2d8773bcdf597660ed0454293d94a4fd6eeb0fc9fca46089105259e734fdb4709a2c73d019b51bb26f16514fbdddf0e09215bda8d1f531c0')

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
