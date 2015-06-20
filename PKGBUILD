# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: jimmy-6 <jakub.jarozek {at} gmail.com>
# Contributor: Babets http://aur.archlinux.org/account.php?Action=AccountInfo&ID=6996
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=trine
pkgver=1.0.8_update4
pkgrel=4
pkgdesc="A physics-based fantasy action game with three playable characters and co-op mode (game sold separately)"
url="http://trine-thegame.com"
license=('custom: "commercial"')
arch=('i686' 'x86_64')
depends=('glu' 'libglade' 'libvorbis' 'libxmu' 'nvidia-cg-toolkit' 'openal'
         'sdl_image' 'sdl_ttf')
optdepends=('libtxc_dxtn: texture decoding for open source ATI and Intel drivers')
makedepends=('unzip')
# The 32 bit and 64 bit binaries are identitical when unzipped, so it doesn't
# matter which you use.
if [ "${CARCH}" = "x86_64" ]; then
  _gamepkg='TrineUpdate4.64.run'
  _gamepkgsum='9ca9a755f3586aeda47d650808129948'
  _archbits=64
  _rmarchbits=32
else
  _gamepkg='TrineUpdate4.32.run'
  _gamepkgsum='7c84061f9f74052a45d15c35df18d143'
  _archbits=32
  _rmarchbits=64
fi
source=("${pkgname}.desktop" "hib://${_gamepkg}")
md5sums=('1c9f699d983521866f936feac81e86c9' "${_gamepkgsum}")
install="${pkgname}.install"
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
PKGEXT=".pkg.tar"

build() {
  cd "${srcdir}"
  unzip "${_gamepkg}" -d "${pkgname}-${pkgver}" || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/opt/"
  cp -Rl . "${pkgdir}/opt/${pkgname}/"
  chmod 644 "${pkgdir}/opt/${pkgname}/Trine_Manual_linux.pdf" \
      "${pkgdir}/opt/${pkgname}/data/video/cinematic/trineroom_thief.ogg"

  # Cleanup install dir
  cd "${pkgdir}/opt/${pkgname}"
  rm removeShortcuts.sh createShortcuts.sh
  rm -r lib${_rmarchbits} trine-bin${_rmarchbits} trine-launcher${_rmarchbits}
  mv trine-bin${_archbits} trine-bin
  mv trine-launcher${_archbits} trine-launcher

  cd "${pkgdir}/opt/${pkgname}/lib${_archbits}"
  # Process libraries that are in only one architecture
  if [ "${CARCH}" = "i686" ]; then
    # In general, all of these are provided by the OS and need to be
    # dependencies. Exceptions:
    #   libgdbm.so.3, libselinux.so.1, libxcb-render-util.so.0 aren't linked by
    #   anything, so they aren't necessary
    #
    #   libxcb-xlib.so.0 is an old dependency of libX11. It isn't needed when
    #   using the system's newer libXll
    #
    #   libx86.so.1 is only used by libvga.so.1, which will be removed
    rm libexpat.so.1 libFLAC.so.8 libgcc_s.so.1 libgdbm.so.3 \
        libgmodule-2.0.so.0 libgomp.so.1 libICE.so.6 libmikmod.so.2 libm.so.6 \
        libpcre.so.3 librt.so.1 libSDL_sound-1.0.so.1 libselinux.so.1 \
        libsmpeg-0.4.so.0 libSM.so.6 libspeex.so.1 libX11.so.6 libx86.so.1 \
        libXau.so.6 libxcb-render.so.0 libxcb-render-util.so.0 libxcb.so.1 \
        libxcb-xlib.so.0 libXcomposite.so.1 libXcursor.so.1 libXdamage.so.1 \
        libXdmcp.so.6 libXext.so.6 libXfixes.so.3 libXinerama.so.1 libXi.so.6 \
        libXmu.so.6 libXrender.so.1 libXt.so.6 libz.so.1
  else
    # libswscale.so.0 is used for 64 bit
    true # nothing to do
  fi
  # In general, all of these are provided by the OS and need to be dependencies.
  # Exceptions:
  #   libNxCharacter.so isn't linked by anything, so it isn't necessary
  #
  #   libdirect-1.0.so.0, libdirectfb-1.0.so.0, libfusion-1.0.so.0, libvga.so.1
  #   are optional dependencies of libSDL-1.2.so.0. They aren't needed when
  #   using the systems's libSDL, which doesn't depend on them.
  #
  #   libpng12.so.0, libtiff.so.4 are old dependencies of libSDL_image-1.2.so.0.
  #   They aren't needed when using the system's newer libSDL_image
  #
  # libPhysXCore.so, libNxCooking.so appear to be unused when using ldd, but
  # actually libPhysXLoader.so.1 dlopens them, so they shouldn't be removed.
  rm libCg.so libCgGL.so libSDL-1.2.so.0 libSDL_image-1.2.so.0 \
      libSDL_ttf-2.0.so.0 libdirect-1.0.so.0 libdirectfb-1.0.so.0 \
      libfusion-1.0.so.0 libjpeg.so.62 libNxCharacter.so libogg.so.0 \
      libopenal.so.1 libpng12.so.0 libstdc++.so.6 libtiff.so.4 libvga.so.1 \
      libvorbis.so.0 libvorbisfile.so.3

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s /opt/trine/trine-bin "${pkgdir}/usr/bin/trine"
  ln -s /opt/trine/trine-launcher "${pkgdir}/usr/bin/trine-launcher"

  install -Dm644 "${srcdir}/trine.desktop" \
      "${pkgdir}/usr/share/applications/trine.desktop"
}
