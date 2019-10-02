# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh-staging
pkgver=0.6.2.RC
pkgrel=1
_commit="b073ab0c8a145ac8b98d3bdce71360caf39cc3dd"
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
sha512sums=('d58c1881ca1c21d71caf34ce17c2e7b642df2b811d0ad13c18e4dff8b14deff0fbc6498cd0ef0d13b1f3582c61169a9c5c113f580b8453f58baf50507f26efa4')

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
