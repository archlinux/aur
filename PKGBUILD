# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=bauh-staging
pkgver=0.10.6.RC
pkgrel=8
_commit="6efa763236635afaaba87a8ad50fbe37026f4ded"
pkgdesc="Graphical interface for managing your applications (AppImage, Flatpak, Snap, Arch/AUR, Web). Testing branch (it may not be working properly)."
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pyqt5' 'python-pyqt5-sip' 'python-requests' 'python-colorama' 'python-pyaml' 'qt5-svg' 'python-dateutil' 'python-packaging')
optdepends=('flatpak: required for Flatpak support' 
            'snapd: required for Snap support'
            'python-beautifulsoup4: for Native Web applications support'
            'python-lxml: for Native Web applications support'
            'sqlite3: required for AppImage support'
            'wget: required for AppImage and AUR support'
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
makedepends=('python-build' 'python-installer' 'python-wheel')
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('bd4a0f20d830923e5f59609ba10ca3c4531e1294eb987eca88d071a7e2788b3195f43536677a399f80a46406b7dfc0fdcd420cb976f116e30249028427ee73fa')

build() {
  cd "${srcdir}/bauh-${_commit}"

  # removing outdated setup files
  rm setup.cfg setup.py requirements.txt

  python -m unittest discover -s tests -t tests -v || return 1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/bauh-${_commit}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps

  cp bauh/view/resources/img/logo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/bauh.svg
 
  mkdir -p $pkgdir/usr/share/applications
  mv bauh/desktop/bauh.desktop $pkgdir/usr/share/applications/
  mv bauh/desktop/bauh_tray.desktop $pkgdir/usr/share/applications/

  mkdir -p $pkgdir/etc/bauh/
  echo "debian" > $pkgdir/etc/bauh/gems.forbidden
}
