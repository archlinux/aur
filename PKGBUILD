# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=orbitiny-desktop-bin
pkgver=1.0p2rx
pkgrel=1
pkgdesc="New, 100% portable, innovative and traditional but modern looking desktop environment for Linux"
arch=(x86_64)
url="https://sourceforge.net/projects/${pkgname%-bin}"
license=(GPL-2.0-only)
depends=(
  acl
  at-spi2-core
  cairo
  dbus
  dconf
  file
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  krb5
  libcap
  libglvnd
  libsigc++
  libstatgrab
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxkbcommon
  libxkbcommon-x11
  libxrender
  pango
  sh
  qt5-base
  qt5-declarative
  qt5-svg
  qt5-wayland
  qt5-x11extras
  wayland
  xcb-util
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
  zlib
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=(
  "${pkgname%-desktop-bin}-$pkgver.tar.gz::$url/files/${pkgname/-desktop/}-release.tar.gz/download"
  "${pkgname%-desktop-bin}-$pkgver.rss::$url/rss?path=/"
)
noextract=("${pkgname%-desktop-bin}-$pkgver.tar.gz")
b2sums=('SKIP'
        'SKIP')

prepare() {
  md5sum -c <<< "$(grep -Eo "[0-9a-z]{32}" ${pkgname%-desktop-bin}-$pkgver.rss) ${pkgname%-desktop-bin}-$pkgver.tar.gz"
}

package() {
  install -vd "$pkgdir"/opt/${pkgname%-desktop-bin}
  tar -xzf ${pkgname%-desktop-bin}-$pkgver.tar.gz \
    --no-same-owner \
    --strip-components=1 \
    --exclude=".portable_mode" \
    --exclude="New_Download_Link" \
    -C "$pkgdir"/opt/${pkgname%-desktop-bin}



  # Fix permissions
  chmod -R go-w "$pkgdir"
  chmod -R go+r "$pkgdir"
  find "$pkgdir"/opt/${pkgname%-desktop-bin}/usr/bin/.config -type d -exec chmod go+x {} \;

  # Running in non-portable mode - Method 1
  sed -i '/export ORBITINY_GLOBAL_SHARED_DIR=$DIR\/shared/d'            "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-bin}
  sed -i '/export ORBITINY_GLOBAL_CONFIG_DIR=$DIR\/usr\/bin\/.config/d' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-bin}
  sed -i '/export ORBITINY_GLOBAL_SHARED_DIR=$DIR\/shared/d'            "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-desktop-bin}-panel
  sed -i '/export ORBITINY_GLOBAL_CONFIG_DIR=$DIR\/usr\/bin\/.config/d' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-desktop-bin}-panel

  sed -i 's|^# export|export|g' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-bin}
  sed -i 's|^# export|export|g' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-desktop-bin}-panel
}
