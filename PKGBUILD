# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=borg-backup-gui-git
pkgver=336.1bbdb50
pkgrel=1
pkgdesc="Borg BackUP GUI can be used by new Borg users to get to their destination very quickly."
url="https://github.com/MTrage/Borg-BackUP-GUI"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('borg' 'python-llfuse' 'qt5-base' 'wget')
makedepends=('git')
optdepends=('adwaita-icon-theme')

_gitname=Borg-BackUP-GUI
source=("git+https://github.com/MTrage/${_gitname}.git"
	'borg-backup-gui.desktop')
sha256sums=('SKIP'
	'725dd8dd8b4cc837546c27bb179b7f80bc42339f8859ccf2189a676a82ed5c87')

pkgver() {
  cd "${_gitname}/src"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/src"
  qmake
  make
}

package() {
  cd "${_gitname}/src"
  install -Dm755 "BORG-BackUP-GUI" "${pkgdir}/usr/bin/BORG-BackUP-GUI"
  install -D -m 644 ${srcdir}/borg-backup-gui.desktop ${pkgdir}/usr/share/applications/borg-backup-gui.desktop
  for icons in $(ls ../images/icons/); do
    echo ${icons}
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    cp ../images/icons/${icons}/BORG-BackUP-GUI.* "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/"
  done
}
