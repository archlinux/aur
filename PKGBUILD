# Maintainer: Sebastien Duthil <duthils@free.fr>

pkgname=factorio
pkgver=0.11.22
pkgrel=3
pkgdesc="A 2D game about building and maintaining factories."
arch=('i686' 'x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio-demo')
depends=('libxcursor' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
source=(factorio.desktop
        LICENSE)
md5sums=('5cacd198a3156c157a482aeab368e9a1'
         '22fce67d66c080fa5c89ab437b3d8724')
if test "$CARCH" == i686; then
  __factorio_arch=i386
elif test "$CARCH" == x86_64; then
  __factorio_arch=x64
fi
_gamepkg=factorio_alpha_${__factorio_arch}_$pkgver.tar.gz
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

  install -m755 "bin/${__factorio_arch}/factorio" "$pkgdir/usr/bin/factorio"
  cp -r data/* "$pkgdir/usr/share/factorio"
  install -m644 "${srcdir}/factorio.desktop" "${pkgdir}/usr/share/applications/factorio.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio/LICENSE"
}
