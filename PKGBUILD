# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=solar2
pkgver=1.10
pkgrel=3
pkgdesc='An open-world, sandbox game set in an infinite abstract universe (game sold separately)'
url='http://murudai.com/solar/'
license=('custom')
arch=('i686' 'x86_64')
# Dependencies that don't appear to be necessary, but are listed in configs:
# sdl_image, sdl_ttf, sdl_net, freealut, libxi
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-sdl_mixer' 'lib32-glu' 'lib32-openal')
else
  depends=('sdl_mixer' 'glu' 'openal')
fi
source=("hib://${pkgname}-linux-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png::https://humblebundle-a.akamaihd.net/misc/files/a72badb523/images/icons/solar_android_pc.png")
md5sums=('243918907eea486fdc820b7cac0c260b'
         '642ebed8f1bbbc0541ed826e775b7c65'
         'b49600d174ac15a910d93d874062f8ec')
options=('!strip')
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
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download the file manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf"; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

package() {
  cd "${srcdir}/Solar2"

  install -d "${pkgdir}/opt/"
  cp -rl . "${pkgdir}/opt/${pkgname}"

  # Use system-provided libraries.
  rm "${pkgdir}/opt/${pkgname}/lib/libmad.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib/libmad.so.0.2.1"
  rm "${pkgdir}/opt/${pkgname}/lib/libmikmod.so.2"
  rm "${pkgdir}/opt/${pkgname}/lib/libmikmod.so.2.0.4"
  rm "${pkgdir}/opt/${pkgname}/lib/libopenal.so.1.13.0"
  rm "${pkgdir}/opt/${pkgname}/lib/libopenal.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib/libSDL_mixer-1.2.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib/libSDL_mixer-1.2.so.0.10.1"
  sed -i "s#lib/##" "${pkgdir}/opt/${pkgname}/Tao.Sdl.dll.config"

  # Replace duplicate library with a symbolic link.
  rm "${pkgdir}/opt/${pkgname}/lib/libmono-2.0.so"
  ln -s libmono-2.0.so.1 "${pkgdir}/opt/${pkgname}/lib/libmono-2.0.so"

  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/Solar2.bin.x86" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/"
}
