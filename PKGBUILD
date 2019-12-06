# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh-staging
pkgver=0.7.4.RC
pkgrel=1
_commit="fab88cb995b7cdc46815f46a3d4699c34fdefbe3"
pkgdesc="Graphical interface for applications management ( AppImage, Flatpak, Snap and AUR ) (staging is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak: required for Flatpak support' 
            'snapd: required for Snap support' 
            'sqlite3: required for AppImage support'
            'wget: required for AppImage and AUR support'
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
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('6c074542de156d33fe59cb28c3fcd51993c6b49910708929c7c20fec0bb1614cfcfa4c08cecddf3d0100289a43d2377141f630f7100825904a9fb58dfebd7d28')

build() {
  cd "${srcdir}/bauh-${_commit}"
  python3 setup.py build
  python3 setup.py test || return 1
}

package() {
  cd "${srcdir}/bauh-${_commit}"  
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
