# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.7.3
pkgrel=1
pkgdesc="Graphical interface for applications management ( AppImage, Flatpak, Snap and AUR )"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: for Flatpak support' 
            'snapd: for Snap support' 
            'pacman: for AUR support' 
            'wget: for AUR and AppImage support' 
            'sqlite3: for AppImage support'
            'git: to downgrade AUR packages'
            'aria2: faster AppImages and AUR source downloads'
            'ccache: can improve AUR packages compilation speed' 
            'breeze: for KDE Plasma main theme be available')
makedepends=('git' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('bb0644827a09158955b66928685314596e7c70e0957ac5122abfb5a7c988adde3f5230af8cec1756e12040b6c959c353dafee1d8cad7a92fbc0a60d3e4b7b4e8')

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
