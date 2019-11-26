# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh-staging
pkgver=0.7.3.RC
pkgrel=2
_commit="d88d3043317c073b5abcfacd22e53c8640f9a1b4"
pkgdesc="Graphical interface for applications management ( AppImage, Flatpak, Snap and AUR ) (staging is a testing branch which receives updates frequently and may not be working properly)"
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
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('a8160079d9ebd6e9c3f826e3f9dc20fe6e1cabccd7bef94f5bcfb76200446bc55bf484849bb955e5fd5ba668b108a3730b873e8ff665ab54209723db5b008275')

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
