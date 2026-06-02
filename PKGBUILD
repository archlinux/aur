# Maintainer: Yakov Till <yakov.till@gmail.com>

# UE4SS is a Windows-only DLL-injection mod loader for Unreal Engine 4/5 games.
# This package ships the upstream Win64 payload as pacman-managed data so users
# keep a single current, checksummed copy instead of hand-downloading arbitrary
# builds. ue4ss-install deploys it into a game's Binaries/Win64 folder (inside a
# Wine/Proton prefix or native install). Nothing here runs on the Arch host, so
# arch=any: the DLLs are x86_64 PE *guest* code, not host binaries.
pkgname=ue4ss
pkgver=3.0.1
pkgrel=1
pkgdesc="Lua/C++ mod loader DLLs for Win64 Unreal Engine 4/5 games (stable)"
arch=('any')
url="https://docs.ue4ss.com/"
license=('MIT')
depends=('bash')
optdepends=('wine: run Windows Unreal Engine games under Wine/Proton to mod them')
options=('!strip' '!debug')
# The stable v3.0.1 release zip ships no LICENSE; pull it from the repo at the tag.
source=("ue4ss-${pkgver}.zip::https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v${pkgver}/UE4SS_v${pkgver}.zip"
        "LICENSE::https://raw.githubusercontent.com/UE4SS-RE/RE-UE4SS/v${pkgver}/LICENSE"
        "ue4ss-install")
sha256sums=('4b47d4bceddd2f561a4e395bfa00924ccfc945af576a2d0c613e6537846c57ec'
            'ddc030e25d0ea87aca4ae84c0ed3f868d69273c00c0c12ea1e26f1c6130f5d2e'
            'd5ae8372ecdc7171c7a6179511bf9dd8fe1905a83eac03abf7ae1292fe780cb0')

latestver() {
    # Latest non-prerelease release (the experimental-latest rolling build is a
    # prerelease and is intentionally excluded here — see ue4ss-experimental).
    gh api repos/UE4SS-RE/RE-UE4SS/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    # v3.0.1 uses the flat layout: dwmapi.dll + UE4SS.dll + UE4SS-settings.ini +
    # Mods/ all at the archive root. Ship the functional payload only (skip the
    # bundled Changelog.md / README.md — they are noise in a game folder).
    install -d "$pkgdir/usr/share/ue4ss"
    cp -r "$srcdir/dwmapi.dll" "$srcdir/UE4SS.dll" "$srcdir/UE4SS-settings.ini" \
          "$srcdir/Mods" "$pkgdir/usr/share/ue4ss/"
    chmod -R u=rwX,go=rX "$pkgdir/usr/share/ue4ss"

    install -Dm755 "$srcdir/ue4ss-install" "$pkgdir/usr/bin/ue4ss-install"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
