# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: Ludvig Hozman <ludvig.hozman@gmail.com>
# Contributor: el-gazzle
# Contributor: Adam Hellberg <sharparam@sharparam.com>

pkgname=plex-desktop
pkgver=1.115.0.426
_pkghash=4e960a1d
_snapid=qc6MFRM433ZhI1XjVzErdHivhSOhlpf0
_snaprev=88
_execwrapper=appimage-exec-wrapper
pkgrel=1
pkgdesc="Plex desktop client for linux"
arch=('x86_64')
url='http://plex.tv'
license=('unknown')
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
  libxkbcommon
  libxkbfile
  libxml2-legacy
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
makedepends=(
  git
  squashfs-tools
)
source=("${pkgname}_${_snaprev}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
  "http://ftp.us.debian.org/debian/pool/main/libw/libwebp/libwebp6_0.6.1-2.1+deb11u2_amd64.deb"
  "https://github.com/flathub/tv.plex.PlexDesktop/raw/master/tv.plex.PlexDesktop.desktop"
  "https://github.com/flathub/tv.plex.PlexDesktop/raw/master/tv.plex.PlexDesktop.png"
  "iconpatch.patch"
  "launcher.patch"
  "${_execwrapper}::git+https://invent.kde.org/brauch/appimage-exec-wrapper.git#commit=f8be7f43cfd5d4e81c8c888256b4efc1b269bb4c")
sha256sums=('9490b70598c7a23c884d45cd58db557bf1d3e5a4c37926e3bb09422ccaaea39e'
            '8abc2b1ca77a458bbbcdeb6af5d85316260977370fa2518d017222b3584d9653'
            '2215f6bb3a2bbe50ceb3bedcb93f53d11f6a51ec7512f08f68af91da8253261b'
            '565178841c318fb4926acf65a68df6dae484c0b705be6dd736858e7408a261d5'
            'ba597b7083d64e3ffbcd610aec269a53cc404e4e6ec2a4d31064b5dbe75afb8b'
            'dc5638aaedbd5629524c19ccb751ba58518c25508a50b26fa227ba6796fa37e5'
            '5ffb1d27fcd19f75e97e1df5cc82bf791896ef326f207c8a6dd058999f858c05')
noextract=("${pkgname}_${_snaprev}.snap")
options=(!debug)

build() {
  cd "$srcdir/$_execwrapper"
  make
}

package() {
  local _snapdir="${srcdir}/snap-extract"

  rm -rf "${_snapdir}"
  unsquashfs -d "${_snapdir}" "${srcdir}/${pkgname}_${_snaprev}.snap"

  install -d "${pkgdir}/opt/${pkgname}"

  for _dir in bin lib plugins qml resources data-dir; do
    [[ -d "${_snapdir}/${_dir}" ]] && cp -a "${_snapdir}/${_dir}" "${pkgdir}/opt/${pkgname}/"
  done
  install -Dm755 "${_snapdir}/Plex.sh" "${pkgdir}/opt/${pkgname}/Plex.sh"

  install -Dm644 "${_snapdir}/usr/lib/x86_64-linux-gnu/libwebp.so.7.1.3" \
    "${pkgdir}/opt/${pkgname}/lib/libwebp.so.7"

  install -Dm644 "$_execwrapper"/exec.so "${pkgdir}/opt/${pkgname}"/lib/exec.so

  rm -rf "$pkgdir/opt/${pkgname}"/lib/dri
  rm -rf "$pkgdir/opt/${pkgname}"/lib/libEGL.so*
  rm -rf "$pkgdir/opt/${pkgname}"/lib/libdrm.so*
  rm -rf "$pkgdir/opt/${pkgname}"/lib/libdrm_*.so*
  rm -rf "$pkgdir/opt/${pkgname}"/lib/libpciaccess.so*
  rm -rf "$pkgdir/opt/${pkgname}"/lib/libva.so*
  rm -rf "$pkgdir/opt/${pkgname}"/lib/libva-*.so*

  install -d "${pkgdir}"/usr/bin
  ln -s /opt/${pkgname}/Plex.sh "${pkgdir}"/usr/bin/Plex

  install -Dm644 "${srcdir}/tv.plex.PlexDesktop.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/tv.plex.PlexDesktop.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  patch "$pkgdir"/usr/share/applications/tv.plex.PlexDesktop.desktop "$srcdir"/iconpatch.patch
  patch "$pkgdir/opt/${pkgname}"/Plex.sh "$srcdir"/launcher.patch
}
