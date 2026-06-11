epoch=1
pkgname=konform-browser-bin
_pkgname="${pkgname//-bin/""}"
# Maintainer: konvix <busybeaver@2mail.co>
__pkgname=konform
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=140.12.0_100
_konformver="${pkgver%_*}"
_konformrel="${pkgver#*_}"
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
url="https://codeberg.org/konform-browser"
arch=(x86_64 aarch64)
license=(MPL-2.0)
depends=(
  dbus
  at-spi2-core
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libasound.so
  libgcc_s.so=1
  libcairo.so
  libevent
  libpulse
  libstdc++.so=6
  libvpx.so
  libwebp.so
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
  pixman
  sh
  zlib
)
makedepends=(git)
optdepends=(
  'hunspell-dictionary: Spell checking'
  'ffmpeg: additional video and audio codec support'
  'openh264: H264 video decoding support'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'startup-notification'
  'xdg-desktop-portal: Screensharing with Wayland'
  'firefox-ublock-origin: Content filter extension'
  'firefox-noscript: Selectively enable javascript on pages'
  'firefox-decentraleyes: Local emulation of Content Delivery Networks'
)
validpgpkeys=('9511FD9BD64CCF171F0B28A72B6FD58B41A0E262') # konform release keys (./konform-cb-release.asc)
backup=('usr/lib/konform/librewolf.cfg'
      'usr/lib/konform/distribution/policies.json')
options=(!emptydirs)
install='konform-browser-bin.install'


_base_url="https://codeberg.org/api/packages/${_pkgname}/generic/${_pkgname}/${_konformver}-${_konformrel}"
_uploadpath_aarch64=${_base_url}/${_pkgname}-${_konformver}-${_konformrel}-linux-arm64-package.tar.xz
_uploadpath_x86_64=${_base_url}/${_pkgname}-${_konformver}-${_konformrel}-linux-x86_64-package.tar.xz
_uploadpath_sig_aarch64=${_uploadpath_aarch64}.sig
_uploadpath_sig_x86_64=${_uploadpath_x86_64}.sig
_source_tag="${_konformver}.${_konformrel}"
source=(
  "git+https://codeberg.org/konform-browser/source.git#tag=${_source_tag}"
  default192x192.png
  "${__pkgname}.desktop"
)
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums=('c297d87275f7f76e556bbfa3f844791ff78eeca6cb174802191520462da6e079'
            'b86ddfc0cec482f7900f296857cdd0f1b736ff5037e0a86712b258ae0092924b'
            '68fb47f178d5c3412162d3bb8f74abbfcf1977e0ea4dc69647580ff6f8a93fb4')
sha256sums_x86_64=('0f28e8f0588e3b317d21b1739536e0616023245bea126cdafb6a668905cbb5e1'
                   'SKIP')
sha256sums_aarch64=('7916e07e7f4efb1c8c234d75f10d53f555f5e4555a1d6872e78191dae51ff929'
                    'SKIP')

package() {
  install -dm 755 "${pkgdir}/usr/lib/${__pkgname}"
  install -dm 755 "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${__pkgname}"/* "${pkgdir}/usr/lib/${__pkgname}"

  cd "${srcdir}/${__pkgname}"

  local vendorjs="$pkgdir/usr/lib/$__pkgname/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

local distini="$pkgdir/usr/lib/$__pkgname/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=org.codeberg.${_pkgname}
version=1.0
about="Konform Browser"

[Preferences]
app.distributor="Konform Konsortium"
app.distributor.channel=${_pkgname}
app.partner.konform=${_pkgname}
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

  install -Dvm644 ${srcdir}/$__pkgname.desktop \
    "$pkgdir/usr/share/applications/$__pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/$__pkgname" <<END
#!/bin/sh
exec /usr/lib/${__pkgname}/${__pkgname} "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/$__pkgname" "$pkgdir/usr/lib/$__pkgname/$__pkgname-bin"
  ln -s "${__pkgname}" "${pkgdir}/usr/bin/${_pkgname}" || true
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/$__pkgname/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi
}
