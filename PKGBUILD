# Maintainer: Michele Palazzi <sysdadmin@m1k.cloud>

pkgname=plex-htpc
pkgver=1.71.1.346
_pkghash=f62ce923
_snapid=81OP06hEXlwmMrpMAhe5hyLy5bQ9q6Kz
_snaprev=73
pkgrel=1
pkgdesc="Plex HTPC client for linux"
arch=('x86_64')
url='http://plex.tv'
license=('custom')
makedepends=(squashfs-tools)
depends=(libgl
  hicolor-icon-theme
  alsa-lib
  dbus
  expat
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  glib2
  glibc
  harfbuzz
  lcms2
  libdrm
  libjpeg-turbo
  libwebp
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxml2-legacy
  libxkbcommon
  libxkbfile
  libxrandr
  libxslt
  libxtst
  mesa
  minizip
  nspr
  nss
  opus
  xcb-util-renderutil
  pciutils
  libxss
  xcb-util-image
  libxkbcommon-x11
  libxinerama
  xcb-util-keysyms
  xcb-util-wm
  zlib
  snappy
  libva
  libpulse
  libxrender
  wayland
  qt6-base
)
source=("${pkgname}_${_snaprev}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
  "https://github.com/flathub/tv.plex.PlexHTPC/raw/master/tv.plex.PlexHTPC.desktop"
  "https://github.com/flathub/tv.plex.PlexHTPC/raw/master/tv.plex.PlexHTPC.png"
)
sha256sums=('e94d19e92fc2a51f01714874d0af9cc7decc8314cd7db35b69cddb1ff9727660'
            'b98d1ba9191e346a256f1c838051b2d547f638558d79898df8b1707c7cabe487'
            '069cdf95608a46af4313bdffb281df37819e77c4e371c1e1667af889f0f325a2')
noextract=("${pkgname}_${_snaprev}.snap")

package() {
  local _snapdir="${srcdir}/snap-extract"

  rm -rf "${_snapdir}"
  unsquashfs -d "${_snapdir}" "${srcdir}/${pkgname}_${_snaprev}.snap"

  install -d "${pkgdir}/opt/${pkgname}"
  for _dir in bin lib plugins qml resources data-dir; do
    [[ -d "${_snapdir}/${_dir}" ]] && cp -a "${_snapdir}/${_dir}" "${pkgdir}/opt/${pkgname}/"
  done
  install -Dm755 "${_snapdir}/Plex.sh" "${pkgdir}/opt/${pkgname}/Plex.sh"

  install -Dm644 "${_snapdir}/usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2" \
    "${pkgdir}/opt/${pkgname}/lib/libwebp.so.6"

  rm -rf "${pkgdir}/opt/${pkgname}/lib/dri"
  rm -rf "${pkgdir}/opt/${pkgname}/lib/libEGL.so"*
  rm -rf "${pkgdir}/opt/${pkgname}/lib/libdrm.so"*
  rm -rf "${pkgdir}/opt/${pkgname}/lib/libdrm_"*.so*
  rm -rf "${pkgdir}/opt/${pkgname}/lib/libpciaccess.so"*
  rm -rf "${pkgdir}/opt/${pkgname}/lib/libva.so"*
  rm -rf "${pkgdir}/opt/${pkgname}/lib/libva-"*.so*

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/Plex.sh "${pkgdir}/usr/bin/Plex"

  install -Dm644 "${srcdir}/tv.plex.PlexHTPC.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/tv.plex.PlexHTPC.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
}
