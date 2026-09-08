# Maintainer: xpufx <github@xpufx.com>
pkgname="paseo-desktop-bin-beta"
pkgver="0.7.0_beta.3"
_deb_sha='82e172b6d6bd9ce3bd9dc2355c90ba606415cb824151deda37cda4bb2778a2f2'
pkgrel=2
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents. (beta - latest beta release. Stable may be ahead; use paseo-desktop-bin-edge for latest)"
arch=("x86_64")
url="https://paseo.sh"
_github_url="https://github.com/getpaseo/paseo"
makedepends=("binutils" "tar")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
provides=("paseo=${pkgver}")
conflicts=(paseo paseo-bin paseo-appimage paseo-desktop-bin)
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
