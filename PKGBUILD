# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.7.5
pkgrel=1
pkgdesc="Graphical interface for applications management ( AppImage, Flatpak, Snap and AUR )"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: required for Flatpak support' 
            'snapd: required for Snap support' 
            'sqlite3: required for AppImage support'
            'wget: required for AppImage and AUR support'
            'fuse2: may be required for AppImage support'
            'fuse3: may be required for AppImage support'
            'pacman: required for AUR support'             
            'binutils: required for AUR support'
            'git: to allow AUR packages downgrading'            
            'autoconf: may be required to compile some AUR packages'
            'automake: may be required to compile some AUR packages'
            'bison: may be required to compile some AUR packages'
            'fakeroot: may be required to compile some AUR packages'
            'flex: may be required to compile some AUR packages'
            'gcc: may be required to compile some AUR packages'
            'm4: may be required to compile some AUR packages'
            'lib32-fakeroot: may be required to compile some AUR packages'
            'make: may be required to compile some AUR packages'
            'patch: may be required to compile some AUR packages'
            'pkgconf: may be required to compile some AUR packages'            
            'ccache: can improve AUR packages compilation speed' 
            'aria2: faster AppImages and AUR source downloads'
            'breeze: for KDE Plasma main theme be available')
makedepends=('git' 'python' 'python-pip' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('9f48f90ed2462051cd9d30a7d8be44bb5e87a260b0f1a795adefb5ad331fde16f4d6fc49bd195c84caba1f53ce6597f8fbe6ed0c55fbaaa8fb08be9b12e3bf64')

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
