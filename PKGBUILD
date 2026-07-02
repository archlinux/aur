# Maintainer: ohfp/lsf <@ohfp:matrix.org>

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
epoch=1
pkgver=152.0.4_1
_fixedfirefoxver="${pkgver%_*}" # Version of Firefox this LibreWolf version is based on, but the Firefox patch number is always included
_librewolfver="${pkgver#*_}"
_firefoxver="${_fixedfirefoxver%.0}" # Removes ".0" from the end. For "136.0.0" this will result in "136.0" but for "136.0.1" won't do anything.
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 aarch64)
license=(MPL-2.0)
url="https://librewolf.net/"
depends=(
  gtk3
  libxt
  startup-notification
  mime-types
  dbus
  nss
  ttf-font
  libpulse
  ffmpeg
  hicolor-icon-theme
  libxdamage
  libxi
  alsa-lib
  libxrender
  libxcursor
  gdk-pixbuf2
  libxrandr
  pango
  freetype2
  glibc
  bash
  fontconfig
  libxcomposite
  glib2
  gcc-libs
  libx11
  libxfixes
  at-spi2-core
  libxcb
  cairo
  nspr
  libxext
)
makedepends=(git)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
validpgpkeys=('662E3CDD6FE329002D0CA5BB40339DD82B12EF16') # librewolf maintainers
backup=('usr/lib/librewolf/librewolf.cfg'
        'usr/lib/librewolf/distribution/policies.json')
options=(!emptydirs)
install='librewolf-bin.install'


_base_url=https://codeberg.org/api/packages/librewolf/generic/${pkgname//-bin/""}/$_firefoxver-$_librewolfver
_uploadpath_aarch64=${_base_url}/${pkgname//-bin/""}-$_firefoxver-$_librewolfver-linux-arm64-package.tar.xz
_uploadpath_x86_64=${_base_url}/${pkgname//-bin/""}-$_firefoxver-$_librewolfver-linux-x86_64-package.tar.xz
_uploadpath_sig_aarch64=${_uploadpath_aarch64}.sig
_uploadpath_sig_x86_64=${_uploadpath_x86_64}.sig
_source_tag="$_firefoxver-$_librewolfver"
source=(
  "git+https://codeberg.org/librewolf/source.git#tag=${_source_tag}"
  default192x192.png
  librewolf.desktop
)
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums=('681fdcc942bcd73f3590980e5685b6943d3cbcac879ce2dbc9928890ce0b79f4'
            '959c94c68cab8d5a8cff185ddf4dca92e84c18dccc6dc7c8fe11c78549cdc2f1'
            '3d6ac59ae9d5ba4c9fe15f95c1338fa68214dec6119f8432336403e3be50f8ae')
sha256sums_x86_64=('e2f9acbfddc436db5e135f2e18917664485a440de718983ffd66187414442228'
                   'SKIP')
sha256sums_aarch64=('435bd3ffda8eb36022311b0b7287c5ec5d98fb9409265a08fd049567003d802f'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  install -dm 755 ${pkgdir}/usr/lib/librewolf
  install -dm 755 ${pkgdir}/usr/bin
  cp -r "${srcdir}"/${pkgname//-bin/""}/* "${pkgdir}"/usr/lib/librewolf

  cd ${srcdir}/${pkgname//-bin/""}

  local vendorjs="$pkgdir/usr/lib/${pkgname//-bin/""}/browser/defaults/preferences/vendor.js"

  install -Dvm644 /dev/stdin "$vendorjs" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Don't disable extensions in the application directory
// done in librewolf.cfg
// pref("extensions.autoDisableScopes", 11);
END

  local distini="$pkgdir/usr/lib/${pkgname//-bin/""}/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END

[Global]
id=io.gitlab.${pkgname//-bin/""}-community
version=1.0
about=LibreWolf

[Preferences]
app.distributor="LibreWolf Community"
app.distributor.channel=${pkgname//-bin/""}
app.partner.librewolf=${pkgname//-bin/""}
END

  for i in 16 32 48 64 128; do
    install -Dvm644 ${srcdir}/source/themes/browser/branding/${pkgname//-bin/""}/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname//-bin/""}.png"
  done
  # install -Dvm644 browser/branding/librewolf/content/about-logo.png \
    # "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dvm644 ${srcdir}/default192x192.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/${pkgname//-bin/""}.png"

  # arch upstream provides a separate svg for this. we don't have that, so let's re-use 16.png
  install -Dvm644 ${srcdir}/source/themes/browser/branding/${pkgname//-bin/""}/default16.png \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${pkgname//-bin/""}-symbolic.png"

  install -Dvm644 ${srcdir}/${pkgname//-bin/""}.desktop \
    "$pkgdir/usr/share/applications/${pkgname//-bin/""}.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/${pkgname//-bin/""}" <<END
#!/bin/sh
exec /usr/lib/${pkgname//-bin/""}/librewolf "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/${pkgname//-bin/""}" "$pkgdir/usr/lib/${pkgname//-bin/""}/librewolf-bin"
  # Use system certificates
  local nssckbi="$pkgdir/usr/lib/${pkgname//-bin/""}/libnssckbi.so"
  if [[ -e $nssckbi ]]; then
    ln -srfv "$pkgdir/usr/lib/libnssckbi.so" "$nssckbi"
  fi

}
