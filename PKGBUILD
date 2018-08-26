# Maintainer: Eric Langlois <eric@langlois.xyz>

pkgname=spacechem-hib
_installname=spacechem
pkgver=1345144627
pkgrel=1
pkgdesc="A design-based puzzle game from Zachtronics Industries. Humble Bundle version."
license=('custom')
arch=('x86_64')
url="http://www.zachtronics.com/spacechem/"
depends=('sdl' 'sdl_image' 'sdl_mixer' 'mono' 'xclip')
optdepends=('lib32-glibc: Recording runs via rgb2theora')
provides=('spacechem')
conflicts=('spacechem' 'gog-spacechem')
PKGEXT=".pkg.tar"
_gamepkg="${_installname}-linux-${pkgver}-amd64.deb"

# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("${_gamepkg}"::"hib://${_gamepkg}"
        "${pkgname}.desktop"
        "${pkgname}.patch")
md5sums=('c08fb05e1909c0b4ccae82a862da6e3a'
         '9a436b55222c47c0c03060de4043d8a1'
         'ba3ced2decc0fce6d6cf609f7cd44713')

_src_opt_dir="opt/zachtronicsindustries/${_installname}"
prepare() {
  echo "extracting data.tar.gz"
  tar -xzf data.tar.gz
  patch -Np0 -i ${pkgname}.patch

  # Use our own desktop file so this one is unnecessary.
  rm "${_src_opt_dir}/zachtronicsindustries-spacechem.desktop"

  # For reasons I don't fully understand, removing this stops the game from
  # crashing. Hypothesis:
  #   The game expects Mono 2 but Arch uses 4, and Mono.Security.dll is built in
  #   to Mono 4. Using this old instance of the dll causes problems.
  rm "${_src_opt_dir}/Mono.Security.dll"

  chmod a-x "${_src_opt_dir}/icon.png"
}

package() {
  install -dm755 "${pkgdir}/opt/${_installname}"
  _abs_src_opt_dir="${srcdir}/${_src_opt_dir}"

  cp -r "${_abs_src_opt_dir}/"* "${pkgdir}/opt/${_installname}/"

  install -Dm644 "${_abs_src_opt_dir}/icon.png" "${pkgdir}/usr/share/pixmaps/${_installname}.png"

  install -dm755 "${pkgdir}/usr/share/licenses/${_installname}"
  cp -r "${_abs_src_opt_dir}/readme/"* "${pkgdir}/usr/share/licenses/${_installname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_installname}/spacechem-launcher.sh" "${pkgdir}/usr/bin/${_installname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_installname}.desktop"
}
