# Maintainer: canonrebel04 <117294984+canonrebel04@users.noreply.github.com>
# Binary package of canonrebel04/Mercury (Firefox 160+ fork). Built with
# PGO+LTO and AVX2 / x86-64-v3; it will not run on CPUs without AVX2.
# The tarball is produced by ./package.sh and attached to GitHub Releases
# tagged v$pkgver (for example v160.0.1). Do not compile the browser here.

pkgname=mercury-browser-v3-bin
pkgver=160.0.1
pkgrel=1
pkgdesc="Privacy-focused Firefox fork with compiler optimizations (binary release; requires AVX2 / x86-64-v3)"
arch=('x86_64')
url="https://github.com/canonrebel04/Mercury"
license=('MPL-2.0')
depends=(
  bash
  glibc
  gcc-libs
  gtk3
  hicolor-icon-theme
  libxt
  mime-types
  dbus-glib
  nss
  ttf-font
)
optdepends=(
  'ffmpeg: H264/AAC/MP3 decoding'
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
provides=('mercury-browser')
conflicts=('mercury-browser')
# Does not conflict with mercury-browser-avx2-bin (different paths and binary
# names), firefox, or the unrelated mercury-browser-bin AUR placeholder.
# Uninstall the old 129.x AVX2 package yourself.
options=('!strip' '!debug' '!emptydirs')
install=$pkgname.install

# Placeholder tarball checksum is replaced by release.sh and by the
# aur-publish workflow from the GitHub Release asset. Local files below
# are hashed next to this PKGBUILD; release.sh rewrites all three sums.
source=(
  "mercury-$pkgver.en-US.linux-$CARCH.tar.xz::https://github.com/canonrebel04/Mercury/releases/download/v$pkgver/mercury-$pkgver.en-US.linux-$CARCH.tar.xz"
  "mercury-browser.sh"
  "mercury-browser.desktop"
)
sha256sums=(
  '29e4eb37f404c6a4d470f2d28d2387874f4969720fa3b21221c81fc0c1693d8a'
  '277c3f2fcf97a354e3a8b31d8414277e4538492e85595731dc2b85784ba23677'
  'e2e5bea954b0ca456c069aa9f8e89fae5ba474426c46df6e47e6930962459771'
)

package() {
  install -d "$pkgdir/opt"
  cp -r "$srcdir/mercury" "$pkgdir/opt/mercury"

  install -Dm755 "$srcdir/mercury-browser.sh" "$pkgdir/usr/bin/mercury-browser"
  install -Dm644 "$srcdir/mercury-browser.desktop" \
    "$pkgdir/usr/share/applications/mercury-browser.desktop"

  local i icon
  for i in 16 22 24 32 48 64 128 256; do
    icon="$pkgdir/opt/mercury/browser/chrome/icons/default/default${i}.png"
    if [[ -f $icon ]]; then
      install -Dm644 "$icon" \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/mercury-browser.png"
    fi
  done

  local lic
  for lic in LICENSE LICENSE.md license/LICENSE; do
    if [[ -f $pkgdir/opt/mercury/$lic ]]; then
      install -Dm644 "$pkgdir/opt/mercury/$lic" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      break
    fi
  done

  # Prefer the system NSS trust store when the bundled library is present,
  # matching firefox-bin.
  if [[ -e $pkgdir/opt/mercury/libnssckbi.so ]]; then
    ln -sf /usr/lib/libnssckbi.so "$pkgdir/opt/mercury/libnssckbi.so"
  fi

  if [[ -L $pkgdir/opt/mercury/dictionaries ]] || [[ ! -e $pkgdir/opt/mercury/dictionaries ]]; then
    rm -f "$pkgdir/opt/mercury/dictionaries"
    ln -s /usr/share/hunspell "$pkgdir/opt/mercury/dictionaries"
  fi
}
