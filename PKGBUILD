# Maintainer: Troplo <troplo@troplo.com>

pkgname=flowfox-bin
_pkgname=flowfox
pkgver=143.0
pkgrel=1
url=https://github.com/Troplo/ffox
conflicts=("flowfox")
_github_rel=firefox-143.0.en-US.linux-x86_64-1
pkgdesc="Fork of Firefox with minimal changes, including rebinding of default keyboard shortcuts to better match Chromium. Not affiliated with Mozilla. (Binary version)"
arch=('x86_64' 'i686')
license=(MPL GPL LGPL)
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(!strip)
# https://github.com/Troplo/foxrel/releases/download/firefox-128.0.4.en-US.linux-x86_64-1/firefox-128.0.4.en-US.linux-x86_64.tar.bz2
_archive="https://github.com/Troplo/foxrel/releases/download"
source_x86_64=("firefox-$pkgver-x86_64.tar.xz::$_archive/$_github_rel/firefox-$pkgver.en-US.linux-x86_64.tar.xz")
source=($_pkgname.sh
        $_pkgname.desktop
        policies.json)

package() {
  # Create directories
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  # Install
  cp -r firefox/ "$pkgdir"/opt/$_pkgname

  # Launchers
  install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$_pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done

  # Use system-provided dictionaries
  #rm -r "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$_pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$_pkgname/libnssckbi.so

  # Disable update checks (managed by pacman)
  mkdir "$pkgdir"/opt/$_pkgname/distribution
  install -m644 "$srcdir"/policies.json "$pkgdir"/opt/$_pkgname/distribution/
}
sha256sums=('c0c1c769c4d0f725a340d567021bb81170a30417aae31af632c62320bcf22f1e'
            '67bd4db8eb21be88d80dc0df8cdabbea59295784c2614157e963162504324053'
            '6e1e97053fa272ad282428cf05b8cde07842353e8dfff7210c91c74842a3e71e')
sha256sums_x86_64=('89ef731c636019ee732f25b8910a7b07943f58586770304be61937e6b0097b7c')
