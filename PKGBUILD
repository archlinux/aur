# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
_pkgname=acousticbrainz-gui
pkgname=$_pkgname-git
pkgver=r21.1b839cb
pkgver(){
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Submit audio features to the AcousticBrainz project.'
arch=('any')
url='http://acousticbrainz.org/'
license=('GPL2')
depends=('qt4' 'qjson' 'essentia-acousticbrainz')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/MTG/${_pkgname}.git"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
md5sums=('SKIP'
         'e36726d348e1859eae26323d7f3cc223'
         '63ab9d6ffeda180688d1ad8f2f0559d8')

build() {
  cd "$_pkgname"

  msg2 'Build acousticbrainz-gui binary.'
  cmake -DCMAKE_BUILD_TYPE=Release .
  make

  msg2 'Rename icons.'
  cd images/
  rename 'acoustid-fp' 'acousticbrainz-gui' *.*
  mv acoustid-fingerprinter.svg acousticbrainz-gui.svg
}

package() {
  cd "$_pkgname"

  msg2 'Install acousticbrainz-gui binary.'
  install -D acousticbrainz-gui "$pkgdir/usr/bin/acousticbrainz-gui.bin"
  install -D "../${_pkgname}.sh" "$pkgdir/usr/bin/acousticbrainz-gui"

  msg2 'Install desktop file.'
  install -D "../${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  msg2 'Install icons.'
  install -d "$pkgdir/usr/share/pixmaps/"
  install -t "$pkgdir/usr/share/pixmaps/" images/*

  msg2 'Make symlink to the extractor.'
  install -d "$pkgdir/usr/bin/extractor"
  cd "$pkgdir/usr/bin/extractor"
  ln -s ../streaming_extractor_music
}

# vim:set ts=2 sw=2 et:
