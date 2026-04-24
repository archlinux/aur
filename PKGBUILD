# Maintainer: riddix <github@egu-rel.de>

pkgname=alderon-games-launcher-bin
_pkgname=alderon-games-launcher
pkgver=1.3.57
pkgrel=1
pkgdesc="Alderon Games Launcher (Path of Titans)"
arch=('x86_64')
url="https://alderongames.com"
license=('LicenseRef-alderon-proprietary')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=('libappindicator-gtk3: tray icon support')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver.deb::https://launcher-cdn.alderongames.com/AlderonGamesLauncher-${pkgver}.deb")
sha256sums=('7da2bb0b80f7cf53c347265ada949d9155aa346066f1dfa403e44c5f2401835a')

package() {
  cd "$srcdir"
  bsdtar -xf "$_pkgname-$pkgver.deb"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  install -d "$pkgdir/opt"
  mv "$pkgdir/opt/Alderon Games Launcher" "$pkgdir/opt/$_pkgname"

  # The launcher picks its update provider by shelling out to `dpkg -l` and
  # `rpm -q`. On Arch both fail, a variable ends up undefined, and the next
  # line throws silently inside the main process — no window, no log, nothing.
  # This shim makes the rpm probe succeed so the RpmUpdater branch is taken.
  # Actual updates still go through pacman; the shim just unblocks startup.
  install -d "$pkgdir/opt/$_pkgname/shims"
  cat > "$pkgdir/opt/$_pkgname/shims/rpm" <<EOF
#!/bin/sh
if [ "\$1" = "-q" ] && [ "\$2" = "$_pkgname" ]; then
  echo "$_pkgname-$pkgver-$pkgrel"
  exit 0
fi
exit 1
EOF
  chmod 755 "$pkgdir/opt/$_pkgname/shims/rpm"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
export PATH="/opt/$_pkgname/shims:\$PATH"
exec "/opt/$_pkgname/$_pkgname" --ozone-platform=x11 "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$_pkgname"

  sed -i "s|\"/opt/Alderon Games Launcher/$_pkgname\"|/usr/bin/$_pkgname|" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  rm -rf "$pkgdir/usr/share/doc"
}
