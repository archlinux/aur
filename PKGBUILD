# Maintainer: Vinicius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=bauh-staging
pkgver=0.6.0.RC
pkgrel=5
_commit="497b70181f0b09f801c217f4b697ec4f8ef4cd12"
pkgdesc="Free non-official GUI for Flatpak / Snap / AUR applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: to install Flatpaks' 
            'snapd: to install Snaps' 
            'pacman: to install AUR packages' 
            'wget: to install AUR packages' 
            'git: to downgrade AUR packages'
            'aria2c: faster AUR source downloads'
            'ccache: can improve AUR packages compilation speed' 
            'breeze: for KDE Plasma main theme be available')
makedepends=('git' 'python-setuptools')
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('5c3a2728d4918e5fdc8e154b29f563feee987e3bc691d3dde505c54505f3ddfa16a4a78dbe6db6e321a4f4a5ad247a1caedc4c05371d66c31416965e4bd1824e')

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
