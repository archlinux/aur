# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Maximilian Berger <snowdragon92[at]gmail.com>
pkgname=cvdrone-git
pkgver=1.0.0
pkgrel=1
pkgdesc="AR Drone 2.0 SDK written in C++ and QT"
arch=('x86_64')
url="https://burntbunch.org:1337/burntbunch/cutedrone"
license=('LGPLv2')
groups=('devel')
depends=('qt5-base'
         'opencv')
makedepends=('git')
provides=('cvdrone')
source=('cvdrone.sh'
        'cvdrone.desktop')

sha256sums=('1eda5ee428da03335df8dda0a6558cfa1773bb2e1374e9b61a3df969b97ddff7'
            'cba54d0a4cd30975321b50397f0a9593156789034136cb634d8e23759796c264')

_gitroot='https://burntbunch.org:1337/burntbunch/cutedrone.git'
_gitname='cutedrone'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git -c http.sslVerify=false pull origin
    msg "The local files are updated."
  else
    git -c http.sslVerify=false clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git -c http.sslVerify=false clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  qmake -makefile -unix CuteDrone.pro
  msg "qmake done"
  make
  msg "make done"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d "${pkgdir}/usr/share/cvdrone"
  install -Dm755 "CvDrone" "${pkgdir}/usr/share/cvdrone"

  install -Dm755 "${srcdir}/cvdrone.sh" "${pkgdir}/usr/bin/cvdrone"

  install -Dm644 "${srcdir}/cvdrone.desktop" "${pkgdir}/usr/share/applications/cvdrone.desktop"
}

# vim:set ts=2 sw=2 et:
