# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=firedragon
_pkgver=13.10.0
_branding=dr460nized

__pkgname=$_pkgname
_rdns=org.garudalinux.$__pkgname

pkgname=$__pkgname-bin
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=2
pkgdesc="FireDragon is a cross-platform, feature-rich and privacy-focused web browser"
url="https://gitlab.com/garuda-linux/firedragon/firedragon13"
arch=(x86_64 aarch64)
license=(MPL-2.0)
depends=(alsa-lib
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
  ttf-font)
makedepends=(git)
optdepends=('hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($__pkgname-next-bin)
options=(!emptydirs)
install=$_pkgname.install
noextract=($__pkgname-v$_pkgver.linux-x64.tar.xz
  $__pkgname-v$_pkgver.linux-arm64.tar.xz)
source=($_pkgname::git+$url.git#tag=v$_pkgver)
source_x86_64=($__pkgname-v$_pkgver.linux-x64.tar.xz::$url/-/releases/v$_pkgver/downloads/$__pkgname.linux-x64.tar.xz)
source_aarch64=($__pkgname-v$_pkgver.linux-arm64.tar.xz::$url/-/releases/v$_pkgver/downloads/$__pkgname.linux-arm64.tar.xz)
sha256sums=('9e0e3953649c86c64aa4967c515fccc939703b43f795983a27da2aeffc6544e9')
sha256sums_x86_64=('76324eb89134efef15f2f55b5686c0008db8c30e8e6f89b59b9e00e6e3880754')
sha256sums_aarch64=('4d03a7284ee2cc46a0e520839e7019ec6f0ccd2f1cb40b383bd29ce50fd5485b')

package() {
  mkdir -p "$pkgdir/usr/lib"
  if [ $CARCH = x86_64 ]; then
    tar -xvf "$srcdir/$__pkgname-v$_pkgver.linux-x64.tar.xz" -C "$pkgdir/usr/lib"
  elif [ $CARCH = aarch64 ]; then
    tar -xvf "$srcdir/$__pkgname-v$_pkgver.linux-arm64.tar.xz" -C "$pkgdir/usr/lib"
  fi

  local appdir="$pkgdir/usr/lib/$_pkgname"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" << END
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

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" << END
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
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 "$_pkgname/branding/$_branding/default$i.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_rdns.png"
  done

  install -Dvm644 $_pkgname/assets/$_rdns.desktop -t "$pkgdir/usr/share/applications"
  install -Dvm644 $_pkgname/assets/$_rdns.metainfo.xml -t "$pkgdir/usr/share/metainfo"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
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
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/$_pkgname.search-provider.ini" << END
[Shell Search Provider]
DesktopId=$_pkgname.desktop
BusName=org.mozilla.${_pkgname//-/_}.SearchProvider
ObjectPath=/org/mozilla/${_pkgname//-/_}/SearchProvider
Version=2
END
}
