# Maintainer: lsf <lsf at pfho dot net>

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=118.0.1
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://librewolf-community.gitlab.io/"
depends=(gtk3 libxt startup-notification mime-types dbus-glib
         nss ttf-font libpulse ffmpeg)
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

_project_id=44042130
_base_url=https://gitlab.com/api/v4/projects/${_project_id}/packages/generic/${pkgname//-bin/""}/${pkgver}-${pkgrel}
_uploadpath_aarch64=${_base_url}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-linux-arm64-package.tar.bz2
_uploadpath_x86_64=${_base_url}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-linux-x86_64-package.tar.bz2
_uploadpath_sig_aarch64=${_uploadpath_aarch64}.sig
_uploadpath_sig_x86_64=${_uploadpath_x86_64}.sig
_source_tag="${pkgver}-${pkgrel}"
source=(
  "git+https://gitlab.com/${pkgname//-bin/""}-community/browser/source.git#tag=${_source_tag}"
  default192x192.png
  librewolf.desktop
)
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums=('SKIP'
            '959c94c68cab8d5a8cff185ddf4dca92e84c18dccc6dc7c8fe11c78549cdc2f1'
            '7d01d317b7db7416783febc18ee1237ade2ec86c1567e2c2dd628a94cbf2f25d')
sha256sums_x86_64=('359f51b7a07792d9da750b3bc6a37180b60a80fe86d54963d4cfce5c954e0684'
                   'SKIP')
sha256sums_aarch64=('ce09367f568c6f98309b282a75a821ed6848ca5d7850fd3c4ac6f80d5357f78d'
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
