# Maintainer: Sebastien Duthil <duthils@free.fr>

pkgname=rimworld
pkgver=0.13.1135  # see ${srcdir}/Version.txt
pkgrel=6
pkgdesc="A sci-fi colony simulation game driven by an intelligent AI storyteller."
arch=('i686' 'x86_64')
url="http://rimworldgame.com/"
license=('custom: commercial')
depends=('glu' 'libxcursor')
makedepends=('unzip')
source=(rimworld.desktop
        rimworld.sh)
sha256sums=('e83c514731904722d96218e82e257467d7af32d938493bb5908cf96c7699cae6'
            '37be72d82b2cb853b435598ff1fabda03de3a660b9e69b95a03af6548f6dc4c4')
if test "$CARCH" == i686; then
  _rimworld_arch=x86
elif test "$CARCH" == x86_64; then
  _rimworld_arch=x86_64
fi
_gamepkg=RimWorldAlpha13Linux.zip
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
  unzip -u "${pkgpath}/${_gamepkg}" -d "${srcdir}"
}

package() {
  cd "$srcdir"/RimWorld*Linux

  install -Dm755 "$srcdir/rimworld.sh" "$pkgdir/usr/bin/rimworld"
  install -Dm755 RimWorld*Linux.${_rimworld_arch} "$pkgdir/opt/rimworld/rimworld"
  cp -r RimWorld*Linux_Data "$pkgdir/opt/rimworld/Data"
  cp -r Mods Source "$pkgdir/opt/rimworld"
  chgrp games "$pkgdir/opt/rimworld/Mods"
  chmod g+w "$pkgdir/opt/rimworld/Mods"
  install -Dm644 EULA.txt Readme.txt Version.txt "$pkgdir/opt/rimworld"
  install -Dm644 "${srcdir}/rimworld.desktop" "${pkgdir}/usr/share/applications/rimworld.desktop"
  install -Dm644 EULA.txt "${pkgdir}/usr/share/licenses/rimworld/LICENSE"
}
