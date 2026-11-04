# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=filee-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Offline file converter for images, PDF, Office, HWP, video, audio, e-books and archives (upstream binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/KnifeLemon/Filee"
license=('MIT')
# The bundle carries its own .NET runtime. These are the system libraries it
# still loads, as listed in upstream's INSTALL.txt.
depends=('glibc' 'gcc-libs' 'icu' 'openssl' 'krb5' 'zlib' 'fontconfig' 'freetype2'
         'libx11' 'libice' 'libsm' 'libxrandr' 'libxkbcommon' 'libxi' 'libxtst' 'libxt'
         'libinput' 'systemd-libs' 'wayland' 'hicolor-icon-theme')
# Filee cannot download LibreOffice and Ghostscript on Linux. The others it
# can download itself, but it uses a system copy when there is one.
optdepends=('libreoffice: Office documents'
            'ghostscript: PostScript and PDF compression'
            'ffmpeg: video and audio'
            'pandoc-cli: more document formats'
            'calibre: e-books'
            'noto-fonts-cjk: Korean, Chinese and Japanese text')
provides=('filee')
conflicts=('filee')
options=('!strip' '!debug')

source=("com.filee.app.desktop")
sha256sums=('7924b339c9845b737fc76dc5f779f6d4d63a606990fcccfa40052d4e5a46b596')

source_x86_64=("https://github.com/KnifeLemon/Filee/releases/download/v${pkgver}/Filee-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('2f3cccc927fd9276acf0d08dfb16203d57cfd1e3025659403de5c6f247e1ea9b')

source_aarch64=("https://github.com/KnifeLemon/Filee/releases/download/v${pkgver}/Filee-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('2e02fd85d154c6e5da27699b44cbd0b4e9a508a2a687e5b6459bd6ba2c4866da')

package() {
  local _dir="$srcdir/Filee-${pkgver}-linux-x64"
  [[ $CARCH == aarch64 ]] && _dir="$srcdir/Filee-${pkgver}-linux-arm64"

  # upstream's self-contained bundle, without its scripts that copy it into
  # the home directory
  install -d "$pkgdir/opt/filee"
  cp -a "$_dir/." "$pkgdir/opt/filee/"
  rm "$pkgdir/opt/filee/"{install,uninstall}.sh

  # same command name as upstream's install.sh gives the CLI
  install -d "$pkgdir/usr/bin"
  ln -s /opt/filee/filee-cli "$pkgdir/usr/bin/filee"

  install -Dm644 "$srcdir/com.filee.app.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_dir/filee.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/filee.png"

  # KWin script for the experimental Wayland gesture, so Plasma users can
  # turn it on in System Settings
  install -d "$pkgdir/usr/share/kwin/scripts"
  cp -r "$_dir/kwin/filee-donut" "$pkgdir/usr/share/kwin/scripts/"

  install -Dm644 "$_dir/LICENSE" "$_dir/THIRD-PARTY-NOTICES.md" \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
