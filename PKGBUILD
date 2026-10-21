# Maintainer: Kieran David Evans <keyz182 at gmail dot com>

pkgname=rwpm-bin
_name=rwpm
pkgver=1.16.0
pkgrel=1
pkgdesc='Separate RimWorld profiles, each with its own saves, settings and mod list (prebuilt release)'
arch=('x86_64')
url='https://github.com/keyz182/rimworld-profile-manager'
license=('MIT')
depends=('glibc' 'gcc-libs')
# The window code loads these at run time, so the linker does not list them.
optdepends=(
  'vulkan-icd-loader: GPU drawing for the app window'
  'libxkbcommon: keyboard input'
  'wayland: Wayland window support'
  'libx11: X11 window support'
  'libxcursor: X11 mouse pointer'
  'libxi: X11 input'
  'libxcb: X11 connection'
  'dbus: desktop dialogs'
)
provides=("$_name=$pkgver")
conflicts=("$_name")
options=('!strip' '!debug')
source=("$_name-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_name-$pkgver-linux-x86_64.tar.gz")
sha256sums=('1387053155d287377086cd27e2a9e59b6fb8e1a4adcfadfce5aca5e147471ffc')

package() {
  cd "$srcdir/$_name-$pkgver-linux-x86_64"

  # The app finds payload/ and doorstop/ beside its own file, so the bundle stays together.
  install -dm755 "$pkgdir/opt/$_name"
  cp -r --no-preserve=ownership rwpm rwpm-steam libsteam_api.so doorstop payload "$pkgdir/opt/$_name/"
  chmod 755 "$pkgdir/opt/$_name/rwpm" "$pkgdir/opt/$_name/rwpm-steam"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_name/rwpm" "$pkgdir/usr/bin/rwpm"

  for n in 16 32 48 64 128 256; do
    install -Dm644 "icons/rwpm-$n.png" "$pkgdir/usr/share/icons/hicolor/${n}x${n}/apps/rwpm.png"
  done
  install -Dm644 icons/rwpm.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rwpm.svg"
  install -Dm644 rwpm-mime.xml "$pkgdir/usr/share/mime/packages/rwpm.xml"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/rwpm.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=RimWorld Profile Manager
Comment=Separate RimWorld profiles with their own saves, settings and mods
Exec=rwpm %f
Icon=rwpm
Terminal=false
Categories=Game;Utility;
MimeType=application/x-rimrim;application/x-rimpack;
StartupWMClass=rwpm
DESKTOP

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r --no-preserve=ownership licenses "$pkgdir/usr/share/licenses/$pkgname/third-party"
}
