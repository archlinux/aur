# Maintainer: M0Rf30

pkgname=atraci
pkgver=0.7.0
pkgrel=2
pkgdesc="Free music streaming player"
arch=('i686' 'x86_64')
url="http://getatraci.net/"
license=('GPL3')
depends=('nodejs' 'libnotify')
makedepends=('git' 'nodejs-grunt-cli' 'ruby-compass')
optdepends=('node-webkit: Allows you to skip downloading node-webkit')
conflicts=('atraci-git' 'atraci-bin')
provides=("atraci")
options=('!strip')
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_packagename=Atraci-${pkgver}
_DEST="/usr/share/atraci"

source=(https://github.com/Atraci/Atraci/archive/$pkgver.tar.gz
        "atraci.desktop")

prepare() {
  cd ${srcdir}/${_packagename}

  # Get dependencies
  npm install
  npm install coffeelint
  sed -i 's/dl.node-webkit.org/dl.nwjs.io/g' node_modules/node-webkit-builder/lib/index.js
: << 'COMMENT'
  # Copy local node-webkit (will be used if grunt wants the same version)
  if [ -d /usr/lib/node-webkit/ ]
  then
    _nwver=$(pacman -Q node-webkit | cut -d" " -f 2 | cut -d- -f1)
    install -d "${srcdir}/${_gitname}/cache/${_nwver}/${_platform}/"
    install /usr/lib/node-webkit/* "${srcdir}/${_gitname}/cache/${_nwver}/${_platform}/"
  fi
COMMENT
}

build() {
  cd ${srcdir}/${_packagename}

  # Build
  grunt build

  # Thanks to Revelation60 for pointing it out
  # https://github.com/rogerwang/node-webkit/wiki/The-solution-of-lacking-libudev.so.0
  msg2 "Patching node-webkit to fix libudev.so.0 problem"
  cd "${srcdir}/${_packagename}/build/Atraci/${_platform}/"
  sed -i 's/\x75\x64\x65\x76\x2E\x73\x6F\x2E\x30/\x75\x64\x65\x76\x2E\x73\x6F\x2E\x31/g' Atraci
}

package() {
  cd "${srcdir}/${_packagename}/build/Atraci/${_platform}/"

  # Program
  msg2 "Installing program to ${_DEST}"
  install -dm755 "${pkgdir}${_DEST}"
  install -m755 "Atraci" "${pkgdir}${_DEST}"
  install -m644 "nw.pak" "${pkgdir}${_DEST}"
  install -m644 "libffmpegsumo.so" "${pkgdir}${_DEST}"
  install -m644 "icudtl.dat" "${pkgdir}${_DEST}"

  # Link to program
  msg2 "Symlink /usr/bin/${provides[0]} -> ${_DEST}/Atraci"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "${_DEST}/Atraci" "${pkgdir}/usr/bin/${provides[0]}"

  # Desktop file
  install -Dm644 "${srcdir}/atraci.desktop" "${pkgdir}/usr/share/applications/atraci.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_packagename}/images/icon.png" "${pkgdir}/usr/share/pixmaps/atraci.png"
}

md5sums=('168d94d2f47a768a4ddc14fe69fcd1ad'
         'acf4beaa9c9af13179c691cdc7b730f5')
