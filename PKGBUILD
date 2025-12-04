# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: Ludvig Hozman <ludvig.hozman@gmail.com>
# Contributor: el-gazzle

pkgname=plex-desktop
pkgver=1.112.0.359
_pkghash=0d79a49f
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
)
source=("https://artifacts.plex.tv/plex-desktop-stable/$pkgver-$_pkghash/linux/Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2"
  "http://ftp.us.debian.org/debian/pool/main/libw/libwebp/libwebp6_0.6.1-2.1+deb11u2_amd64.deb"
  "https://github.com/flathub/tv.plex.PlexDesktop/raw/master/tv.plex.PlexDesktop.desktop"
  "https://github.com/flathub/tv.plex.PlexDesktop/raw/master/tv.plex.PlexDesktop.png"
  "iconpatch.patch"
  "launcher.patch"
  "${_execwrapper}::git+https://invent.kde.org/brauch/appimage-exec-wrapper.git#commit=f8be7f43cfd5d4e81c8c888256b4efc1b269bb4c")
sha256sums=('05facd594832dc459b24235c5983e9b508cbece61355a9116da4e5205c477f3c'
            '8abc2b1ca77a458bbbcdeb6af5d85316260977370fa2518d017222b3584d9653'
            '2215f6bb3a2bbe50ceb3bedcb93f53d11f6a51ec7512f08f68af91da8253261b'
            '565178841c318fb4926acf65a68df6dae484c0b705be6dd736858e7408a261d5'
            'ba597b7083d64e3ffbcd610aec269a53cc404e4e6ec2a4d31064b5dbe75afb8b'
            'f2e52b94e31cc2ed7b4e070024b4db9c7fce5e9909960a102100348167c6a288'
            '5ffb1d27fcd19f75e97e1df5cc82bf791896ef326f207c8a6dd058999f858c05')
noextract=("Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2")
options=(!debug)

build() {
  cd "$srcdir/$_execwrapper"
  make
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/opt/${pkgname}"
  tar --no-same-owner -xvf "$srcdir"/Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2 -C "$pkgdir"/opt/${pkgname}
  tar -xvf "$srcdir"/data.tar.xz ./usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2
  install -Dm644 usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2 "${pkgdir}/opt/${pkgname}"/lib/libwebp.so.6
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
