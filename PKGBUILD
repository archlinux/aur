# Maintainer: f0x <aur at cthu dot lu>

pkgname=hikari-darcs
pkgver=1.0.2.20200412091748
pkgrel=1
epoch=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://hikari.acmelabs.space'
license=('BSD-2-Clause')
arch=('x86_64')
makedepends=('darcs' 'bmake' 'pandoc')
depends=('wlroots' 'cairo' 'pango' 'xorg-server-xwayland' 'libucl-git')
provides=('hikari')
conflicts=('hikari')
source=()

_darcsmod="hikari"
_darcstrunk="https://hub.darcs.net/raichoo"

pkgver(){
  cd ${srcdir}/$_darcsmod
  lastver=$(darcs show tags | head -n1)
  timestamp=$(darcs log -n 1 --xml-output | grep -oP "(?<=date=')\d+")
  echo $lastver.$timestamp
}

build(){
  cd ${srcdir}
  if [[ -d ${srcdir}/$_darcsmod/_darcs ]]
  then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --set-scripts-executable $_darcstrunk/$_darcsmod
    cd $_darcsmod
  fi
  bmake WITH_POSIX_C_SOURCE=YES WITH_XWAYLAND=YES WITH_SCREENCOPY=YES WITH_GAMMACONTROL=YES WITH_LAYERSHELL=YES
}

package() {
  cd "$srcdir/$_darcsmod"
  bmake PREFIX="${pkgdir}"/usr ETC_PREFIX="${pkgdir}"/etc install
}

