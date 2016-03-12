# Maintainer: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-headless
pkgver=0.12.26
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories - Server version"
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio' 'factorio-demo' 'factorio-experimental')
source=(LICENSE)
sha256sums=('67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21')
_gamepkg=factorio_headless_x64_$pkgver.tar.gz
_pkgpaths_tries=("$startdir"
                 "$HOME/Downloads")

build() {
  msg "You need a full copy of this game in order to install it"

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
  tar xzf "${pkgpath}/${_gamepkg}" -C "${srcdir}"
}

# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  cd "$srcdir/factorio"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/factorio"
  install -d "${pkgdir}/usr/share/licenses/factorio"

  install -m755 "bin/x64/factorio" "$pkgdir/usr/bin/factorio"
  cp -r data/* "$pkgdir/usr/share/factorio"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio/LICENSE"
}
