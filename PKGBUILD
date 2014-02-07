# Maintainer: David Miller <moebius282 e4at gmail D0_T com>

pkgname=penumbra-overture-hib
pkgver=1.1
pkgrel=1
pkgdesc='A first person adventure/survival horror game'
arch=('i686' 'x86_64')
url='http://www.penumbragame.com/'
license=('custom')
install="${pkgname}.install"
PKGEXT='.pkg.tar'
#options=('!strip')
makedepends=('xz')

source=("hib://penumbra_overture_${pkgver}.sh" 
        "${pkgname}.desktop"
        "${pkgname}.install"
        "http://arm.konnichi.com/extra/os/i686/libvorbis-1.3.2-1-i686.pkg.tar.xz")

sha256sums=('959aa4e4a277503c01bfc06058d027e784ce6630bb2cea0ea7a006068ecacc77'
            '22d1287bfc9287ba16121503c1b6ebf108bec73f291e0a06324a9eb7ab43a21a'
            'e29d5fe2eec29a0ee92cb8d21676443d43f6e150b3b0997f2f566da1c2ee558a'
            'edfa389d9f8a7f0331da3c82b8d90a8c738973be7b279745b6bde41c0f26a3f2')

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

if [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-sdl_ttf'
           'lib32-glu'
           'lib32-libjpeg'
           'lib32-freealut'
           'lib32-nvidia-cg-toolkit'
           'lib32-libxft'
           'bash'
           'lib32-gcc-libs'
           # 'lib32-libvorbis'
           'lib32-openal'
           'lib32-libgl'
           'lib32-sdl_image'
           'desktop-file-utils'
           'lib32-libpng12')
else
  depends=('sdl_ttf'
          'glu'
          'libjpeg'
          'freealut'
          'nvidia-cg-toolkit'
          'libxft'
          'bash'
          'gcc-libs'
          # 'libvorbis'
          'openal'
          'libgl'
          'sdl_image'
          'desktop-file-utils'
          'libpng12')
fi

package() {

#Extract double packed game files 

  msg 'Extracting archive...'

  mkdir -p "${srcdir}/${pkgname}"
  sh penumbra_overture_1.1.sh --tar -xf -C "${srcdir}/${pkgname}"

  cd "${srcdir}/${pkgname}"
  tar --lzma -xf "./subarch" config/license instarchive_all &>/dev/null

  mkdir -p "${pkgdir}/opt/${pkgname}"
  tar --lzma --strip-components 1 -xf "./instarchive_all" -C "${pkgdir}/opt/${pkgname}" &>/dev/null

# Remove all but 'libfltk.so.1.1', as there is no 32-bit package available for it on x86_64 systems
# and I'm too lazy too write a pkgbuild for it ;)

  msg 'Removing unneeded bundled libraries...'

  for i in 'libGLU.so' 'libSDL' 'libjpeg.so' 'libogg.so' 'libopenal.so' 'libpng' \
  'libstdc++.so' 'libvorbis' 'libCg' 'libalut'; do
    rm "${pkgdir}/opt/${pkgname}/lib/${i}"*
  done

#We need this old version of libvorbis because the game is broken with the new one -> crashes shortly after intro

  tar --recursion --exclude 'pkgconfig' --strip-components 2 -Jxf "${srcdir}/`basename ${source[3]}`" -C "${pkgdir}/opt/${pkgname}/lib/" "usr/lib/" &>/dev/null

# Fix the path in the startup script.

  sed -i -e 's|`dirname ${0}`|/opt/'"$pkgname"'/|' "${pkgdir}/opt/${pkgname}/penumbra" 

#Changing the owner of the files, as the default is 500:500

  chown -R 0:0 ${pkgdir}/opt/${pkgname}

#Copy around some files
  install -D -m644 "${srcdir}/${pkgname}/config/license" "${pkgdir}/usr/share/licenses/${pkgname}/license"
  install -D -m755 "${pkgdir}/opt/${pkgname}/penumbra" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/penumbra.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  rm "${pkgdir}/opt/${pkgname}/penumbra.png"
  rm "${pkgdir}/opt/${pkgname}/penumbra"

}
