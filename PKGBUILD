# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=kitty-tune-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="SoundCloud and YouTube music player (upstream binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/alan7383/KittyTuneDesktop"
license=('MIT')
# jpackage bundles Java and FFmpeg. These are the system libraries declared
# by both upstream .debs, plus GTK for the bundled JRE's desktop integration.
depends=('alsa-lib' 'brotli' 'bzip2' 'expat' 'fontconfig' 'freetype2'
         'gcc-libs' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libbsd' 'libglvnd'
         'libmd' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext'
         'libxi' 'libxrender' 'libxtst' 'xdg-utils' 'zlib')
provides=("kitty-tune=${pkgver}")
conflicts=('kitty-tune')
options=('!strip' '!debug')
# Upstream declares MIT in the README but ships no standalone license text.
source=("${pkgname}-${pkgver}-README.md::https://raw.githubusercontent.com/alan7383/KittyTuneDesktop/v${pkgver}/README.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/alan7383/KittyTuneDesktop/releases/download/v${pkgver}/kitty-tune_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/alan7383/KittyTuneDesktop/releases/download/v${pkgver}/kitty-tune_${pkgver}_arm64.deb")
noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${pkgver}-aarch64.deb")
sha256sums=('5d7ad82556e36ab19c3044cb67e69dcfc012a44d9d4352f8d8d6723e07ca4482')
sha256sums_x86_64=('17134c24a5aeb68a345a042522b28588ce85a93d3970671dffd1ab533abb693e')
sha256sums_aarch64=('bec92345a76178914ed301d794382c676c61ca469f29ef058e8ad800f309e11f')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}-${CARCH}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" ./opt

  install -d "$pkgdir/usr/bin"
  ln -s /opt/kitty-tune/bin/KittyTune "$pkgdir/usr/bin/kitty-tune"

  # The .deb registers this through postinst, which pacman never executes.
  install -Dm644 "$pkgdir/opt/kitty-tune/lib/kitty-tune-KittyTune.desktop" \
    "$pkgdir/usr/share/applications/kitty-tune.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=kitty-tune|' \
    -e 's|^Icon=.*|Icon=kittytune|' \
    -e 's|^Categories=.*|Categories=AudioVideo;Audio;Player;|' \
    -e '/^MimeType=$/d' \
    "$pkgdir/usr/share/applications/kitty-tune.desktop"
  install -Dm644 "$pkgdir/opt/kitty-tune/lib/KittyTune.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/kittytune.png"

  install -Dm644 "$srcdir/${pkgname}-${pkgver}-README.md" \
    "$pkgdir/usr/share/licenses/$pkgname/README.md"
  install -Dm644 "$pkgdir/opt/kitty-tune/share/doc/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/copyright"

  # The in-app updater installs upstream's differently named kitty-tune
  # package. The conflict above prevents an unattended replacement; use an
  # AUR helper to update kitty-tune-bin instead.
}
