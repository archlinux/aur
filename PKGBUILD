# Maintainer: yhshzh0 <yhshzh0@gmail.com>

pkgname=tang-dynasty-bin
pkgver=2026.1.SP3
pkgrel=1
pkgdesc='Tang Dynasty FPGA development tools for Anlogic devices (binary release)'
arch=('x86_64')
url='https://www.anlogic.com/'
# Upstream does not include a software license text in the Linux archive.
license=('LicenseRef-proprietary')
depends=(
  'at-spi2-core' 'bash' 'cairo' 'coreutils' 'dbus' 'fontconfig' 'freetype2'
  'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'gtk3' 'hicolor-icon-theme' 'krb5' 'libdrm'
  'libgcc' 'libstdc++'
  'libglvnd' 'libice' 'libsm' 'libusb' 'libx11' 'libxau' 'libxcb' 'libxext'
  'libxi' 'libxrender' 'pango' 'systemd-libs' 'tcl' 'xcb-util' 'zlib'
)
makedepends=('patchelf')
optdepends=('xorg-xwayland: run the bundled X11 GUI in a Wayland session')
provides=("tang-dynasty=$pkgver")
conflicts=('tang-dynasty')
options=('!strip' '!debug')

_archive="TD_Release_${pkgver/.SP/_SP}_NL"
# Download from https://www.anlogic.com/support/tools-downloads
# (Software tools -> TD Linux -> TD_6.2; an eligible account is required).
# Place the original ZIP next to this PKGBUILD before running makepkg.
source=(
  "local://$_archive.zip"
  'tang-dynasty.sh'
  'tang-dynasty.desktop'
  'tang-dynasty.png'
  '70-anlogic-jtag.rules'
)
sha256sums=(
  '314b621cb6fc4164c245b29e78e36a22f386a5248c03502b800a37e230628280'
  '7cebf45bc62d5d56b4e649efcac0d90f21af64488f399243c78c274c0c98159e'
  '4da15f38fd29b8098e9337f50e0dfeafe9f1130ef724504037b87950c9e52c72'
  'c7518eb2fe0ebafbeadba36a80616892403e89338eb8392aedaeb24ecfbb6040'
  '9f2f988e37fa323a45ce8c702aefb16121ff4ad3303a2658caaae3bcd53ca9bb'
)

prepare() {
  cd "$srcdir/$_archive"

  # Drop absolute build-host paths (and an empty current-directory entry).
  local binary
  for binary in bin/{IpTool,alps,design_integrator,hpfTool,mpack} \
    lib/Qt/lib/libxkbcommon-x11.so.0; do
    patchelf --remove-rpath "$binary"
  done

  # Use Arch's C++ runtime, including when loading Mesa graphics drivers.
  rm -f lib/libstdc++.so.6

  # These plugins require Qt modules absent from the vendor's Qt distribution.
  # Loading Arch's Qt modules into the bundled Qt can cause ABI mismatches.
  rm -f lib/Qt/plugins/platforms/libqeglfs.so \
    lib/Qt/plugins/platforms/libqwayland-*.so \
    lib/Qt/plugins/platforms/libqwebgl.so \
    lib/Qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so
}

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -a --no-preserve=ownership "$srcdir/$_archive/." "$pkgdir/opt/$pkgname/"

  install -Dm755 "$srcdir/tang-dynasty.sh" "$pkgdir/usr/bin/tang-dynasty"
  install -Dm644 "$srcdir/tang-dynasty.desktop" \
    "$pkgdir/usr/share/applications/tang-dynasty.desktop"
  install -Dm644 "$srcdir/tang-dynasty.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/tang-dynasty.png"
  install -Dm644 "$srcdir/70-anlogic-jtag.rules" \
    "$pkgdir/usr/lib/udev/rules.d/70-anlogic-jtag.rules"
}
