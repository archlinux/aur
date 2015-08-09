# Maintainer: Milan Oberkirch <aur@oberkirch.org>
pkgname=qgroundcontrol-git
pkgver=2.5.0
pkgrel=1
pkgdesc="Micro air vehicle ground control station."
arch=('any')
url="http://qgroundcontrol.org/"
license=('GPL3')
depends=(\
  'espeak'  # optional but you have to decide if you want it at built-time\
  'qt5-svg' 'qt5-graphicaleffects' 'qt5-webkit' 'phonon-qt4' 'qt5-serialport'\
  'qt5-quickcontrols')
makedepends=('git')
md5sums=()  # generate with 'makepkg -g'

_gitroot="https://github.com/mavlink/qgroundcontrol.git"
_gitname=qgroundcontrol

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  ## Un-comment the following line to get the stable version:
  # git checkout Stable_V2.5

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  git submodule init && git submodule update
  qmake qgroundcontrol.pro
  make
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -R "$srcdir/$_gitname-build/release" "${pkgdir}/opt/qgroundcontrol"
  cat <<EndOfFile > "${pkgdir}/usr/bin/qgroundcontrol"
#!/bin/bash
cd /opt/qgroundcontrol/
exec ./qgroundcontrol $*
EndOfFile
  chmod +x "${pkgdir}/usr/bin/qgroundcontrol"
}

# vim:set ts=2 sw=2 et:
