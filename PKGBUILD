# Maintainer: Max Zhao <alcasa dot mz at gmail dot com>
# Contributor: Leonard König <leonard.r.koenig at googlemail dot com>

pkgname='endless-sky'
pkgver=0.9.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://endless-sky.github.io/"
# libpng and libgl are already fetched by sdl2
# xdg-utils for icon cache
depends=('sdl2' 'libjpeg-turbo' 'glew' 'openal' 'hicolor-icon-theme' 'xdg-utils' 'libmad')
makedepends=('git' 'scons')
license=('GPL3' 'CCPL' 'custom:public domain')
pkgdesc="A space exploration and combat game similar to Escape Velocity"
install=${pkgname}.install
source=(
"https://github.com/endless-sky/endless-sky/archive/v${pkgver}.tar.gz"
        "${pkgname}.install")

md5sums=('d786e59f0419449826afc87f78006fe7'
         '737bc185c599447d4eef7c215dabecc9')
#
# PKGEXT='.pkg.tar'
#

build() {
	cd $pkgname-$pkgver
	scons
  # gzip manpage
  gzip -f endless-sky.6
}


package() {
	cd $pkgname-$pkgver
	# Install executables
	install -D --mode=755 endless-sky ${pkgdir}/usr/bin/endless-sky

  # resources
  ## They explicitly want this path. Although one could workaround with '-r' param
  install --directory ${pkgdir}/usr/share/games/${pkgname}
  cp -rf data images sounds ${pkgdir}/usr/share/games/${pkgname}/
  install -D --mode=644 credits.txt ${pkgdir}/usr/share/games/${pkgname}/credits.txt
  install -D --mode=644 keys.txt ${pkgdir}/usr/share/games/${pkgname}/keys.txt

  # icons and .desktop
  _idir=endless-sky.iconset
  _iddir=${pkgdir}/usr/share/icons/hicolor

  install -D --mode=644 icons/icon_16x16.png ${_iddir}/16x16/apps/${pkgname}.png
  install -D --mode=644 icons/icon_22x22.png ${_iddir}/22x22/apps/${pkgname}.png
  install -D --mode=644 icons/icon_24x24.png ${_iddir}/24x24/apps/${pkgname}.png
  install -D --mode=644 icons/icon_32x32.png ${_iddir}/32x32/apps/${pkgname}.png
  install -D --mode=644 icons/icon_48x48.png ${_iddir}/48x48/apps/${pkgname}.png
  install -D --mode=644 icons/icon_256x256.png ${_iddir}/256x256/apps/${pkgname}.png
  install -D --mode=644 endless-sky.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # manpage
  install -D --mode=644 endless-sky.6.gz ${pkgdir}/usr/share/man/man6/${pkgname}.6.gz

  # copyright
  install -D --mode=644 copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}

# vim:set ts=2 sw=2 et:
