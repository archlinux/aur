# Maintainer: Sebastien Duthil <duthils@duthils.net>

_pkg_subver=2618  # see ${srcdir}/Version.txt
_gamepkg=RimWorld1-1-${_pkg_subver}Linux.zip

pkgname=rimworld
pkgver=1.1.${_pkg_subver}
pkgrel=2
pkgdesc="A sci-fi colony simulation game driven by an intelligent AI storyteller."
arch=('i686' 'x86_64')
url="http://rimworldgame.com/"
license=('custom: commercial')
depends=('glu' 'libxcursor')
makedepends=('unzip')
source=(rimworld.desktop
        rimworld.sh)
sha256sums=('2cae10532b040e6766daf8fc33ecbd123ce2085acb921e30e57216da573879ce'
            '7f46d32b4ebb3e442b471797005cde6a1fdb7d923d1b7860dee6a9b1779248bf')

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
  unzip -UU -u "${pkgpath}/${_gamepkg}" -d "${srcdir}"
}

package() {
  cd "$srcdir"
  install -Dm755 "rimworld.sh" "$pkgdir/usr/bin/rimworld"
  install -Dm644 "rimworld.desktop" "${pkgdir}/usr/share/applications/rimworld.desktop"

  cd "$srcdir/RimWorld1-1-${_pkg_subver}Linux"
  install -dm755 "$pkgdir/opt/rimworld"
  cp -r * "$pkgdir/opt/rimworld"
  chmod 755 "$pkgdir/opt/rimworld/RimWorldLinux"
  chgrp games "$pkgdir/opt/rimworld/Mods"
  chmod g+w "$pkgdir/opt/rimworld/Mods"

  # remove non-ascii characters in filename causing warnings
  for file in "$pkgdir/opt/rimworld/Data/Core/Languages/"*.tar ; do
    mv "$file" "${file/ */}.tar"
  done

  install -Dm644 -t "${pkgdir}/usr/share/licenses/rimworld" EULA.txt Licenses.txt
}
