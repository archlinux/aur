# Maintainer:
# Contributor: jessienab <git at nabein dot me>
# Based on script written by Figue

: ${_install_path:=usr/lib}

_pkgname="icecat"
pkgname="$_pkgname-bin"
pkgver=140.10.2
pkgrel=1
pkgdesc="GNU version of the Firefox ESR browser"
url="https://codeberg.org/jessienab/icecat-bin"
license=('MPL-2.0')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_dl_url="https://codeberg.org/jessienab/icecat-bin/releases/download/$pkgver/"
_dl_file="icecat-$pkgver.en-US.linux-$CARCH.tar.xz"

noextract=("$_dl_url/$_dl_file")

source=("$_dl_url/$_dl_file")
sha256sums=('bdafb8eb30f8d0d51949ba447c60a202c752838773499f22c59a3a47ddc99b0e')

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

// Settings to nullify Telemetry reports and upstream URLs
pref("toolkit.telemetry.enabled", false);
pref("toolkit.telemetry.dap_enabled", false);
pref("toolkit.telemetry.bhrPing.enabled", false);
pref("toolkit.telemetry.archive.enabled", false);

pref("toolkit.telemetry.dap.leader.url", "");
pref("toolkit.telemetry.dap.helper.url", "");
pref("toolkit.telemetry.server", "");

pref("browser.ping-centre.telemetry", false);

// Fix "Find more add-ons/Get more add-ons" link to point to the no-JS GNUzilla directory,
// where the install links point to upstream Firefox Add-ons directory.
pref("extensions.getAddons.browserMappings.url", "https://gnuzilla.gnu.org/");
pref("extensions.getAddons.discovery.api_url", "https://gnuzilla.gnu.org/");
pref("extensions.getAddons.get.url", "https://gnuzilla.gnu.org/");
pref("extensions.getAddons.langpacks.url", "https://gnuzilla.gnu.org/");
pref("extensions.getAddons.link.url", "https://gnuzilla.gnu.org/");
pref("extensions.getAddons.search.browseURL", "https://gnuzilla.gnu.org/");
pref("extensions.getAddons.search.url", "https://gnuzilla.gnu.org/");

// Prevent telemetry notification
pref("services.settings.main.search-telemetry-v2.last_check", $(date +%s));
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
