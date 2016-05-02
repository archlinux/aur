# Maintainer: Leonard König <leonard.r.koenig at googlemail dot com>
pkgname='endless-sky-git'
_gitname='endless-sky'
pkgver=0.9.0.r21.g7c74390
pkgrel=1
arch=('i686' 'x86_64')
url="http://endless-sky.github.io/"
# libpng and libgl are already fetched by sdl2
# xdg-utils for icon cache
depends=('sdl2' 'libjpeg-turbo' 'glew' 'openal' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git' 'scons')
license=('GPL3' 'CCPL' 'custom:public domain')
pkgdesc="A space exploration and combat game similar to Escape Velocity"
install=${_gitname}.install
source=("${_gitname}::git+https://github.com/endless-sky/endless-sky.git#branch=master"
        "${_gitname}.install")

md5sums=('SKIP'
         '35480c7b8a09c11ddce957f9e279637c')
#
# PKGEXT='.pkg.tar'
#

pkgver() {
	cd "$_gitname"
  # cut off the 'v'
  git describe --long --tags| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd $_gitname
	scons
  # gzip manpage
  gzip -f endless-sky.6
}


package() {
	cd $_gitname
	# Install executables
	install -D --mode=755 endless-sky ${pkgdir}/usr/bin/endless-sky

  # resources
  ## They explicitly want this path. Although one could workaround with '-r' param
  install --directory ${pkgdir}/usr/share/games/${_gitname}
  cp -rf data images sounds ${pkgdir}/usr/share/games/${_gitname}/
  install -D --mode=644 credits.txt ${pkgdir}/usr/share/games/${_gitname}/credits.txt
  install -D --mode=644 keys.txt ${pkgdir}/usr/share/games/${_gitname}/keys.txt

  # icons and .desktop
  _idir=endless-sky.iconset
  _iddir=${pkgdir}/usr/share/icons/hicolor

  install -D --mode=644 $_idir/icon_16x16.png ${_iddir}/16x16/apps/${_gitname}.png
  install -D --mode=644 $_idir/icon_22x22.png ${_iddir}/22x22/apps/${_gitname}.png
  install -D --mode=644 $_idir/icon_24x24.png ${_iddir}/24x24/apps/${_gitname}.png
  install -D --mode=644 $_idir/icon_32x32.png ${_iddir}/32x32/apps/${_gitname}.png
  install -D --mode=644 $_idir/icon_48x48.png ${_iddir}/48x48/apps/${_gitname}.png
  install -D --mode=644 $_idir/icon_256x256.png ${_iddir}/256x256/apps/${_gitname}.png
  install -D --mode=644 endless-sky.desktop ${pkgdir}/usr/share/applications/${_gitname}.desktop

  # manpage
  install -D --mode=644 endless-sky.6.gz ${pkgdir}/usr/share/man/man6/${_gitname}.6.gz

  # copyright
  install -D --mode=644 copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}

# vim:set ts=2 sw=2 et:
