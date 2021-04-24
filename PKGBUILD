# Maintainer: robertfoster
# Contributor: tuxsavvy

pkgname=realrtcw
pkgver=3.1n
pkgrel=7
pkgdesc="An overhaul mod for critically acclaimed Return To Castle Wolfenstein."
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('freetype2' 'graphite' 'harfbuzz' 'iortcw-data' 'libjpeg-turbo' 'libogg' 'openal' 'opus' 'opusfile' 'pcre' 'sdl2' 'zlib')
makedepends=('unzip')
install='realrtcw.install'
sha256sums=('3dba9afe8d945c9e351acfde3d6b66e895b6f3aa8f7240204fb71046e9bcb6ce'
            '4a5a62dd94461ecb67b02ae5f0cca9cc589c4af310af3483cc43fec76b5b7d03'
            '7940bcba27e82a4de14d8243f057ded501986b780190d87bc2729f556c76a2ed'
            '643bd2a56b06fbdf9790b3bb7557c7f6663cc3e86295431f6470b347e37b4bb2'
            'e68d6f400342e36d3db94e519978da0afa2d74f3368b1fe88014c4bdb26b193e'
            '43501d60c80ae4a2837295fb5faf01d42e31f31371fcd6cecc8054eed965b8f6'
            '6482482e637d38ce6eff6ab740f971f86b7e0d205797b2c5044aecfcf5701364')
_commit="a1344ab17a53bda530e1f34c1a80bca7afcadcf4"

_mainid=201571
_addonsid=201574

noextract=("${pkgname}-${pkgver}.zip")
PKGEXT='.pkg.tar'
DLAGENTS+=("moddb::${BASH_SOURCE[0]%/*}/moddb-downloader.sh %u %o")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wolfetplayer/RealRTCW/archive/${_commit}.tar.gz"
  "${pkgname}-${pkgver}.zip::moddb://www.moddb.com/downloads/start/${_mainid}/all"
  "${pkgname}-${pkgver}-addons.zip::moddb://www.moddb.com/downloads/start/${_addonsid}/all"
  "${pkgname}.png"
  "${pkgname}.launcher"
  "${pkgname}.desktop"
  moddb-downloader.sh
)

prepare() {
  cd "${srcdir}"

  # Unzipping with flattened paths
  unzip -jo "${pkgname}-${pkgver}.zip" -d paks
}

package() {
  cd "${srcdir}/RealRTCW-${_commit}"

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
  for i in "${srcdir}"/paks/*.pk3; do
    install -m 644 "${i}" \
      "${pkgdir}/opt/realrtcw/main"
  done

  # Installing RealRTCW Addons Pack
  cp -R "${srcdir}/copy this folder content into rtcw root directory/"* \
    "${pkgdir}/opt/realrtcw"

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
