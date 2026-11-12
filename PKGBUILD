# Maintainer: Yakov Till <yakov.till@gmail.com>

# UE4SS is a Windows-only DLL-injection mod loader for Unreal Engine 4/5 games.
# This package ships the upstream Win64 payload as pacman-managed data so users
# keep a single current, checksummed copy instead of hand-downloading arbitrary
# builds. ue4ss-install deploys it into a game's Binaries/Win64 folder (inside a
# Wine/Proton prefix or native install). Nothing here runs on the Arch host, so
# arch=any: the DLLs are x86_64 PE *guest* code, not host binaries.
pkgname=ue4ss
pkgver=4.0.0
pkgrel=2
pkgdesc="Lua/C++ mod loader DLLs for Win64 Unreal Engine 4/5 games (stable)"
arch=('any')
url="https://docs.ue4ss.com/"
license=('MIT')
depends=('bash')
optdepends=('wine: run Windows Unreal Engine games under Wine/Proton to mod them')
options=('!strip' '!debug')
source=("ue4ss-${pkgver}.zip::https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v${pkgver}/UE4SS_v${pkgver}.zip"
        "ue4ss-install")
sha256sums=('251ad0d1381a241750e036f5918cbf2b5d7ec58ebc608cb2dd09d459d0c81e45'
            '4b8f23e80ab84888d75200987bf7aa315a21c53b956cdc51d6ee689031996f0b')

latestver() {
    # Latest non-prerelease release (the experimental-latest rolling build is a
    # prerelease and is intentionally excluded here — see ue4ss-experimental).
    gh api repos/UE4SS-RE/RE-UE4SS/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    # Upstream's install shape: only the dwmapi.dll proxy sits in the game's
    # Win64 directory, and every other file lives in a ue4ss/ subfolder beside
    # it. Mirror that tree so the deploy helper reproduces it verbatim.
    install -d "$pkgdir/usr/share/ue4ss"
    cp -r "$srcdir/dwmapi.dll" "$srcdir/ue4ss" "$pkgdir/usr/share/ue4ss/"

    install -Dm644 "$srcdir/ue4ss/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # The license belongs under /usr/share/licenses, not in the game folder.
    rm -f "$pkgdir/usr/share/ue4ss/ue4ss/LICENSE"

    chmod -R u=rwX,go=rX "$pkgdir/usr/share/ue4ss"
    install -Dm755 "$srcdir/ue4ss-install" "$pkgdir/usr/bin/ue4ss-install"
}
