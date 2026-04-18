# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=firedragon
_pkgver=13.0.0-rc.7

__pkgname=$_pkgname-catppuccin

pkgname=$__pkgname-next-bin
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Upcoming FireDragon v13"
url="https://gitlab.com/garuda-linux/firedragon/firedragon13"
arch=(x86_64 aarch64)
license=(MPL-2.0)
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
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
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
provides=($_pkgname)
conflicts=($_pkgname)
options=(
  !emptydirs
)
source=(
  $_pkgname::git+$url.git#tag=v$_pkgver
)
source_x86_64=(
  $__pkgname-v$_pkgver.linux-x64.tar.xz::$url/-/releases/v$_pkgver/downloads/$__pkgname.linux-x64.tar.xz
)
source_aarch64=(
  $__pkgname-v$_pkgver.linux-arm64.tar.xz::$url/-/releases/v$_pkgver/downloads/$__pkgname.linux-arm64.tar.xz
)
sha256sums=('50f74e0399b6963f24f15cf94dbb25988f1b37b369131800a236d6794d19e888')
sha256sums_x86_64=('50dd49823a6d64313f03a4584e11ddef77dd03698017afbbc5098f35631aee04')
sha256sums_aarch64=('499e36b388b64f8285b02cd6d2d4bcbeed3ac51e5311dbf8ac6d399a88c18530')
noextract=(
  $__pkgname-v$_pkgver.linux-x64.tar.xz
  $__pkgname-v$_pkgver.linux-arm64.tar.xz
)


package() {
  mkdir -p "$pkgdir/usr/lib"
  if [ $CARCH = x86_64 ]; then
    tar -xvf "$srcdir/$__pkgname-v$_pkgver.linux-x64.tar.xz" -C "$pkgdir/usr/lib"
  elif [ $CARCH = aarch64 ]; then
    tar -xvf "$srcdir/$__pkgname-v$_pkgver.linux-arm64.tar.xz" -C "$pkgdir/usr/lib"
  fi

  local appdir="$pkgdir/usr/lib/$_pkgname"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
[Global]
id=${pkgname}
version=${pkgver}-${pkgrel}
about=${pkgdesc}

[Preferences]
app.distributor=garudalinux
app.distributor.channel=${pkgname}
app.partner.garudalinux=garudalinux
END

  # Install desktop icons and metadata
  local i
  for i in 16 32 48 64 128; do
    install -Dvm644 "$appdir/browser/chrome/icons/default/default$i.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dvm644 $_pkgname/assets/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dvm644 $_pkgname/assets/org.garudalinux.$__pkgname.metainfo.xml -t "$pkgdir/usr/share/metainfo"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/$_pkgname "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"

  # Use system certificates
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/_}/SearchProvider
Version=2
END
}
