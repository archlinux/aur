# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=antichamber
pkgver=1392664980
pkgrel=2
pkgdesc="A mind-bending psychological exploration game where nothing can be taken for granted"
url="http://www.antichamber-game.com/"
license=('unknown')
arch=('i686' 'x86_64')
groups=("games")
_purgelibs=('libogg.so' 'libvorbis.so' 'libvorbisfile.so.3' 'libSDL2-2.0.so.0')
if [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-libvorbis' 'lib32-sdl2') # 'lib32-sdl2_mixer' not in repo and aur package misnamed & broken ; gperftools only in aur :/
else
  depends=('libvorbis' 'sdl2')
  # _purgelibs+=('libtcmalloc.so.0' 'libSDL2_mixer-2.0.so.0') #gperftools doesn't provide a required symlink; also: 'MinorityMix_SetPosition', could be sdl2_mixer
fi
makedepends=('unzip')
changelog="${pkgname}.changelog"
_archivename="${pkgname}_1.01_linux_${pkgver}.sh"
source=("hib://${_archivename}"
        "${pkgname}.desktop"
        "${pkgname}.changelog")
sha256sums=('4973acf3b995ee015ce12908c368acd10db86614e45088a6ccdb53b60e8c235e'
            'e1f2f711d735e0dce6261c14c9ebf8ecd910c329ef4514d5f29ce1df44906b69'
            'SKIP')
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


package()
{
  mkdir -p "${pkgdir}/opt/${pkgname}/"

# unzip is stupid..
  unzip -qq "${srcdir}/${_archivename}" -d "${pkgdir}/opt/tmp/" 'data/*' || true

  # seems like flibit has a new directory structure, stuff is now in folders related to the target arch (noarch, x86 here). we need to 'unpack' those
  mv "${pkgdir}/opt/tmp/data/"*/* "${pkgdir}/opt/${pkgname}/"
  rm -r "${pkgdir}/opt/tmp/"

  for i in "${_purgelibs[@]}"; do
    rm "${pkgdir}/opt/${pkgname}/Binaries/Linux/lib/${i}"
  done

# patching the included startup script so it supports being symlinked
  sed -i -e 's|$(dirname "$0")|$(dirname \"$(readlink -f \"$0\")\")|' "${pkgdir}/opt/${pkgname}/${pkgname^}.sh"

  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/${pkgname^}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/AntichamberIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
