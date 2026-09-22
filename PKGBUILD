# Maintainer: xpufx <github@xpufx.com>
pkgname="paseo-desktop-bin-edge"
pkgver=0.9.0
_deb_sha='c6cf852829ec8b5267e72f2017cf2abcd4653cb2166c043183f3f6590710c12b'
pkgrel=2
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents. (edge - latest upstream release, beta or stable)"
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
