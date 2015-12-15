# Maintainer: Sebastien Duthil <duthils@free.fr>

pkgname=rimworld
pkgver=0.12.914
pkgrel=1
pkgdesc="A sci-fi colony simulation game driven by an intelligent AI storyteller."
arch=('i686' 'x86_64')
url="http://rimworldgame.com/"
license=('custom: commercial')
depends=('glu' 'lib32-gtk2' 'gcc-libs-multilib')
makedepends=('unzip')
source=(rimworld.desktop
        rimworld.sh
        LICENSE)
sha256sums=('e83c514731904722d96218e82e257467d7af32d938493bb5908cf96c7699cae6'
            '2cf317e27b0d0414cc0a9dbde784edd5e8f06ab1c71715a869e4578e7febffd3'
            'ef210c499f47f0076204227da65110e0f2fe3316b5ae03478c21941a07e513e0')
if test "$CARCH" == i686; then
  _rimworld_arch=x86
elif test "$CARCH" == x86_64; then
  _rimworld_arch=x86_64
fi
_gamepkg=RimWorldAlpha12dLinux.zip
_pkgpaths_tries=("$startdir"
                 "$HOME/Downloads")

build() {
  msg "You need a full copy of this game in order to install it"

  # look for game zipfile
  for pkgpath_try in "${_pkgpaths_tries[@]}" ; do
    msg "Searching for ${_gamepkg} in dir: \"${pkgpath_try}\""
    if [[ -f "${pkgpath_try}/${_gamepkg}" ]]; then
      pkgpath=${pkgpath_try}
      break
    fi
  done

  # not found: ask for path to game zipfile
  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
    error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
        error "Unable to find game package."
        return 1
    fi
  fi

  # unpack game zipfile
  msg "Found game package, unpacking..."
  unzip "${pkgpath}/${_gamepkg}" -d "${srcdir}"
}

package() {
  cd "$srcdir"/RimWorld*Linux

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/rimworld"
  install -d "${pkgdir}/usr/share/licenses/rimworld"

  install -m755 "$srcdir/rimworld.sh" "$pkgdir/usr/bin/rimworld"
  install -m755 RimWorld*Linux.${_rimworld_arch} "$pkgdir/usr/share/rimworld/rimworld"
  cp -r RimWorld*Linux_Data "$pkgdir/usr/share/rimworld/Data"
  cp -r Mods Source "$pkgdir/usr/share/rimworld"
  install -m644 Readme.txt Version.txt "$pkgdir/usr/share/rimworld"
  install -m644 "${srcdir}/rimworld.desktop" "${pkgdir}/usr/share/applications/rimworld.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/rimworld/LICENSE"
}
