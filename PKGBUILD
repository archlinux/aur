# Maintainer: Jon Gjengset <jon@tsp.io>
# Based on PKGBUILD for oilrush
# Repository here: https://github.com/Jonhoo/gamedevtycoon-PKGBUILD
# Changelog here: http://www.greenheartgames.com/game-dev-tycoon-changelog/
pkgname=game-dev-tycoon
pkgver=1.3.9
pkgrel=1
pkgdesc="a business simulation game where you start a video game development company"
arch=('i686' 'x86_64')
makedepends=('unzip')
depends=('mesa' 'node-webkit')
provides=()
options=(!strip)
PKGEXT=".pkg.tar" # Because we don't want to recompress everything
                  # Compressing takes time and only saves about 6MB anyway
license=("commercial")
url="http://www.greenheartgames.com/app/game-dev-tycoon/"
_gamepkg="gamedevtycoon-${pkgver}-i386-x64.tar.gz"
_gamerel="1"
_gamemd5="73dfe05e66958774cc765c64854558f8"
source=('game-dev-tycoon' 'game-dev-tycoon.desktop')
md5sums=('ae28f2cd5480964f05cf5699f3f1693c'
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

  msg2 "Fishing out ${CARCH} version"
  # not that it matters considering we're using the source directly...
  if [[ $CARCH == "x86_64" ]]; then
    tar xzf "gamedevtycoon-${pkgver}-${_gamerel}-x64.tar.gz"
    cd "gamedevtycoon-${pkgver}-${_gamerel}-x64"
  else
    tar xzf "gamedevtycoon-${pkgver}-${_gamerel}-i386.tar.gz"
    cd "gamedevtycoon-${pkgver}-${_gamerel}-i386"
  fi

  msg2 "Extracting game files"
  if [[ -e ../app.nw ]]; then
    rm -rf ../app.nw
  fi
  unzip -qq gamedevtycoon-bin -d ../app.nw && true

  # package.png is prettier than icon.png (transparent background)
  mv ../app.nw/package.png ../launcher.png
}

package() {
  cd "${srcdir}"
  install -d ${pkgdir}/opt/greenheartgames/${pkgname}

  msg2 "Copy game files"
  cp -R ${srcdir}/{app.nw,launcher.png} ${pkgdir}/opt/greenheartgames/${pkgname}/

  # Install Launcher
  msg2 "Install launcher to /usr/bin"
  install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # Install Desktop
  msg2 "Add .desktop file"
  install -D -m644 ${srcdir}/${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
