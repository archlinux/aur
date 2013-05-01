# Maintainer: Jon Gjengset <jon@tsp.io>
# Based on PKGBUILD for oilrush
# Repository here: https://github.com/Jonhoo/gamedevtycoon-PKGBUILD
pkgname=game-dev-tycoon
pkgver=1.3.1
pkgrel=5
pkgdesc="a business simulation game where you start a video game development company"
arch=('i686' 'x86_64')
makedepends=('unzip')
depends=('mesa' 'node-webkit')
provides=()
options=(!strip)
PKGEXT=".pkg.tar" # Because we don't want to have to recompress the binary
license=("commercial")
url="http://www.greenheartgames.com/app/game-dev-tycoon/"
_gamepkg="game-dev-tycoon.tar.gz"
_gamemd5="ec2dd3534744545f54689e8611c13e1a"
source=('game-dev-tycoon' 'game-dev-tycoon.desktop')
md5sums=('cc2ad6406868368ced023ab7f307505f'
         'b846906a3d1b9820dbc2c68c3c748db9')

build() {
  cd ${srcdir}

  msg "You need a full copy of this game in order to install it"
  msg "Download the .tar.gz version of the game and give its path below"
  msg "Searching for \"${_gamepkg}\" in dir: $(readlink -f ${startdir})"
  pkgpath="${startdir}/${_gamepkg}"

  if [[ ! ( -f "${startdir}/${_gamepkg}" ) ]]; then
    error "Game file not found, please type path to game setup package:"
    read pkgpath
    if [[ ! ( "${pkgpath:0:1}" == "/" ) ]]; then
      pkgpath="${startdir}/${pkgpath}"
    fi
    if [[ ! ( -f "${pkgpath}" ) ]] ; then
       error "Unable to find game file." && return 1
    fi
  fi

  if [[ ! (`md5sum ${pkgpath} | cut -f1 -d' '` == "${_gamemd5}") ]]; then
    error "Game file seems to be a different version, problems may occur!"
  fi
  msg "Found game file, installing..."

  msg2 "Extracting archive"
  ln -fs "${pkgpath}" .
  tar zxf "$(basename "$pkgpath")"

  msg2 "Extracting game files"
  rm -rf app.nw
  unzip -qq gamedevtycoon -d app.nw && true

  msg2 "Cleaning game directory"
  cp "app.nw/package.png" "launcher.png"
  rm gamedevtycoon nw
}

package() {
  cd "${srcdir}"
  install -d ${pkgdir}/opt/greenheartgames/${pkgname}

  msg2 "copy game files"
  cp -R ${srcdir}/{app.nw,launcher.png,nw.pak,libffmpegsumo.so} ${pkgdir}/opt/greenheartgames/${pkgname}/

  # Install Launcher
  msg2 "install launcher to /usr/bin"
  install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # Install Desktop
  msg2 "add .desktop file"
  install -D -m644 ${srcdir}/${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
