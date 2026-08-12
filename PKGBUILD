# Maintainer: prowly <pmbaprow@gmail.com>
#
# Prebuilt counterpart to the `tennoworth` source package, for people who don't
# want to compile Rust + a webview. It ships ONE dynamically-linked executable
# and resolves webkit2gtk/gtk3 from the system at runtime — it does not bundle
# libraries. That distinction is the whole point: the AppImage this project
# used to publish bundled the build machine's WebKitGTK and died with
# `Could not create default EGL display: EGL_BAD_PARAMETER` against a
# rolling-release Mesa, painting a white window.
#
# The binary is built in CI on ubuntu-22.04 so its glibc floor stays at 2.35;
# a binary built on Arch would demand a glibc newer than many users have.
#
# Tradeoff vs the source package: this one breaks when Arch bumps the
# webkit2gtk soname and stays broken until it is rebuilt and republished,
# whereas `tennoworth` simply recompiles against whatever is installed. If this
# package ever fails to start after a system upgrade, install `tennoworth`.
#
# Updates come from pacman — the in-app updater no-ops on Linux.

pkgname=tennoworth-bin
_pkgname=tennoworth
pkgver=0.3.7
pkgrel=1
pkgdesc="Warframe inventory + market dashboard — see what's worth selling right now (prebuilt)"
arch=('x86_64')
url="https://github.com/tennoworth/tennoworth"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Same capability grant as the source package — see tennoworth.install there
# for why. Both packages ship their own copy because each AUR package is its
# own git repo and cannot reference a file outside itself.
install=tennoworth-bin.install
options=('!strip' '!debug')
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/desktop-v$pkgver/tennoworth-desktop-linux-x86_64.tar.gz")
sha256sums=('ac6533a8276b590675c4aef535d2c56d15bb3278d67610fcafc4d617387c6596')

_dir="tennoworth-desktop-linux-x86_64"

package() {
  cd "$_dir"

  install -Dm755 tennoworth-desktop "$pkgdir/usr/bin/tennoworth-desktop"

  # Without the desktop entry the window and taskbar fall back to a generic WM
  # avatar — the app sets its own window icon, but the shell matches on the
  # .desktop file (StartupWMClass=tennoworth-desktop — the binary basename,
  # which is what GTK reports as WM_CLASS).
  install -Dm644 tennoworth.desktop \
    "$pkgdir/usr/share/applications/tennoworth.desktop"

  for size in 32 64 128; do
    install -Dm644 "icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/tennoworth.png"
  done
  install -Dm644 "icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/tennoworth.png"
  install -Dm644 "icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/tennoworth.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
