# Maintainer: Hammer <topo20@protonmail.com>

pkgname=texmacs-appimage
_appimage=TeXmacs.AppImage
_install_to=/opt/appimages/TeXmacs.AppImage
pkgver=170.1.glibc2.15
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG editor and CAS-interface."
arch=('x86_64')
url="http://www.texmacs.org/"
license=('GPL3')
depends=('texlive-core' 'python' 'libxext' 'freetype2' 'qt5-svg' 'hicolor-icon-theme' 'gawk')
optdepends=('transfig: convert images using fig2ps'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking')
_url="https://download.opensuse.org/repositories/home:/slowphil:/texmacs-devel/AppImage"
source=("${_appimage}::${_url}/texmacs-0-Build${pkgver}-x86_64.AppImage")
sha256sums=('e8586e35bfaffa58b86d9e96adc438411414e6646fad3578048a6cab65a8f465')
options=('!emptydirs' '!ccache' '!strip')
provides=('texmacs')
conflicts=('texmacs')

package() {
  chmod +x ${_appimage}

  echo Extracting icons, .desktop, man doc, mime info
  ./${_appimage} --appimage-extract "TeXmacs.xpm" > /dev/null 2>&1
  ./${_appimage} --appimage-extract "usr/share/TeXmacs/misc/mime/texmacs.desktop" > /dev/null 2>&1
  ./${_appimage} --appimage-extract "usr/share/man/man1/" > /dev/null 2>&1
  ./${_appimage} --appimage-extract "usr/share/TeXmacs/misc/mime/texmacs.xml" > /dev/null 2>&1

  echo Installing icons, .desktop, man doc, mime info
  install -Dm644 "squashfs-root/TeXmacs.xpm" "${pkgdir}/usr/share/pixmaps/TeXmacs.xpm"
  install -Dm644 "squashfs-root/usr/share/TeXmacs/misc/mime/texmacs.desktop" "${pkgdir}/usr/share/applications/texmacs.desktop"
  install -dm755 "squashfs-root/usr/share/man/man1/" "${pkgdir}/usr/share/man/man1/"
  install -Dm644 "squashfs-root/usr/share/TeXmacs/misc/mime/texmacs.xml" "${pkgdir}/usr/share/mime/packages/texmacs.xml"

  echo Installing AppImage file
  install -Dm755 "${_appimage}" "${pkgdir}/${_install_to}"
  mkdir "${pkgdir}/usr/bin"
  chmod 755 "${pkgdir}/usr/bin"
  ln -s "${_install_to}" "${pkgdir}/usr/bin/texmacs"
}
