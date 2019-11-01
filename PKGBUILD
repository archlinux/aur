# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.7.2
pkgrel=1
pkgdesc="Graphical interface to manage Flatpaks, Snaps, AppImages and AUR packages"
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
sha512sums=('46e1e99118c6c2a05d47cb9321e5d2f8a1854a5723e6fdb833693fb96fe82cef57beed620e62bae5a9456fa1d34a0826b9389ff1e632fe91bf33fcbbd40bce7c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py test || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  
  mkdir -p $pkgdir/usr/share/icons/hicolor

  python3 aur/copy_icons.py aur/icons $pkgdir/usr/share/icons/hicolor
 
  mkdir -p $pkgdir/usr/share/applications
  mv aur/bauh.desktop $pkgdir/usr/share/applications/
  mv aur/bauh_tray.desktop $pkgdir/usr/share/applications/
  
  mkdir -p $pkgdir/usr/local/bin
  chmod +x aur/bauh-tray
  mv aur/bauh-tray $pkgdir/usr/local/bin/
}
