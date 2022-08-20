# Maintainer: robertfoster
# Contributor: tuxsavvy

pkgname=realrtcw
pkgver=4.0
pkgrel=2
pkgdesc="An overhaul mod for critically acclaimed Return To Castle Wolfenstein."
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('freetype2' 'graphite' 'harfbuzz' 'iortcw-data' 'libjpeg-turbo' 'libogg' 'openal' 'opus' 'opusfile' 'pcre' 'sdl2' 'zlib')
makedepends=('unzip')
install='realrtcw.install'
sha256sums=('ecadc55bdb4e3d41dcd4e3872b110d7d0e716a45c6393108387dc7b062830a00'
  '7389f55acdaf553b9f04fb5a70ebfd570163503495df19c232e175a7f8e2ebda'
  '643bd2a56b06fbdf9790b3bb7557c7f6663cc3e86295431f6470b347e37b4bb2'
  'e68d6f400342e36d3db94e519978da0afa2d74f3368b1fe88014c4bdb26b193e'
  '43501d60c80ae4a2837295fb5faf01d42e31f31371fcd6cecc8054eed965b8f6'
  '6482482e637d38ce6eff6ab740f971f86b7e0d205797b2c5044aecfcf5701364'
  'b15b3b4e0fc7b5252354ec7cc4f99805444fd1eb2df085e501e93b33915eab71')

_mainid=236053

noextract=("${pkgname}-${pkgver}.zip")
PKGEXT='.pkg.tar'
DLAGENTS+=("moddb::${BASH_SOURCE[0]%/*}/moddb-downloader.sh %u %o")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wolfetplayer/RealRTCW/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.zip::moddb://www.moddb.com/downloads/start/${_mainid}/all"
  "${pkgname}.png"
  "${pkgname}.launcher"
  "${pkgname}.desktop"
  moddb-downloader.sh
  disable-steam.patch
)

prepare() {
  cd "${srcdir}"

  # Unzipping with flattened paths
  unzip -jo "${pkgname}-${pkgver}.zip" -d paks
}

package() {
  cd "${srcdir}/RealRTCW-${pkgver}"

  unset CFLAGS
  # Disable steam build
  patch -Np1 -i ../disable-steam.patch

  USE_INTERNAL_LIBS=0 \
    COPYDIR=${pkgdir}/opt/realrtcw \
    make copyfiles

  ln -s -r /opt/iortcw-data/pak0.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/sp_pak1.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pak0.pk3 \
    "${pkgdir}/opt/realrtcw/main"

  ln -s -r /opt/iortcw-data/mp_bin.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pak1.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pak2.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pak3.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pak4.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pak5.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps0.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps1.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps2.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps3.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps4.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps5.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/mp_pakmaps6.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/sp_pak2.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/sp_pak3.pk3 \
    "${pkgdir}/opt/realrtcw/main"
  ln -s -r /opt/iortcw-data/sp_pak4.pk3 \
    "${pkgdir}/opt/realrtcw/main"

  ln -s -r /opt/iortcw-data/openurl.sh \
    "${pkgdir}/opt/realrtcw/openurl.sh"

  # Installing RealRTCW pk3
  for i in "${srcdir}"/paks/{*.pk3,*.cfg}; do
    install -m 644 "${i}" \
      "${pkgdir}/opt/realrtcw/main"
  done

  # Modify Launcher Scripts
  if [ "$CARCH" = "x86_64" ]; then
    # x86_64 Systems
    TARGET=x86_64
  else
    # i686 Systems
    TARGET=x86
  fi
  sed -i "s:ARCH:${TARGET}:" \
    "${srcdir}"/realrtcw.*

  # Install Launcher Script (Single Player Client)
  install -D -m 755 "${srcdir}/realrtcw.launcher" \
    "${pkgdir}/usr/bin/realrtcw"

  # Install Desktop File (Single Player)
  install -D -m 644 "${srcdir}/realrtcw.desktop" \
    "${pkgdir}/usr/share/applications/realrtcw.desktop"

  # Install Icon File (Single Player)
  install -Dm 644 "${srcdir}/realrtcw.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/realrtcw.png"
}
