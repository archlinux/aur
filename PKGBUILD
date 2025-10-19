# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Co-Maintainer: FGD
# Co-Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

_pkgname=firedragon
_pkgver=12.5.1

pkgname=${_pkgname}-bin
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=1
pkgdesc="Floorp fork build using custom branding and settings"
url='https://firedragon.garudalinux.org'
arch=('x86_64' 'aarch64')
license=('MPL2')
depends=(dbus
         dbus-glib
         ffmpeg4.4
         gtk3
         libxss
         libxt
         mime-types
         nss
         ttf-font
         zlib)
makedepends=()
optdepends=('hunspell-dictionary: Spell checking'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'profile-sync-daemon: Load the browser profile into RAM'
            'pulse-native-provider: Audio support'
            'searx: Searching the web using a locally running searX instance'
            'speech-dispatcher: Text-to-Speech'
            'whoogle: Searching the web using a locally running Whoogle instance'
            'xdg-desktop-portal: Screensharing with Wayland')
conflicts=("$_pkgname")
provides=("$_pkgname")
options=(!debug
         !emptydirs
         !lto
         !makeflags
         !strip)
backup=("usr/lib/${_pkgname}/${_pkgname}.cfg"
        "usr/lib/${_pkgname}/distribution/policies.json")
source=(firedragon.psd::https://github.com/stefanwimmer128/profile-sync-daemon/raw/refs/heads/firedragon/contrib/firedragon
        https://gitlab.com/garuda-linux/firedragon/firedragon12/-/raw/v"$_pkgver"/assets/firedragon.desktop)
source_x86_64=(firedragon-v"$_pkgver"-linux-x64.tar.xz::https://gitlab.com/garuda-linux/firedragon/firedragon12/-/releases/v"$_pkgver"/downloads/firedragon-linux-x64.tar.xz)
source_aarch64=(firedragon-v"$_pkgver"-linux-arm64.tar.xz::https://gitlab.com/garuda-linux/firedragon/firedragon12/-/releases/v"$_pkgver"/downloads/firedragon-linux-arm64.tar.xz)
sha256sums=('61355930cc59813e7e610ffdab8a01e32be980fffe1dfd8f9654b8f8f9f7fdc0'
            '53d3e743f3750522318a786befa196237892c93f20571443fdf82a480e7f0560')
sha256sums_x86_64=('24218ecf3cc9fc8cf43666704bb10d5d10a0086e6af3be2e351cca0bad2b625f')
sha256sums_aarch64=('699c1c9d6335ed0e0cda1e7876066445ae815a1065b29bca19d380a355229b5e')


package() {
  cd "${srcdir}/${_pkgname}"

  install -Ddvm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -rvf "${srcdir}/firedragon/." "${pkgdir}/usr/lib/${_pkgname}"

  install -Ddvm755 "${pkgdir}/usr/bin"
  ln -srfv "$pkgdir/usr/lib/${_pkgname}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  local vendorjs="${pkgdir}/usr/lib/${_pkgname}/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "${vendorjs}" << END
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

  local distini="${pkgdir}/usr/lib/${_pkgname}/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "${distini}" << END
[Global]
id=${pkgname}
version=${pkgver}-${pkgrel}
about=${pkgdesc}

[Preferences]
app.distributor=garudalinux
app.distributor.channel=${pkgname}
app.partner.garudalinux=garudalinux
END

  # Use system certificates
  local nssckbi="${pkgdir}/usr/lib/${_pkgname}/libnssckbi.so"
  if [[ -e "${nssckbi}" ]]; then
    ln -srfv "${pkgdir}/usr/lib/libnssckbi.so" "${nssckbi}"
  fi

  # Make native messaging work
  ln -s "/usr/lib/mozilla/native-messaging-hosts" "${pkgdir}/usr/lib/${_pkgname}/native-messaging-hosts"

  # GNOME search provider
  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/${_pkgname}.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" << END
[Shell Search Provider]
DesktopId=$pkgname.desktop
BusName=org.mozilla.${pkgname//-/}.SearchProvider
ObjectPath=/org/mozilla/${pkgname//-/}/SearchProvider
Version=2
END

  # Application icons
  for i in 16 32 48 64 128; do
    install -Dvm644 browser/chrome/icons/default/default$i.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/${_pkgname}" "$pkgdir/usr/lib/${_pkgname}/${_pkgname}-bin"

  # All the needed configuration files
  install -Dvm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dvm644 "${srcdir}/${_pkgname}.psd" "${pkgdir}/usr/share/psd/browsers/${_pkgname}"
}
