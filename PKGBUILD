# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/buffr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/aur.yml` republish.
pkgname=buffr-bin
_pkgname=buffr
pkgver=0.14.11
pkgrel=1
pkgdesc="Vim-inspired browser. Native, GPU-accelerated. Rust + CEF. (binary release)"
arch=('x86_64' 'aarch64')
url="https://buffr.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('gtk3' 'nss' 'libxss' 'alsa-lib' 'mesa' 'libxshmfence' 'libxkbcommon' 'libxkbcommon-x11' 'libglvnd')
# `!strip` because libcef.so is already stripped upstream; re-stripping
# a prebuilt CEF has been observed to break dlsym lookups in some builds.
# `!debug` because the runtime tarball ships no .debug/ tree, so the
# debug-package split would create an empty `buffr-bin-debug` package.
options=(!strip !debug)

source_x86_64=("buffr-${pkgver}-x86_64.tar.gz::https://github.com/kryptic-sh/buffr/releases/download/v${pkgver}/buffr-${pkgver}-x86_64.tar.gz")
source_aarch64=("buffr-${pkgver}-aarch64.tar.gz::https://github.com/kryptic-sh/buffr/releases/download/v${pkgver}/buffr-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('a3e7553dd90bd308b724d9aae4bdc1ef904cf0fe468e58a00c79b347700c56e9')
sha256sums_aarch64=('037d14828d00f1c5cea9f54a2281d5d0dd5ce3db68d387c1a0571d7acf240ea9')

package() {
    local _arch
    case "$CARCH" in
        x86_64)  _arch=x86_64 ;;
        aarch64) _arch=aarch64 ;;
    esac

    # Whole runtime tree drops into /opt/buffr (libcef.so resolves via
    # rpath/$ORIGIN, and the CEF paks/locales must sit beside the
    # binaries). /usr/bin symlinks expose all three binaries to $PATH.
    cd "$srcdir/buffr-${pkgver}-${_arch}"
    install -dm755 "$pkgdir/opt/buffr"
    cp -a . "$pkgdir/opt/buffr/"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/buffr/buffr "$pkgdir/usr/bin/buffr"
    ln -sf /opt/buffr/buffr-app "$pkgdir/usr/bin/buffr-app"
    ln -sf /opt/buffr/buffr-helper "$pkgdir/usr/bin/buffr-helper"

    # `.desktop` + icon ship inside the runtime tarball (xtask
    # `build_tarball`). Hoist them out of /opt/buffr/ into the standard
    # XDG locations so desktop launchers + icon themes pick them up.
    install -Dm644 "$pkgdir/opt/buffr/buffr.desktop" \
        "$pkgdir/usr/share/applications/buffr.desktop"
    install -Dm644 "$pkgdir/opt/buffr/buffr.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/buffr.png"
    rm "$pkgdir/opt/buffr/buffr.desktop" "$pkgdir/opt/buffr/buffr.png"
}
