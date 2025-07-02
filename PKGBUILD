# Maintainer: KylerianHD (aka ToxicByte) <contact@kylerianhd.com>
pkgname=replay-bin
pkgver=7.3.3
pkgrel=1
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
sha256sums=('5d3cc65ae2f8fcdd794afbc244dc162e7c14af615b51dab96d4760a1f0620571')

build() {
  :;
}

prepare() {
  cd "$srcdir"
  # unpack the .deb
  ar x "Replay-${pkgver}.deb"

  # now extract "control.tar.gz" and "data.tar.xz"
  tar -xzf control.tar.gz
  tar -xJf data.tar.xz
}

package() {
  cd "$srcdir"

  # 1) Unpack application into /opt/Replay
  tar -xJf data.tar.xz -C "$pkgdir"

  # 2) Launcher stub in /usr/bin
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/replay" <<EOF
#!/bin/sh
exec /opt/Replay/replay "\$@"
EOF

  # 3) .desktop file
  install -Dm644 "$srcdir/usr/share/applications/replay.desktop" \
    "$pkgdir/usr/share/applications/replay.desktop"

  # 4) Icons (hicolor theme)
  cp -a "$srcdir/usr/share/icons/hicolor/"* \
     "$pkgdir/usr/share/icons/hicolor/"

  # 5) Bundle the control archive for reference
  install -Dm644 control.tar.gz \
    "$pkgdir/usr/share/doc/$pkgname/control.tar.gz"
  install -Dm644 control.tar.gz \
    "$pkgdir/usr/share/licenses/$pkgname/control.tar.gz"
}
