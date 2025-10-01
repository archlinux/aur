# Maintainer:
# Contributor: Figue <ffigue at gmail dot com>

: ${_install_path:=usr/lib}

_pkgname="icecat"
pkgname="$_pkgname-bin"
pkgver=140.3.1
pkgrel=1
pkgdesc="GNU version of the Firefox ESR browser"
url="https://icecatbrowser.org"
license=('MPL-2.0')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_dl_url="https://icecatbrowser.org/assets/icecat/$pkgver"
_dl_file="icecat-$pkgver.en-US.linux-$CARCH.tar.xz"

noextract=("$_dl_file")

source=("$_dl_url/$_dl_file")
sha256sums=('c71d19313bc2636dd926da366010fe387dcd0b51a39cfe1958c907d75420a8b0')

package() {
  depends=(
    'alsa-lib'
    'gtk3'
  )

  # main files
  _path="$pkgdir/$_install_path"
  mkdir -pm755 "$_path"
  bsdtar -C "$_path" -xf "$srcdir/$_dl_file"

  # duplicate binary
  ln -sf icecat-bin "$_path/$_pkgname/icecat"

  # symlink
  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/$_install_path/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # icon
  install -Dm644 "$pkgdir/$_install_path/$_pkgname/browser/chrome/icons/default/default128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=IceCat
GenericName=Web Browser
Comment=Browse the World Wide Web
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=icecat %u
Icon=icecat
Terminal=false
X-MultipleArgs=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;application/x-xpinstall;
StartupNotify=true
StartupWMClass=icecat-default
Categories=Network;WebBrowser;
Actions=new-window;new-private-window;safe-mode;

[Desktop Action new-window]
Name=New Window
Exec=icecat --new-window %u

[Desktop Action new-private-window]
Name=New Private Window
Exec=icecat --private-window %u

[Desktop Action safe-mode]
Name=Safe Mode
Exec=icecat -safe-mode %u
END

  # disable auto-updates
  local _policies_json="$pkgdir/$_install_path/$_pkgname/distribution/policies.json"
  install -Dm644 /dev/stdin "$_policies_json" << END
{
  "policies": {
    "DisableAppUpdate": true
  }
}
END

  # custom defaults
  local vendorjs="$pkgdir/$_install_path/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$vendorjs" << END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable JPEG XL images
pref("image.jxl.enabled", true);

// Prevent about:config warning
pref("browser.aboutConfig.showWarning", false);

// Prevent telemetry notification
pref("services.settings.main.search-telemetry-v2.last_check", $(date +%s));
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
