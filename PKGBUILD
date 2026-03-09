# Maintainer: KylerianHD (aka ToxicByte) <contact@kylerianhd.com>
pkgname=replay-bin
pkgver=8.7.0
pkgrel=4
pkgdesc="Replay - UI for generating songs with AI singers, RVC training and speech conversion. Offline, local, and free."
arch=('x86_64')
url="https://github.com/KylerianHD/replay-bin"
license=('GPL3 OR unknown')
depends=(
  gtk3
  libnotify
  nss
  libxss
  libxtst
  xdg-utils
  at-spi2-core
  util-linux-libs
  libsecret
)
optdepends=(
  "libappindicator3-1: A library to allow applications to export a menu into the panel. Based on KSNI it also works in KDE and will fallback to generic Systray support."
)
makedepends=()  # no build‐time deps, binaries ship pre‐built

source=(
  "Replay-${pkgver}.deb::https://github.com/KylerianHD/replay-bin/releases/download/${pkgver}/Replay-${pkgver}.deb"
)
sha256sums=('2cbdf0ce5ec26c6212ac3c34863b056182ab8e6dfba2bdfb37c2ed6504b6c258')

build() {
  :;
}

prepare() {
  cd "$srcdir"
  # unpack the .deb
  ar x "Replay-${pkgver}.deb"

  # now extract "control.tar.xz" and "data.tar.xz"
  tar -xJf control.tar.xz
  tar -xJf data.tar.xz
}

package() {
  cd "$srcdir"

  # 1) Unpack application into /opt/Replay
  tar -xJf data.tar.xz -C "$pkgdir"

  # 2) Launcher stub in /usr/bin
  # Pass --gtk-version=3 on GNOME to avoid GTK 2/3 vs GTK 4 symbol conflict
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/replay" <<'EOF'
#!/bin/sh
case "$XDG_CURRENT_DESKTOP" in
  *GNOME*)
    exec /opt/Replay/replay --gtk-version=3 "$@"
    ;;
  *)
    exec /opt/Replay/replay "$@"
    ;;
esac
EOF

  # 3) .desktop file
  install -Dm644 "$srcdir/usr/share/applications/replay.desktop" \
    "$pkgdir/usr/share/applications/replay.desktop"

  # 4) Icons (hicolor theme)
  cp -a "$srcdir/usr/share/icons/hicolor/"* \
     "$pkgdir/usr/share/icons/hicolor/"

  # 5) Bundle the control archive for reference
  install -Dm644 control.tar.xz \
    "$pkgdir/usr/share/doc/$pkgname/control.tar.xz"
  install -Dm644 control.tar.xz \
    "$pkgdir/usr/share/licenses/$pkgname/control.tar.xz"
}
