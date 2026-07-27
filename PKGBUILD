# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=waydroid-helper-bin
pkgver=0.2.9
pkgrel=2
pkgdesc="GUI application for Waydroid configuration and extension installation (upstream AppImage)"
arch=('x86_64')
url="https://github.com/ayasa520/waydroid-helper"
license=('GPL-3.0-or-later')
# the AppImage bundles Python, GTK4, VTE, adb and fakeroot; these are what is
# left over
depends=('glibc' 'wayland' 'libxcb' 'polkit' 'hicolor-icon-theme')
optdepends=('bindfs: shared folders support'
            'waydroid: the container this tool configures')
provides=('waydroid-helper')
conflicts=('waydroid-helper')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/waydroid-helper-${pkgver}-x86_64.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('4e477a02f7fb52e879aec3ab582995ccb3d2003dce24d9e3e71ea7576b12ac33')

prepare() {
  chmod +x "$srcdir/${pkgname}-${pkgver}.AppImage"
  "$srcdir/${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  local _root="$srcdir/squashfs-root"

  # upstream's AppImage payload, installed unchanged
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$_root/." "$pkgdir/opt/$pkgname/"
  rm -f "$pkgdir/opt/$pkgname/.DirIcon"

  # The payload is a PyInstaller bundle that locates its data through
  # $APPDIR, and AppRun resolves nothing by itself - so both entry points get
  # a wrapper rather than a symlink. The paths match what upstream's systemd
  # unit (/usr/bin/waydroid-helper) and polkit policy (/usr/bin/waydroid-cli)
  # expect, so those files can be installed unmodified.
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/waydroid-helper" << EOF
#!/bin/sh
export APPDIR=/opt/$pkgname
exec "\$APPDIR/AppRun" "\$@"
EOF
  cat > "$pkgdir/usr/bin/waydroid-cli" << EOF
#!/bin/sh
export APPDIR=/opt/$pkgname
exec "\$APPDIR/usr/bin/waydroid-cli" "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/waydroid-helper" "$pkgdir/usr/bin/waydroid-cli"

  # desktop integration has to live in the system tree to have any effect
  install -Dm644 "$_root/usr/share/applications/com.jaoushingan.WaydroidHelper.desktop" \
    "$pkgdir/usr/share/applications/com.jaoushingan.WaydroidHelper.desktop"
  install -Dm644 "$_root/usr/share/metainfo/com.jaoushingan.WaydroidHelper.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/com.jaoushingan.WaydroidHelper.metainfo.xml"
  install -Dm644 "$_root/usr/share/icons/hicolor/scalable/apps/com.jaoushingan.WaydroidHelper.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.jaoushingan.WaydroidHelper.svg"
  install -Dm644 "$_root/usr/share/icons/hicolor/symbolic/apps/com.jaoushingan.WaydroidHelper-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.jaoushingan.WaydroidHelper-symbolic.svg"
  install -Dm644 "$_root/usr/share/polkit-1/actions/com.jaoushingan.WaydroidHelper.policy" \
    "$pkgdir/usr/share/polkit-1/actions/com.jaoushingan.WaydroidHelper.policy"
  install -Dm644 "$_root/usr/share/dbus-1/system.d/id.waydro.Mount.conf" \
    "$pkgdir/usr/share/dbus-1/system.d/id.waydro.Mount.conf"
  install -Dm644 "$_root/usr/share/dbus-1/system-services/id.waydro.Mount.service" \
    "$pkgdir/usr/share/dbus-1/system-services/id.waydro.Mount.service"
  install -Dm644 "$_root/usr/lib/systemd/user/waydroid-monitor.service" \
    "$pkgdir/usr/lib/systemd/user/waydroid-monitor.service"

  install -Dm644 "$_root/usr/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
