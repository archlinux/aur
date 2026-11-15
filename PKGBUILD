# Maintainer: Cmdly
pkgname=aria-fm-bin
pkgver=0.9.0
pkgrel=2
pkgdesc="Native Spotify desktop client — Go, a native UI, and librespot over FFI"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cmdly/aria.fm"
license=('MIT')
# The app is one cgo-free Go executable with the librespot cdylib embedded.
# Everything native it uses it dlopens through purego, so none of it shows in
# its NEEDED list: GTK 3 for windows, menus and input (its libepoxy is the
# OpenGL the UI draws with), and alsa-lib for audio output. PipeWire and
# PulseAudio users still need alsa-lib — their ALSA plugins live behind the
# same libasound.
#
# openssl is NOT a dependency: librespot-ffi uses rustls, so the cdylib links
# no libssl/libcrypto. Trust roots are read from the system store, which is
# ca-certificates on Arch — already pulled in by the base system.
depends=('gtk3' 'alsa-lib' 'hicolor-icon-theme')
provides=('aria.fm')
conflicts=('aria.fm')
# The executable is prebuilt and already stripped.
options=('!strip')
# Per-arch prebuilt tarballs. Arch's $CARCH spellings (x86_64/aarch64) are
# exactly the ones the release assets use, so the arch appears in the URL and
# in the extracted directory name with no mapping table.
#
# The download is renamed per arch: both tarballs would otherwise land in
# makepkg's shared SRCDEST under one name, and a cached x86_64 tarball would be
# reused for an aarch64 build (and vice versa) — a wrong-arch package that only
# fails when the user runs it.
source_x86_64=("aria-fm-${pkgver}-x86_64.tar.gz::https://gitlab.com/api/v4/projects/cmdly%2Faria.fm/packages/generic/aria-fm/v${pkgver}/aria-fm-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("aria-fm-${pkgver}-aarch64.tar.gz::https://gitlab.com/api/v4/projects/cmdly%2Faria.fm/packages/generic/aria-fm/v${pkgver}/aria-fm-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('3272a39db0ccb33d5beae0523c81d667ec66d16a996f915aa41fde02f9ec24b7')
# Both sums are written by scripts/bump-aur.sh from the PUBLISHED tarballs, not
# from a local build — the bytes users fetch are the bytes that must be pinned.
# Never 'SKIP' here: that disables verification entirely, so a truncated or
# wrong-arch download would build silently. A stale hash fails loudly instead.
sha256sums_aarch64=('d848f07d08f2f75703260daf7ba3ed9cb9c451b64ddfbf31e95806b0b1ee0ca2')

package() {
  cd "${srcdir}/aria-fm-v${pkgver}-linux-${CARCH}"

  install -Dm755 aria-fm "${pkgdir}/usr/bin/aria-fm"
  # The command the Electron packages installed, kept so muscle memory and
  # scripts that ran `aria` still work.
  ln -s aria-fm "${pkgdir}/usr/bin/aria"
  install -Dm644 aria-fm.desktop "${pkgdir}/usr/share/applications/aria-fm.desktop"
  # Icon under the name the desktop file references (Icon=aria-fm).
  install -Dm644 aria-fm.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/aria-fm.png"
  install -Dm644 fm.aria.Client.metainfo.xml "${pkgdir}/usr/share/metainfo/fm.aria.Client.metainfo.xml"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # The licenses of everything the executable links and embeds.
  install -Dm644 THIRD-PARTY-NOTICES.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.txt"
  # Who installed this copy (aria.fm-pekr.8): Preferences reads it to show
  # the command that moves the install to the beta package and back.
  install -d "${pkgdir}/usr/share/aria-fm"
  echo "aur ${pkgname}" > "${pkgdir}/usr/share/aria-fm/install-source"
}
