# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://aur.archlinux.org/packages/firedragon-bin by
# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Co-Maintainer: FGD
# Co-Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

_pkgname=firedragon
_pkgver=13.0.0-beta.10

pkgname=${_pkgname}-alpha-bin
pkgver="${_pkgver/-/_}"
pkgrel=1
epoch=1
pkgdesc="Floorp fork built with custom branding and settings - testing version for the upcoming FireDragon 13 (technically *beta* now, not *alpha*, but i'm not making a new pkgbase lolol)"
url='https://gitlab.com/garuda-linux/firedragon/firedragon13'
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
            'searxng-git: Searching the web using a locally running searX instance'
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
backup=("usr/lib/${_pkgname}/distribution/policies.json")
source=(firedragon.psd::https://github.com/stefanwimmer128/profile-sync-daemon/raw/refs/heads/firedragon/contrib/firedragon
        https://gitlab.com/garuda-linux/firedragon/firedragon13/-/raw/v"$_pkgver"/assets/firedragon.desktop)
source_x86_64=(firedragon-v"$_pkgver"-linux-x64.tar.xz::https://gitlab.com/garuda-linux/firedragon/firedragon13/-/releases/v"$_pkgver"/downloads/firedragon.linux-x64.tar.xz)
source_aarch64=(firedragon-v"$_pkgver"-linux-arm64.tar.xz::https://gitlab.com/garuda-linux/firedragon/firedragon13/-/releases/v"$_pkgver"/downloads/firedragon.linux-arm64.tar.xz)
b2sums=('a042cac06a3c2f424df86298775b9441ef6e1d181c065349c2c33740c15da57ee16c7114d84f006603e13e232891a3c635df630b22926ebca4a252204a2db281'
        '77fb65365470533628c12389cfc210b4ac7cb37ef6fb946d10c4a5514b652e4969f63097a76e1e94ac53146b954a17ce84ebd61c73f7b07ac9b65446c6ff6b09')
b2sums_x86_64=('9b06b5a396548fde05b9c1fe353cc3c2133b0156aa0c8c38725477235e319b95aadd53197dcba5014469433c830ae7bf1edbc13ee3eaa09839eea4f86c7c286b')
b2sums_aarch64=('c11620c81c02716f9878d9b4b9c2f6b8a283b7255ebba8dc182905559f10c9e23852b9b13d84943c2beee906a9034c0b3a0d3bf276c0d669261f35ff320a3295')


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
