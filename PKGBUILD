# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgbase=subtitles-contact-sheet-qt-git
pkgname=(
  subtitles-contact-sheet-qt-cli-git
  subtitles-contact-sheet-qt-gui-git
)
_pkgname=subtitles_contact_sheet_qt
pkgver=1.11.1.g154fd6b
pkgrel=1
pkgdesc="Create subtitles/video contact sheets, previews, small animations, screenshots and thumbnails"
arch=('x86_64')
url='https://vongoob9.gitlab.io/subtitles_contact_sheet_qt'
license=('GPL-3.0-only')
depends=('qt5-base' 'ffmpeg')
makedepends=('git' 'pandoc-cli')

source=(
  "git+https://gitlab.com/vongooB9/${_pkgname}.git"
  '0001-qmake-man-icon-paths.patch'
)
b2sums=(
  'SKIP'
  '756b53acf98289a88dfd6cd10b8df2810a508f67ca3f8c51211b6502ce7e232b1874cfee06a53539b9557740b8fc5a90ce9b9c76d9c9aac6d19aa42f017d97cb'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i ../0001-qmake-man-icon-paths.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  qmake USR_DIR=/usr MAN_DIR=/share/man/man1
  make

  ( cd SCSGUI && qmake USR_DIR=/usr ICONS_DIR=/share/icons/hicolor/scalable/apps && make )
}

package_subtitles-contact-sheet-qt-cli-git() {
  pkgdesc+=' (CLI)'

  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}

package_subtitles-contact-sheet-qt-gui-git() {
  pkgdesc+=' (Qt GUI)'

  cd "${srcdir}/${_pkgname}/SCSGUI"
  make INSTALL_ROOT="${pkgdir}" install
}
