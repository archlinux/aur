# Maintainer: Sebastien Duthil <duthils@duthils.net>

_pkg_subver=3682
_gamepkg=RimWorldRoyalty1-4-${_pkg_subver}Linux.tar.gz

pkgname=rimworld-royalty
pkgver=1.4.${_pkg_subver}
pkgrel=1
pkgdesc="Expansion pack Royalty for the game Rimworld"
arch=('i686' 'x86_64')
url="http://rimworldgame.com/"
license=('custom: commercial')
depends=('rimworld')
makedepends=('tar')
source=()


_pkgpaths_tries=("$startdir"
                 "$HOME/Downloads")

build() {
  msg "You need a full copy of this game and its expansion in order to install it"

  # look for game tarball
  for pkgpath_try in "${_pkgpaths_tries[@]}" ; do
    msg "Searching for ${_gamepkg} in dir: \"${pkgpath_try}\""
    if [[ -f "${pkgpath_try}/${_gamepkg}" ]]; then
      pkgpath=${pkgpath_try}
      break
    fi
  done

  # not found: ask for path to game tarball
  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
    error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
        error "Unable to find game package."
        return 1
    fi
  fi

  # unpack game tarball
  msg "Found game package, unpacking..."
  tar -xf "${pkgpath}/${_gamepkg}" -C "${srcdir}"
}

package() {
  cd "$srcdir"

  cd "$srcdir/RimWorldRoyalty1-4-${_pkg_subver}Linux"
  install -dm755 "$pkgdir/opt/rimworld"
  cp -r Data "$pkgdir/opt/rimworld"

  # remove non-ascii characters in filename causing warnings
  for file in "$pkgdir/opt/rimworld/Data/Royalty/Languages/"*.tar ; do
    mv "$file" "${file/ */}.tar"
  done

  install -dm755 "$pkgdir/usr/share/licenses"
  ln -s "${pkgdir}/usr/share/licenses/rimworld" "${pkgdir}/usr/share/licenses/rimworld-royalty"
}
