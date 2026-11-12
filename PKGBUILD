# Maintainer: Javier Tia <floss@jetm.me>
# Contributor: Alessandro Bernardello <aleberna at erine dot eu>

# Fork of the AUR `ente-auth-bin`, which trails upstream and whose out-of-date
# flag has gone unanswered. The -jetm suffix is there because that name belongs
# to another maintainer.
#
# Repackages upstream's own .deb. The version is tracked from the auth-v* tags
# of the ente/ente monorepo, release candidates and betas excluded.
pkgname=ente-auth-bin-jetm
pkgver=4.4.26
pkgrel=1
pkgdesc='Ente two-factor authenticator'
arch=('x86_64')
url='https://ente.io/auth'
license=('AGPL-3.0-or-later')

# Direct DT_NEEDED of the shipped binary and its bundled plugins, minus what
# gtk3 already pulls in transitively (cairo, pango, glib2, epoxy, fontconfig,
# the libX* stack). libsodium is bundled under lib/ and needs no package.
#
# sqlite and curl are the two that readelf finds only partly. libapp.so carries
# the literal "libsqlite3.so" but has no NEEDED entry for it, so it is resolved
# at runtime; libcurl is NEEDED by the bundled libsentry.so. xdg-user-dirs,
# polkit and org.freedesktop.secrets are carried over from `ente-auth-bin`.
depends=('gtk3' 'libayatana-appindicator' 'ayatana-ido' 'libayatana-indicator'
         'libsecret' 'org.freedesktop.secrets' 'xdg-user-dirs' 'polkit'
         'sqlite' 'curl')
provides=('ente-auth')
conflicts=('ente-auth' 'ente-auth-bin')

# The Flutter engine, the AOT snapshot in lib/libapp.so and the plugin
# libraries are prebuilt vendor binaries - stripping them can break them. Also
# suppresses the debug package on its own - makepkg gates that on `debug` AND
# `strip`.
options=('!strip')

source=("ente-auth-v${pkgver}-x86_64.deb::https://github.com/ente/ente/releases/download/auth-v${pkgver}/ente-auth-v${pkgver}-x86_64.deb")
noextract=("ente-auth-v${pkgver}-x86_64.deb")
sha256sums=('9952ad4c7d9d4774b52df0de53eda4959e4a4662d63ab9eb64aa168013bc3369')

package() {
  # Not `data.tar.zst` by name: upstream picks the compression, and a switch to
  # xz would otherwise leave this extracting nothing.
  bsdtar -O -xf "${srcdir}/ente-auth-v${pkgver}-x86_64.deb" 'data.tar.*' |
    bsdtar -C "${pkgdir}" -xf -

  # Refuse to ship a package without its launcher or the Dart AOT snapshot
  # (lib/libapp.so), the two files the app cannot run without.
  [[ -x ${pkgdir}/usr/share/enteauth/enteauth &&
     -f ${pkgdir}/usr/share/enteauth/lib/libapp.so ]] || {
    echo 'error: enteauth or lib/libapp.so missing after extraction' >&2
    return 1
  }

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/share/enteauth/enteauth "${pkgdir}/usr/bin/enteauth"

  # A copy, not the symlink `ente-auth-bin` uses: install fails the build if
  # upstream moves the asset, where a dangling link would ship silently.
  install -Dm644 \
    "${pkgdir}/usr/share/enteauth/data/flutter_assets/assets/polkit/com.ente.auth.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/com.ente.auth.policy"
}

# vim:set ts=2 sw=2 et:
