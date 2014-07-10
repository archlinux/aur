# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=penumbra-overture-hib
pkgver=1.1
pkgrel=2
pkgdesc="A first person adventure/survival horror game"
url='http://www.penumbragame.com/'
license=('custom')
arch=('i686' 'x86_64')
groups=("games")
_purgelibs=('libGLU.so' 'libSDL' 'libjpeg.so' 'libogg.so' 'libopenal.so' 'libpng' 'libstdc++.so'
            'libvorbis' 'libCg' 'libalut')
if [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-sdl_ttf' 'lib32-glu' 'lib32-freealut' 'lib32-nvidia-cg-toolkit' 'lib32-libxft'
           'lib32-sdl_image' 'lib32-libpng12' 'lib32-libvorbis')
else
  depends=('sdl_ttf' 'glu' 'freealut' 'nvidia-cg-toolkit' 'libxft' 'sdl_image' 'libpng12'
           'libvorbis')
fi
makedepends=('xz' 'desktop-file-utils')
# changelog="${pkgname}.changelog"
install="${pkgname}.install"
_archivename="penumbra_overture_${pkgver}.sh"
source=("hib://${_archivename}"
        "${pkgname}.desktop"
        "${pkgname}.install")
sha256sums=('959aa4e4a277503c01bfc06058d027e784ce6630bb2cea0ea7a006068ecacc77'
            '22d1287bfc9287ba16121503c1b6ebf108bec73f291e0a06324a9eb7ab43a21a'
            '98e2b035499843cc5c83da67536a770c0701c1d426268c4958f1d953e7cd212e')
PKGEXT=".pkg.tar"


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


package() {

#Extract double packed game files

  mkdir -p "${srcdir}/${pkgname}"
  sh penumbra_overture_1.1.sh --tar -xf -C "${srcdir}/${pkgname}"

  cd "${srcdir}/${pkgname}"
  tar --lzma -xf "./subarch" config/license instarchive_all &>/dev/null

  mkdir -p "${pkgdir}/opt/${pkgname}"
  tar --lzma --strip-components 1 -xf "./instarchive_all" -C "${pkgdir}/opt/${pkgname}" &>/dev/null

# Remove all but 'libfltk.so.1.1', as there is no 32-bit package available for it on x86_64 systems
# and I'm too lazy too write a pkgbuild for it ;)

  for i in "${_purgelibs[@]}"; do
    rm "${pkgdir}/opt/${pkgname}/lib/${i}"*
  done

# Fix the path in the startup script.

  sed -i -e 's|`dirname ${0}`|/opt/'"$pkgname"'/|' "${pkgdir}/opt/${pkgname}/penumbra"

#Changing the owner of the files, as the default is 500:500

  chown -R 0:0 ${pkgdir}/opt/${pkgname}

#Copy around some files
  install -D -m644 "${srcdir}/${pkgname}/config/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # install -D -m755 "${pkgdir}/opt/${pkgname}/penumbra" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/penumbra.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # rm "${pkgdir}/opt/${pkgname}/penumbra.png"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/penumbra" "${pkgdir}/usr/bin/${pkgname}"

}
