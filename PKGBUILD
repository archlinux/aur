# Maintainer: robertfoster
# Contributor: tuxsavvy

pkgname=realrtcw
pkgver=3.1n
pkgrel=4
pkgdesc="An overhaul mod for critically acclaimed Return To Castle Wolfenstein."
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/realrtcw-realism-mod"
license=('GPL')
depends=('freetype2' 'graphite' 'harfbuzz' 'iortcw-data' 'libjpeg-turbo' 'libogg' 'openal' 'opus' 'opusfile' 'pcre' 'sdl2' 'zlib')
makedepends=('unzip')
install='realrtcw.install'
md5sums=('b0f5e7c4986f59ac28b0f78180f28988'
  '53883daccf27e054469cc0657b049476'
  '3de40b988223e22a88c2f3301fa590b5'
  '19ef21acfceb965f36b53b70267641d1'
  '7e3991e5f331662419ad1ed04e49366c'
  '88752202a0da9bc9cb467b6f0f201132'
  '26632b1ad221caf63399ce5f9c6c958b')
_commit="a1344ab17a53bda530e1f34c1a80bca7afcadcf4"

_mainid=201571
_addonsid=201574

noextract=("${pkgname}-${pkgver}.zip")
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
  for i in paks/*.pk3; do
    install -m 644 "${srcdir}/${i}" \
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
