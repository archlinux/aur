# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Sam S. <smls75@gmail.com>

pkgbase="proteus"
_app_id="com.twistedtreegames.${pkgbase}"
pkgname="${pkgbase}"
pkgver=1.2+h20140516
_hibver=05162014
_installer="${pkgname}-${_hibver}-bin"
pkgrel=1
pkgdesc='An audio-visual exploration game (Humble Bundle version)'
url='http://www.visitproteus.com/'
arch=('x86_64' 'i686')
license=('custom:commercial')
makedepends=('ipfs-dlagent')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'glu' 'alsa-lib' 'libogg' 'libvorbis')
provides=("${pkgname}-hib")
options=(
  '!strip'
  # '!upx'
)
PKGEXT='.pkg.tar.gz'
DLAGENTS+=(
  'hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1'
  'ipfs::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a ipfs:// DLAGENT in /etc/makepkg.conf."; exit 1'
)
source=(
  # "hib://${_installer}"
  "${_installer}::ipfs://Qmdkx5nZpu7vto3yyxGgCLSd3pwdbpc7uEFUpn71SPMiYb"
  "${pkgname}.desktop"
)
sha256sums=('86bc532ee9562e2699ac56efc48b4f6674afe378c09ca4c2da8c9e52a0b54343'
            '5e340f06ae64d419aaa206cf1fe172a620fa779f49f1cf51b7e5bf74d6c2abd8')

package() {
  cd "$srcdir"
  _target="/usr/games/${_app_id}"
  [ $CARCH == i686 ] && { _lib=lib   ; _other=lib64 ; _arch=x86    ;} \
                     || { _lib=lib64 ; _other=lib   ; _arch=x86_64 ;}
  
  # Install game files
  mkdir -p "${pkgdir}/${_target}"
  cp -Tal data "${pkgdir}/${_target}"
  
  # Remove bundled libraries (use distro versions instead)
  ( cd "$pkgdir"/$_target/$_lib
    rm -r libSDL2-2.0.so.0 libSDL2_image-2.0.so.0 libSDL2_mixer-2.0.so.0 \
          libvorbis.so.0 libvorbisfile.so.3 libogg.so.0 ../$_other )
  
  # Install desktop entry
  install -Dm644 "$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/${pkgname}.desktop"
  
  # Install icon
  install -Dm644 data/Proteus.png "${pkgdir}/usr/share/pixmaps/proteus.png"
  
  # Install launch script
  echo -e "#!/bin/sh\ncd ${_target} && ./Proteus.bin.${_arch}" > launcher.sh
  install -Dm755 launcher.sh "${pkgdir}/usr/bin/proteus"
}
