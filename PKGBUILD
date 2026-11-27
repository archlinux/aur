# Maintainer: Joakim Roffe <joakim@roffe.nu>
pkgname=canmonitor-git
pkgver=1.0.2.r4.gcc28faf
pkgrel=1
pkgdesc="CAN bus monitor built with Fyne on top of gocan v2"
arch=('x86_64')
url="https://github.com/roffe/canmonitor"
license=('MIT')
depends=('libusb' 'libftdi' 'libgl' 'libxkbcommon' 'wayland' 'hicolor-icon-theme')
makedepends=('git' 'go' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi')
provides=('canmonitor')
conflicts=('canmonitor')
source=("git+https://github.com/roffe/canmonitor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/canmonitor"
  git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/canmonitor"
  export GOWORK=off
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  # ponytail: go run pins the fyne CLI instead of adding an AUR makedep; release embeds FyneApp.toml metadata + icon
  go run fyne.io/tools/cmd/fyne@v1.7.4 release --tags canlib,canusb,combi,ftdi,j2534,pcan,rcan,socketcan
}

package() {
  cd "$srcdir/canmonitor"
  # fyne release output: usr/local tree (bin, .desktop, pixmap)
  # ponytail: install files directly — the bundled Makefile drops the pixmap's .png extension (fyne tools bug)
  rm -rf "$srcdir/fyne-pkg"
  mkdir -p "$srcdir/fyne-pkg"
  tar -xf canmonitor.tar.xz -C "$srcdir/fyne-pkg" --strip-components=1
  install -Dm755 "$srcdir/fyne-pkg/usr/local/bin/canmonitor" "$pkgdir/usr/bin/canmonitor"
  install -Dm644 "$srcdir/fyne-pkg/usr/local/share/pixmaps/com.roffe.canmonitor.png" "$pkgdir/usr/share/pixmaps/com.roffe.canmonitor.png"
  install -Dm644 "$srcdir/fyne-pkg/usr/local/share/applications/com.roffe.canmonitor.desktop" "$pkgdir/usr/share/applications/com.roffe.canmonitor.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # put us in the Roffe submenu (matched by the menu merge below)
  sed -i 's/^Name=.*/Name=CAN Monitor/' "$pkgdir/usr/share/applications/com.roffe.canmonitor.desktop"
  sed -i '/^Categories=/d' "$pkgdir/usr/share/applications/com.roffe.canmonitor.desktop"
  printf 'Categories=X-Roffe;Utility;\n' >> "$pkgdir/usr/share/applications/com.roffe.canmonitor.desktop"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/desktop-directories/Roffe.directory" <<'EOF'
[Desktop Entry]
Type=Directory
Name=Roffe
Icon=applications-utilities
EOF

  # ponytail: XDG menu merge is the only portable way to get a real submenu (KDE/XFCE/LXQt honour it, GNOME Shell ignores folders)
  install -Dm644 /dev/stdin "$pkgdir/etc/xdg/menus/applications-merged/roffe.menu" <<'EOF'
<!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN"
 "http://www.freedesktop.org/standards/menu-spec/menu-1.0.dtd">
<Menu>
  <Name>Applications</Name>
  <Menu>
    <Name>Roffe</Name>
    <Directory>Roffe.directory</Directory>
    <Include>
      <Category>X-Roffe</Category>
    </Include>
  </Menu>
</Menu>
EOF
}
