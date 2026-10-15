# Maintainer: czyt <czytcn@gmail.com>
pkgname=lody
pkgver=0.105.0
pkgrel=1
pkgdesc="Lody Desktop - run AI coding agents in parallel with isolated Git worktrees, live diff review and GitHub integration"
arch=('x86_64')
url="https://lody.ai/home"
license=('custom')
depends=('alsa-lib' 'avahi' 'dbus' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator: system tray support')
makedepends=('libarchive')
source=("Lody-${pkgver}-amd64.deb::https://updates.lody.ai/production/Lody-${pkgver}-amd64.deb")
sha256sums=('3555df4c372ee11e08d044992fcec77e0ac2263e4f21b159993ba224ec49e60a')

package() {
    # Dynamically select the data archive member in case the deb compression changes
    local _data_member
    _data_member=$(ar t "${srcdir}/Lody-${pkgver}-amd64.deb" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/Lody-${pkgver}-amd64.deb" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
