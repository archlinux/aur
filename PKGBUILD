# Maintainer: afettouhi <A.Fettouhi@gmail.com>
# Contributor: David Miller <moebius282 e4at gmail D0_T com>

pkgname=vessel
pkgver=20130222
_binver=02222013
pkgrel=1
pkgdesc="A physics-based, steampunk puzzle-platform game"
url="http://www.strangeloopgames.com/"
license=('custom')
arch=('i686' 'x86_64')
groups=("humble-indie-bundle6" "games")
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-sdl' 'lib32-openal' 'bash' 'lib32-gcc-libs')
    optdepends=('lib32-libtxc_dxtn: texture decoding support for open source graphics drivers')
else
    depends=('sdl' 'openal' 'bash' 'gcc-libs')
    optdepends=('libtxc_dxtn: texture decoding support for open source graphics drivers')
fi

source=("hib://${pkgname}-${_binver}-bin"
#        'http://www.flibitijibibo.com/patch/vessel/linux-12192012.tar.gz'
        "${pkgname}.desktop")
sha256sums=('be96e670a51fc27176b31ed88a1a1a4447d113595eceeac9727bb03743465c73'
#            'bf7708a195ef3546c8c3b30b74ff427d5fe5e1548991b4f291264bbd275fe17e'            
            '941c7534f8a557f5cdbbec0f19a4e13c76d393006bdb6e1dafd5529b5c9b6697')
makedepends=('unzip' 'imagemagick')
#options=('!strip')
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

  mkdir -p "${pkgdir}/opt/${pkgname}/"

# unzip is stupid..
  unzip -qq "${srcdir}/${pkgname}-${_binver}-bin" -d "${pkgdir}/opt/tmp/" 'data/*' || true

  mv "${pkgdir}/opt/tmp/data/"* "${pkgdir}/opt/${pkgname}/"
  rm -r "${pkgdir}/opt/tmp/"

#  tar --overwrite -zxf "${srcdir}/linux-12192012.tar.gz" -C "${pkgdir}/opt/${pkgname}/"

  for i in 'libSDL-1.2.so.0' 'libstdc++.so.6'; do
    rm "${pkgdir}/opt/${pkgname}/x86/${i}"*
  done

#the spec only specifies png, svg and xpm..
  convert "${pkgdir}/opt/${pkgname}/Vessel.bmp" "${pkgdir}/opt/${pkgname}/${pkgname}.png"
  rm "${pkgdir}/opt/${pkgname}/Vessel.bmp"

  chown -R root:root "${pkgdir}/opt/${pkgname}/"

  sed -i -e 's|`dirname "$0"`|$(dirname \"$(readlink -f \"$0\")\")|' "${pkgdir}/opt/${pkgname}/Vessel" 

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  mkdir "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/Vessel" "${pkgdir}/usr/bin/${pkgname}"
}
