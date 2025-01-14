# Maintainer: Ludvig Hozman <ludvig.hozman@gmail.com>

pkgname=plex-desktop
pkgver=1.106.0.276
_pkghash=fe8d1d20
pkgrel=2
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
  libxml2
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
source=("https://artifacts.plex.tv/plex-desktop-stable/$pkgver-$_pkghash/linux/Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2"
  "http://ftp.us.debian.org/debian/pool/main/libw/libwebp/libwebp6_0.6.1-2.1+deb11u2_amd64.deb"
  "https://github.com/flathub/tv.plex.PlexDesktop/raw/master/tv.plex.PlexDesktop.desktop"
  "https://github.com/flathub/tv.plex.PlexDesktop/raw/master/tv.plex.PlexDesktop.png"
  "iconpatch.patch"
)
sha256sums=('b8d1d0eba9cf5e84ca9c605da2b78b0b2be285d245d78e0e228fd578d15ba79f'
            '8abc2b1ca77a458bbbcdeb6af5d85316260977370fa2518d017222b3584d9653'
            '2215f6bb3a2bbe50ceb3bedcb93f53d11f6a51ec7512f08f68af91da8253261b'
            '565178841c318fb4926acf65a68df6dae484c0b705be6dd736858e7408a261d5'
            'fdd03ee53402df3691ce4d278e1f233721e16042a30d1875c0f285a65b890d97')
noextract=('Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2')

package() {
  cd "$srcdir"

  install -d "${pkgdir}/opt/${pkgname}"
  tar --no-same-owner -xvf $srcdir/Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2 -C $pkgdir/opt/${pkgname}
  tar -xvf $srcdir/data.tar.xz ./usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2
  install -Dm644 usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2 ${pkgdir}/opt/${pkgname}/lib/libwebp.so.6

  rm -rf $pkgdir/opt/${pkgname}/lib/dri
  rm -rf $pkgdir/opt/${pkgname}/lib/libEGL.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libdrm.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libdrm_*.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libpciaccess.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libva.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libva-*.so*

  install -d ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/Plex.sh ${pkgdir}/usr/bin/Plex

  install -Dm644 "${srcdir}/tv.plex.PlexDesktop.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/tv.plex.PlexDesktop.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
  patch $pkgdir/usr/share/applications/tv.plex.PlexDesktop.desktop $srcdir/iconpatch.patch
}
