# Maintainer: xpufx <github@xpufx.com>
pkgname="paseo-desktop-bin-edge"
pkgver=0.11.2
_deb_sha='09b4573407cc92f12008cdd9324cb6dc3ea472fca3ee044c935eb49fd1e991a8'
pkgrel=2
# Publish targets: aur + Arch release + Debian release (opt-in per format).
_publish_targets="aur github-arch github-deb"
# Debian runtime deps for the fpm conversion, translated from depends and
# cross-checked against `readelf -d` on the shipped ELF payload:
#   glibc->libc6, libgcc->libgcc-s1, libstdc++->libstdc++6, gtk3->libgtk-3-0t64,
#   glib2->libglib2.0-0t64, at-spi2-core->libatspi2.0-0t64, cairo->libcairo2,
#   pango->libpango-1.0-0, expat->libexpat1, nss->libnss3, nspr->libnspr4,
#   libcups->libcups2t64, dbus->libdbus-1-3, alsa-lib->libasound2t64,
#   systemd-libs->libudev1, mesa->libgbm1, libx11->libx11-6, libxcb->libxcb1,
#   libxext->libxext6, libxcomposite->libxcomposite1, libxdamage->libxdamage1,
#   libxfixes->libxfixes3, libxrandr->libxrandr2, libxkbcommon->libxkbcommon0.
#   Electron additionally dlopens libatk1.0-0t64/libatk-bridge2.0-0t64,
#   libnotify4, libxss1, libxtst6, libsecret-1-0 and libuuid1, and calls
#   xdg-utils. t64 is what Debian 13 (trixie) and Ubuntu 24.04 (noble) ship;
#   the pre-t64 names have no candidate on either, which deb-smoke runs.
_deb_depends=('libc6' 'libgcc-s1' 'libstdc++6' 'libgtk-3-0t64' 'libglib2.0-0t64' 'libatk1.0-0t64' 'libatk-bridge2.0-0t64' 'libatspi2.0-0t64' 'libcairo2' 'libpango-1.0-0' 'libexpat1' 'libx11-6' 'libxcb1' 'libxext6' 'libxcomposite1' 'libxdamage1' 'libxfixes3' 'libxrandr2' 'libxkbcommon0' 'libnspr4' 'libnss3' 'libcups2t64' 'libdbus-1-3' 'libasound2t64' 'libudev1' 'libgbm1' 'libnotify4' 'libxss1' 'libxtst6' 'libsecret-1-0' 'libuuid1' 'xdg-utils' 'hicolor-icon-theme' 'bash' 'nodejs')
# Debian variant-exclusion for the fpm conversion (#61): all six paseo-*
# .debs ship /usr/bin/paseo and are mutually exclusive. Arch-only names
# (paseo, paseo-bin, ...) have no .deb counterpart, so the Debian list names
# the concrete sibling .debs plus the shared `paseo` virtual instead of
# reusing the Arch conflicts array verbatim.
_deb_provides=('paseo')
_deb_conflicts=('paseo-cli-edge' 'paseo-cli-git' 'paseo-cli-git-bin' 'paseo-desktop-git' 'paseo-desktop-git-bin' 'paseo')
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents. (edge - latest upstream release, beta or stable)"
arch=("x86_64")
url="https://paseo.sh"
_github_url="https://github.com/getpaseo/paseo"
makedepends=("binutils" "tar")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
provides=("paseo=${pkgver}")
conflicts=(paseo paseo-bin paseo-appimage paseo-cli-bun paseo-desktop-bin paseo-cli-edge paseo-cli-git paseo-cli-git-bin paseo-desktop-git paseo-desktop-git-bin)
license=("Apache-2.0")
source=("${_github_url}/releases/download/v${pkgver//_/-}/Paseo-${pkgver//_/-}-amd64.deb")
sha256sums=("$_deb_sha")

prepare() {
        ar p Paseo-${pkgver//_/-}-amd64.deb data.tar.xz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
        cp -R opt ${pkgdir}
        # /usr/bin/paseo symlink to the bundled CLI (the deb doesn't ship
        # one; the -git packages provide it — keep parity). Guarded: only
        # link when the target actually came with the deb.
        if [ -f "${pkgdir}/opt/Paseo/resources/bin/paseo" ]; then
                mkdir -p "${pkgdir}/usr/bin"
                ln -sf /opt/Paseo/resources/bin/paseo "${pkgdir}/usr/bin/paseo"
        fi
}
