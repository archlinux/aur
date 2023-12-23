# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh
pkgver=0.10.6
pkgrel=1
pkgdesc="Graphical interface for managing your applications (AppImage, Flatpak, Snap, Arch/AUR, Web)"
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pyqt5' 'python-pyqt5-sip' 'python-requests' 'python-colorama' 'python-pyaml' 'qt5-svg' 'python-dateutil')
optdepends=('flatpak: required for Flatpak support' 
            'snapd: required for Snap support'
            'python-beautifulsoup4: for Native Web applications support'
            'python-lxml: for Native Web applications support'
            'sqlite3: required for AppImage support'
            'fuse2: may be required for AppImage support'
            'fuse3: may be required for AppImage support'
            'pacman: required for AUR support'             
            'binutils: required for AUR support'
            'git: required for AUR support'
            'rebuild-detector: enables rebuild checking for AUR packages (optional)'            
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
            'aria2: multi-threaded downloading support'
            'breeze: KDE Plasma main theme'
            'axel: multi-threaded downloading support'
            'shadow: to install AUR packages as the root user'
            'util-linux: to install AUR packages as the root user')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('0eb0bd836848e4688aa69d5cfbc911d0fe95e0afcf972d8a2b86213ede4a9ce400c0c9d1a97c9e58639baf274498944f2f36af9d576832e4df8093ccab48299f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # removing outdated setup files
  rm setup.cfg setup.py requirements.txt

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps

  cp bauh/view/resources/img/logo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/bauh.svg
 
  mkdir -p $pkgdir/usr/share/applications
  mv bauh/desktop/bauh.desktop $pkgdir/usr/share/applications/
  mv bauh/desktop/bauh_tray.desktop $pkgdir/usr/share/applications/

  mkdir -p $pkgdir/etc/bauh/
  echo "debian" > $pkgdir/etc/bauh/gems.forbidden
}
