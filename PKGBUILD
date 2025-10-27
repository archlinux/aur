# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=orbitiny-desktop-bin
pkgver=1.0p7cd
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
  xfconf
  xfwm4
  xorg-xinit
  xorg-server
  xorg-xprop
  xsettingsd
  zlib
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!debug)
source=("${pkgname%-desktop-bin}-$pkgver.tar.gz::$url/files/${pkgname/-desktop/}-release.tar.gz/download")
noextract=("${pkgname%-desktop-bin}-$pkgver.tar.gz")
b2sums=('269ac6d440f098de1edad0b0484319d05955af8882d652ff73ca7697dce8f074d3ab5320e04967534c0f4b6d15c7ae01006a771bab452685c1b0ff484326da0b')

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
  find "$pkgdir"/opt/${pkgname%-desktop-bin} -type d -exec chmod go+x {} \;

  # Running in non-portable mode - Method 1
  sed -i '/export ORBITINY_GLOBAL_SHARED_DIR=$DIR\/shared/d'            "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-bin}
  sed -i '/export ORBITINY_GLOBAL_CONFIG_DIR=$DIR\/usr\/bin\/.config/d' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-bin}
  sed -i '/export ORBITINY_GLOBAL_SHARED_DIR=$DIR\/shared/d'            "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-desktop-bin}-panel
  sed -i '/export ORBITINY_GLOBAL_CONFIG_DIR=$DIR\/usr\/bin\/.config/d' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-desktop-bin}-panel

  sed -i 's|^# export|export|g' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-bin}
  sed -i 's|^# export|export|g' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-desktop-bin}-panel

  # Running standalone
  install -vDm 755 "$pkgdir"/opt/${pkgname%-desktop-bin}/standalone-run/usr/bin/${pkgname%-desktop-bin}-session             -t "$pkgdir"/usr/bin/
  install -vDm 755 "$pkgdir"/opt/${pkgname%-desktop-bin}/standalone-run/usr/share/xsessions/${pkgname%-desktop-bin}.desktop -t "$pkgdir"/usr/share/xsessions
  sed -i 's|LIGHTBAR_PORTABLE_MODE=0|STANDALONE_MODE=1|' "$pkgdir"/opt/${pkgname%-desktop-bin}/${pkgname%-bin}
}
