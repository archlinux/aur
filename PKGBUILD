# Maintainer: Bram <bram@cerebralmisfire.net>
#
# AUR PKGBUILD for Nextcloud Office Desktop Editors, the Nextcloud-branded
# build of the Euro-Office Desktop Editors (a fork of ONLYOFFICE)
# https://github.com/Euro-Office/DesktopEditors
#
# This repackages the upstream .deb releases published at
# https://github.com/nextcloud-releases/Office-DesktopEditors
# (binaries only; the source lives in the Euro-Office repositories).
# The Qt/CEF bundle is kept as shipped; only Qt build leftovers and
# developer tooling that nothing in the app loads are removed.
#
# Updating: bump pkgver (reset pkgrel=1), run `updpkgsums`, test with
# `makepkg -si`, then regenerate .SRCINFO before committing.
#
# Known caveat: the app will not start while ONLYOFFICE Desktop Editors
# is running; both bind UDP 127.0.0.1:13012 as a single-instance lock,
# and Nextcloud Office exits silently with status 0.
#
# Packaging repo: https://codeberg.org/cerebralmisfire/nextcloud-office-nextcloudoffice-bin
# Publication target: aur.archlinux.org/packages/nextcloud-office-nextcloudoffice-bin

pkgname=nextcloud-office-nextcloudoffice-bin
pkgver=9.3.8
pkgrel=1
pkgdesc="Nextcloud Office desktop editors for documents, spreadsheets, presentations and PDFs (Euro-Office based)"
arch=('x86_64' 'aarch64')
url="https://github.com/nextcloud-releases/Office-DesktopEditors"
# AGPL-3.0-only (with Ascensio's Section 7 terms) for the code, CC-BY-SA-4.0 for
# GUI art and docs, BSD-3-Clause (CEF) and MIT (SingleApplication) per 3DPARTYLICENSE
license=('AGPL-3.0-only' 'CC-BY-SA-4.0' 'BSD-3-Clause' 'MIT')
# Libraries the bundle links to from the system (readelf -d over every ELF
# file, minus the Qt SQL drivers, which are never loaded), plus what it runs
# as programs: sh for the launcher, curl for downloads, xdg-utils for links.
# The fonts are the ones upstream's .deb depends on.
depends=('alsa-lib' 'at-spi2-core' 'brotli' 'bzip2' 'cairo' 'curl' 'dbus'
         'expat' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'harfbuzz' 'hicolor-icon-theme' 'krb5' 'libcups' 'libdrm' 'libgcc'
         'libglvnd' 'libnotify' 'libpulse' 'libstdc++' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxkbcommon-x11' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'sh'
         'ttf-carlito' 'ttf-dejavu' 'ttf-liberation' 'wayland' 'xcb-util'
         'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms'
         'xcb-util-renderutil' 'xcb-util-wm' 'xdg-utils' 'zlib' 'zstd')
optdepends=(
  'xdg-user-dirs: --new-document-templates option'
  'ttf-ms-fonts: better compatibility with Microsoft Office documents'
)
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug' '!emptydirs')

_dl="$url/releases/download/v$pkgver"
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$_dl/${pkgname%-bin}_$pkgver-0_amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$_dl/${pkgname%-bin}_$pkgver-0_arm64.deb")
noextract=("$pkgname-$pkgver-x86_64.deb" "$pkgname-$pkgver-aarch64.deb")
sha256sums_x86_64=('4d24d9772260757a50266385d760deefe804a915a94b3a79987ae390fca37a51')
sha256sums_aarch64=('45eafab9ea2b79d798fe461ddbf0824639f2f38ec09ae737bebf0f668affef62')

package() {
  # the app in /opt plus the launcher, desktop entry, icons, docs and
  # licences; /etc only holds an empty directory
  bsdtar -xOf "$srcdir/$pkgname-$pkgver-$CARCH.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" ./opt ./usr

  local _app="$pkgdir/opt/nextcloud-office/nextcloudoffice"

  # Qt build leftovers, not needed at runtime
  rm -rf "$_app"/{cmake,pkgconfig,objects-RelWithDebInfo}

  # Qt developer tooling (Designer, qmllint, qmlls plugins) that nothing in
  # the app loads; SpatialAudio links against unbundled Quick3D libraries
  rm -rf "$_app"/{designer,qmllint,qmlls}
  rm -f "$_app"/libQt6{Designer,DesignerComponents,Quick3DSpatialAudio}.so*

  # Arch convention: licenses under the package name
  mv "$pkgdir/usr/share/licenses/${pkgname%-bin}" "$pkgdir/usr/share/licenses/$pkgname"
  # Only file stating the AGPL Section 7 terms and the CC-BY-SA-4.0 grant
  install -Dm644 "$pkgdir/usr/share/doc/${pkgname%-bin}/copyright" -t "$pkgdir/usr/share/licenses/$pkgname"/

  # Debian-only changelog
  rm -f "$pkgdir/usr/share/doc/${pkgname%-bin}/changelog.Debian.gz"
}
