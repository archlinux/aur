# Maintainer: AkiraYB <brunoyb!outlook,com>

pkgname=emacs-pov-mode
pkgver=v3.3
_pkgver=3.3
_imname=povray-imenu
_imver=3.6
pkgrel=1
pkgdesc='POV-Ray mode for Emacs'
arch=('any')
url='http://xahlee.org/3d/povray_emacs.html'
license=('GPL3')
depends=('emacs')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("http://www.imagico.de/imenu/${_imname}-${_imver}.tar.gz" 'git://gitorious.org/pov-mode/pov-mode.git')
noextract=("${_imname}-${_imver}.tar.gz")
sha256sums=('c99e00f3ba1de305b9859af43be4fbb4caf54426479461b9922dd7b2989c038b' 'SKIP')
_gitname=pov-mode

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --tags|sed 's/-/./g')
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -e '/pov-include-dir/ s|3.6|3.7|' \
      -e '/pov-include-dir/ s|/local||' \
      -e '/pov-documentation-directory/ s|3.6|3.7|' \
      -e '/pov-documentation-directory/ s|/local||' \
      -e '/pov-documentation-directory/ s|html|doc/html|' -i pov-mode.el
}

package() {
  cd "${srcdir}/${_gitname}"
  
  local _infodir="${pkgdir}/usr/share/info"
  local _installdir="${pkgdir}/usr/share/emacs/site-lisp/pov-mode"
  
  install -d "${_infodir}" "${_installdir}/InsertMenu"
  
  install -m 644 pov-mode.info "$_infodir"
  install -m 644 pov-mode.el povrender.xpm povview.xpm "$_installdir"
  
  bsdtar -xof "${srcdir}/${_imname}-${_imver}.tar.gz" \
	 -C "${_installdir}/InsertMenu"
}
