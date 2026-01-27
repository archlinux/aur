pkgname=konform-browser-bin
__pkgname="${pkgname//-bin/""}"
provides=("${__pkgname}")
conflicts=("${__pkgname}")
epoch=1
pkgver=140.7.0_105
_konformver="${pkgver%_*}"
_konformrel="${pkgver#*_}"
pkgrel=0
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 aarch64)
license=(MPL-2.0)
url="https://codeberg.org/konform-browser"
depends=(
  dbus
  alsa-lib
  at-spi2-core
  bash
  cairo
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libevent
  libpulse
  libvpx
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxi
  libxfixes
  libxrandr
  libxrender
  libxss
  libxt
  libwebp
  mime-types
  nspr
  nss
  pango
  ttf-font
  zlib
)
makedepends=(git)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'startup-notification'
  'xdg-desktop-portal: Screensharing with Wayland'
  'firefox-ublock-origin: Content filter extension'
  'firefox-decentraleyes: Local emulation of Content Delivery Networks'
  'konform-multi-account-containers-lite: First-class multi-account-containers integration'
)
validpgpkeys=('9511FD9BD64CCF171F0B28A72B6FD58B41A0E262') # konform release keys (./konform-cb-release.asc)
backup=('usr/lib/konform/librewolf.cfg'
      'usr/lib/konform/distribution/policies.json')
options=(!emptydirs)
install='konform-browser-bin.install'


_base_url="https://codeberg.org/api/packages/${__pkgname}/generic/${__pkgname}/${_konformver}-${_konformrel}"
_uploadpath_aarch64=${_base_url}/${__pkgname}-${_konformver}-${_konformrel}-linux-arm64-package.tar.xz
_uploadpath_x86_64=${_base_url}/${__pkgname}-${_konformver}-${_konformrel}-linux-x86_64-package.tar.xz
_uploadpath_sig_aarch64=${_uploadpath_aarch64}.sig
_uploadpath_sig_x86_64=${_uploadpath_x86_64}.sig
_source_tag="${_konformver}.${_konformrel}"
source=(
  "git+https://codeberg.org/konform-browser/source.git#tag=${_source_tag}"
  default192x192.png
  konform.desktop
)
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
sha256sums_x86_64=('SKIP'
                   'SKIP')
sha256sums_aarch64=('SKIP'
                    'SKIP')

package() {
  install -dm 755 ${pkgdir}/usr/lib/konform
  install -dm 755 ${pkgdir}/usr/bin
  cp -r "${srcdir}/konform"/* "${pkgdir}"/usr/lib/konform

  cd "${srcdir}/konform"

  local vendorjs="$pkgdir/usr/lib/konform/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  local distini="$pkgdir/usr/lib/konform/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=org.codeberg.${__pkgname}
version=1.0
about="Konform Browser"

[Preferences]
app.distributor="Konform Konsortium"
app.distributor.channel=${__pkgname}
app.partner.konform=${__pkgname}
END

  for i in 16 32 48 64 128; do
    install -Dvm644 ${srcdir}/source/themes/browser/branding/librewolf/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$__pkgname.png"
  done
  install -Dvm644 ${srcdir}/default192x192.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$__pkgname.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 ${srcdir}/source/themes/browser/branding/librewolf/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$__pkgname-symbolic.png"

  install -Dvm644 ${srcdir}/konform.desktop \
    "$pkgdir/usr/share/applications/$__pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$__pkgname" <<END
#!/bin/sh
exec /usr/lib/konform/konform "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$__pkgname" "$pkgdir/usr/lib/konform/konform-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/konform/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

}
