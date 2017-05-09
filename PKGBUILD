# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

_upstream=fusion-icon

pkgname=fusion-icon-git
epoch=1
pkgver=0.2.3.r4.g84e27a8
pkgrel=1
pkgdesc="Simple tray icon for Compiz 0.8"
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
conflicts=('fusion-icon0.9' 'fusion-icon')
provides=('fusion-icon')
depends=('compizconfig-python' 'hicolor-icon-theme' 'xorg-xvinfo' 'mesa-demos')

# presume that if compizconfig-python deps are met, it's against python2
_python="python"
_sitearch_check="from distutils import sysconfig; print(sysconfig.get_python_lib(plat_specific=1))"

# do we have a python2 compizconfig-python?
if [[ -f "$(python2 -c "${_sitearch_check}")/compizconfig.so" ]]; then
	_python=python2
fi

# Note to anyone who builds this: Make sure you install the appropriate
# dependencies for the user interfaces you want to use! Otherwise, it'll appear
# like it's not working!
# Also - change these to python2 if you're using Compiz 0.9.x
optdepends=(
	"${_python}-pyqt5: For the Qt Interface"
	"${_python}-gobject: For the GTK+ Interface"
	'libappindicator-gtk3: For the GTK+ Interface'
)

install="$pkgname.install"
source=("git+https://github.com/compiz-reloaded/${_upstream}")

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_upstream}"
  # Change to python2 if using Compiz 0.9.x
  "${_python}" ./setup.py build
}

package() {
  cd "${srcdir}/${_upstream}"
  # Change to python2 if using Compiz 0.9.x
  "${_python}" ./setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('SKIP')
