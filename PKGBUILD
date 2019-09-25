# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh-staging
pkgver=0.6.0.RC
pkgrel=6
_commit="e95a523566f2c3439bc766f6992378cf23cf1c88"
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
sha512sums=('96457dc8b815c598003d8aba2b5f92f8c31a7853c91b73bf305da9047e73c3cbef2da35dd286051af85489cb8942d798f434fb95ac5e760ae1babbe8eff1eb4a')

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
