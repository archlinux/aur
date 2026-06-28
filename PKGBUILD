# Maintainer: unterschall <github.com.kitten172@passmail.com>
#
# librewolf-hellfire-bin
# ----------------------
# Installs a prebuilt LibreWolf + HellFire binary produced by CI (see the
# .github/workflows/build.yml GitHub Actions workflow in this repo). The CI
# builds with a *portable* baseline (-march=x86-64-v3 ~= AVX2 + SSE4.2 + FMA) so
# the binary runs on any modern x86_64 CPU, then publishes the package tarball as
# a GitHub Release.
#
# >>> Set _ghrepo below to the GitHub repo that hosts your CI releases. <<<

_ghrepo="unterschall/librewolf-hellfire"   # GitHub repo with the Releases

pkgname=librewolf-hellfire-bin
pkgver=152.0.2_1
pkgrel=1
pkgdesc="LibreWolf + HellFire optimizations, prebuilt binary (AVX2/SSE4.2, full LTO, hardened, sandboxed)"
arch=(x86_64)
url="https://codeberg.org/FailsafeDX/librewolf-hellfire"
license=(MPL-2.0)

_tag="${pkgver/_/-}"          # release tag, e.g. 152.0.2-1 (matches upstream)
_appname=librewolf            # app-name / branding baked into the build

provides=(librewolf librewolf-hellfire)
conflicts=(librewolf librewolf-bin librewolf-hellfire)

depends=(
  alsa-lib at-spi2-core bash cairo dbus ffmpeg fontconfig freetype2
  gcc-libs gdk-pixbuf2 glib2 glibc gtk3 hicolor-icon-theme libpulse libx11
  libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr
  libxrender libxt mime-types nspr nss pango startup-notification ttf-font
)
makedepends=(git)             # only to pull branding icons from the source repo
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)

backup=('usr/lib/librewolf/librewolf.cfg'
        'usr/lib/librewolf/distribution/policies.json')
options=(!strip !emptydirs)
install="${pkgname}.install"

source=(
  # Prebuilt package tarball from the CI GitHub Release. Top-level dir is `librewolf/`.
  "librewolf-hellfire-${_tag}-linux-x86_64.tar.xz::https://github.com/${_ghrepo}/releases/download/${_tag}/librewolf-hellfire-${_tag}-linux-x86_64.tar.xz"
  # Branding icons, taken from the integration repo at the matching tag.
  "librewolf-hellfire-src::git+https://codeberg.org/FailsafeDX/librewolf-hellfire.git"
  "librewolf-hellfire.desktop"
)
# Run `updpkgsums` to fill in the tarball checksum for each release.
sha256sums=('969dd9f96ad720b3088577678cb723778f3062385655ea52b642f69c222521d3'
            'SKIP'
            'ba5586bbc59dc49417510340b2b996497a08d9ee3ec22fb765778c098f21f71e')

package() {
  install -dm755 "${pkgdir}/usr/lib/${_appname}"
  cp -r "${srcdir}/${_appname}/"* "${pkgdir}/usr/lib/${_appname}/"

  # Use system dictionaries.
  install -Dvm644 /dev/stdin \
    "${pkgdir}/usr/lib/${_appname}/browser/defaults/preferences/vendor.js" <<END
// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");
END

  install -Dvm644 /dev/stdin \
    "${pkgdir}/usr/lib/${_appname}/distribution/distribution.ini" <<END
[Global]
id=io.gitlab.${_appname}-community
version=1.0
about=LibreWolf HellFire

[Preferences]
app.distributor="LibreWolf HellFire"
app.distributor.channel=${pkgname}
app.partner.librewolf=${pkgname}
END

  # Icons from the integration repo (raw, unpatched layout).
  local _branding="${srcdir}/librewolf-hellfire-src/themes/browser/branding/${_appname}"
  for i in 16 32 48 64 128 256; do
    install -Dvm644 "${_branding}/default${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-bin}.png"
  done
  install -Dvm644 "${_branding}/default16.png" \
    "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/${pkgname%-bin}-symbolic.png"

  install -Dvm644 "${srcdir}/librewolf-hellfire.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

  install -Dvm755 /dev/stdin "${pkgdir}/usr/bin/${_appname}" <<END
#!/bin/sh
exec /usr/lib/${_appname}/${_appname} "\$@"
END
  ln -srfv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"

  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/usr/lib/${_appname}/${_appname}-bin"
}
