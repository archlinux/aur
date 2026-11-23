# Maintainer: flydut <lbaofengflydut@gmail.com>
#
# Prebuilt binary package built from the upstream Debian release, so that
# users do not need a full JDK/Maven toolchain to run EasyPostman.
# The upstream .deb already bundles a trimmed Java runtime.

pkgname=easypostman-bin
pkgver=6.3.4
pkgrel=1
pkgdesc='An open-source API debugging and stress testing tool inspired by Postman and JMeter'
arch=('x86_64')
url='https://github.com/lakernote/easy-postman'
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'brotli'
  'bzip2'
  'freetype2'
  'hicolor-icon-theme'
  'libpng'
  'libx11'
  'libxau'
  'libxcb'
  'libxdmcp'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'xdg-utils'
  'zlib'
)
provides=('easypostman')
conflicts=('easypostman')
options=('!strip' '!debug')
makedepends=('imagemagick')

source=(
  "${url}/releases/download/v${pkgver}/EasyPostman-${pkgver}-linux-amd64.deb"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  'dcc8c6c19236d63dc58e5e9ded290849a131bcd07a63a1747b8a505b4bdc6e3c'
  'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
)

prepare() {
  cd "$srcdir"

  # Unpack the Debian archive: control.tar.zst holds the maintainer scripts,
  # data.tar.zst holds the /opt/easypostman tree.
  bsdtar -xf "EasyPostman-${pkgver}-linux-amd64.deb" data.tar.zst
  bsdtar -xf data.tar.zst

  # Upstream ships a 192x192 icon inside the application jar; the .deb only
  # contains a 32x32 copy used by its own desktop entry.
  bsdtar -xOf 'opt/easypostman/lib/app/easy-postman.jar' icons/icon.png > 'easypostman-192.png'
}

package() {
  install -d "$pkgdir/opt"
  # Ownership is normalised to root by fakeroot when the package is built, so
  # there is no need to carry the source uid/gid over.
  cp -a --no-preserve=ownership 'opt/easypostman' "$pkgdir/opt/"

  # Drop the Debian-only bits: upstream desktop entries live next to the
  # application and the doc directory only carries a copyright stub.
  rm -f "$pkgdir/opt/easypostman/lib/"*.desktop
  rm -rf "$pkgdir/opt/easypostman/share"

  # Icons: the upstream .deb ships an ugly 32x32 bitmap next to the launchers,
  # so every hicolor size is derived from the 192x192 icon embedded in the jar.
  # The desktop entry points straight at the 192x192 file, which keeps small
  # panels and launchers from picking a low-resolution variant.
  install -Dm644 'easypostman-192.png' \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/easypostman.png"
  for size in 16 22 24 32 48 64 128; do
    install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    magick 'easypostman-192.png' -background none -resize "${size}x${size}" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/easypostman.png"
  done

  # Command line launchers.
  install -d "$pkgdir/usr/bin"
  ln -s /opt/easypostman/bin/EasyPostman "$pkgdir/usr/bin/easypostman"
  ln -s /opt/easypostman/bin/EasyPostmanMCP "$pkgdir/usr/bin/easypostman-mcp"

  # Desktop entry (the Debian package generates this at postinst time via
  # xdg-desktop-menu; pacman expects the file to be installed directly).
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/easypostman.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=EasyPostman
GenericName=API Testing Tool
Comment=An open-source API debugging and stress testing tool
Exec=/opt/easypostman/bin/EasyPostman %U
Icon=/usr/share/icons/hicolor/192x192/apps/easypostman.png
Terminal=false
Categories=Development;
Keywords=api;http;rest;postman;testing;debug;
StartupWMClass=com-laker-postman-App
StartupNotify=true
MimeType=application/json;
EOF

  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
