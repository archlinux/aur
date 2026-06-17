# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>
#
# Fetching the signing key:
#     https://mullvad.net/en/help/verifying-mullvad-browser-signature
# If you can't open the page, here's the important line:
#     gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
#
# Please discuss bugs in AUR comments before reporting them upstream!

pkgname=mullvad-browser-bin
pkgver=15.0.16
pkgrel=1
pkgdesc='Privacy-focused web browser developed by Mullvad VPN and the Tor Project'
arch=(x86_64)
url=https://mullvad.net/en/browser
license=(MPL-2.0) # see about:license
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg4.4
  fontconfig
  freetype2
  libgcc
  libstdc++
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxrandr
  libxrender
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulse-native-provider: Sound support when using PipeWire or PulseAudio' # thanks to @cyberpunkrocker for the suggestion
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
provides=(mullvad-browser=$pkgver mullvad-browser)
conflicts=(mullvad-browser)

# mullvad.net is blocked or slow in many countries around the world.
source=(
  #https://github.com/mullvad/mullvad-browser/releases/download/$pkgver/mullvad-browser-linux-x86_64-$pkgver.tar.xz{,.asc}
  #https://cdn.mullvad.net/browser/$pkgver/mullvad-browser-linux-x86_64-$pkgver.tar.xz{,.asc}
  https://dist.torproject.org/mullvadbrowser/$pkgver/mullvad-browser-linux-x86_64-$pkgver.tar.xz{,.asc}
  #https://tor.eff.org/dist/mullvadbrowser/$pkgver/mullvad-browser-linux-x86_64-$pkgver.tar.xz{,.asc}

  mullvad-browser.sh
  mullvad-browser.desktop
)
validpgpkeys=(
  'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290' # Tor Browser Developers (signing key) <torbrowser@torproject.org>
)
changelog='mullvad-browser.changelog'

sha256sums=('9a541401d19c3946ea45e44eaa1b387f049499366a400121c2c83aba5336871e'
            'SKIP'
            '9e1a8b33705972bd372be3af3bdf3039297e6d568e53dcf2e3da03f6f2f2aadd'
            '6e218bdd9c442143088dec784d898f2668e36ae55f6cde45038408bc2bd59488')

package() {
  local pkg=${pkgname%%-bin}

  # cli wrapper
  install -Dvm755 "$pkg.sh" "$pkgdir/usr/bin/$pkg"

  # desktop file
  install -Dvm644 "$pkg.desktop" -t "$pkgdir/usr/share/applications/"

  cd mullvad-browser

  # only owner has access to all files
  chmod --recursive --verbose a+r .

  # mark all files executable by the owner as executable by all users
  # `-executable` finds nothing on `noexec` filesystems (thank you vesinum@aur)
  find . -perm -u=x -execdir chmod --verbose a+x '{}' +

  # copy files from archive
  install -dvm755 "$pkgdir/opt/$pkg/"
  cp --archive --verbose Browser/. "$pkgdir/opt/$pkg/"

  # fix "open file" dialog crash
  sed -i 's|<dir prefix="cwd">fonts</dir>|<dir>/opt/mullvad-browser/fonts</dir>|' \
    "$pkgdir/opt/$pkg/fonts/fonts.conf"

  # create profiles in ~
  install -Dvm644 /dev/null "$pkgdir/opt/$pkg/system-install"

  # disable built-in updates
  install -Dvm644 /dev/null "$pkgdir/opt/$pkg/is-packaged-app"

  # icons
  local size
  for size in 16 32 48 64 128; do
    install -Dvm644 "$pkgdir/opt/$pkg/browser/chrome/icons/default/default$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkg.png"
  done
  install -Dvm644 "$pkgdir/opt/$pkg/browser/chrome/icons/default/about-logo.svg" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkg.svg"

  # license files
  install -dvm755 "$pkgdir/usr/share/licenses/"
  ln -sfv "/opt/$pkg/MullvadBrowser/Docs/Licenses" "$pkgdir/usr/share/licenses/$pkg"

  # distribution channel
  install -Dvm644 /dev/stdin "$pkgdir/opt/$pkg/distribution/distribution.ini" <<END
[Global]
id=archlinux-aur
version=1.0
about=Mullvad Browser for Arch Linux (AUR)

[Preferences]
app.distributor=archlinux-aur
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux-aur
END

  # GNOME search provider (while the browser is running)
  install -Dvm644 /dev/stdin "$pkgdir/opt/$pkg/browser/defaults/preferences/vendor.js" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$pkg.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=mullvad-browser.desktop
BusName=org.mozilla.mullvadbrowser.SearchProvider
ObjectPath=/org/mozilla/mullvadbrowser/SearchProvider
Version=2
END
}
