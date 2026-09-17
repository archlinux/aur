# Maintainer: Michael Coelho <mcoelho@gmail.com>
#
# D5 in .agents/plans/package-managers.md, RULED 2026-08-08 by the owner
# directly. This is the first place this repository has ever published a
# real email address attached to the owner's real name;
# The published package's author field remains the bare string
# "roethlar", unaffected.
#
# Repackages the upstream .deb, which is what electron-builder produces. Three
# things about that .deb are load-bearing and were derived from the real
# artifact rather than assumed:
#
#   1. makepkg unpacks a .deb only as far as its ar members, so the payload is
#      still packed as data.tar.xz when package() runs.
#   2. It ships NO /usr/bin/songr, so the symlink onto $PATH is created here.
#   3. chrome-sandbox ships mode 0755. Electron's SUID sandbox helper must be
#      4755 or the app refuses to start.

pkgname=songr-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="Multi platform controller for your Roon Core. Linux, macOS, Windows, or browser, your library is at your fingertips."
arch=('x86_64' 'aarch64')
url="https://github.com/roethlar/songr"
license=('MIT')
# Translated from the upstream .deb's own Depends line.
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
         'util-linux-libs' 'libsecret')
optdepends=('libayatana-appindicator: tray icon on desktops without StatusNotifier')
provides=('songr')
conflicts=('songr')
options=('!strip' '!debug' 'emptydirs')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/songr_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/songr_${pkgver}_arm64.deb")
sha256sums_x86_64=('35ec210ed68f6b5df8c479cec0d724eae2a5ea23795699b38bce9ff8daac5326')
sha256sums_aarch64=('37a1911821c5ff718f57537fcd50d0e683a56afca33e0dca9c7271fdcc9d6a4a')

package() {
  bsdtar -xpf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  chmod 4755 "${pkgdir}/opt/Songr/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf /opt/Songr/songr "${pkgdir}/usr/bin/songr"

  # Electron's own license text is the only LICENSE file inside the payload;
  # the app's MIT license is not shipped in the .deb, so it is fetched from the
  # package metadata instead of being invented here.
  install -Dm644 "${pkgdir}/opt/Songr/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"

  # Debian changelog conventions do not apply to an Arch package.
  rm -rf "${pkgdir}/usr/share/doc"
}
