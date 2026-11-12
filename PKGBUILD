# Maintainer: Yakov Till <yakov.till@gmail.com>

# zDEV variant of ue4ss: upstream's developer release asset. Its UE4SS.dll and
# dwmapi.dll are the same binaries as in the regular UE4SS_v*.zip; on top of
# them it ships UE4SS.pdb (the debug symbols UE4SS uses to symbolicate its own
# crash dumps), CustomGameConfigs, the MapGenBP blueprint project, and the
# VTable/member-variable layout templates, signature examples and UVTD configs
# used to add support for unsupported games. The PDB must sit next to
# UE4SS.dll in the game folder, so ue4ss-install deploys it with the rest of
# the payload — picking this variant opts into that. UE4SS is a Windows-only
# DLL-injection mod loader; nothing here runs on the Arch host (x86_64 PE
# *guest* code), hence arch=any. See the ue4ss package for the general
# packaging rationale.
pkgname=ue4ss-zdev
pkgver=4.0.0
pkgrel=2
pkgdesc="Lua/C++ mod loader DLLs for Win64 Unreal Engine 4/5 games (stable, with debug symbols and dev assets)"
arch=('any')
url="https://docs.ue4ss.com/"
license=('MIT')
depends=('bash')
optdepends=('wine: run Windows Unreal Engine games under Wine/Proton to mod them')
provides=('ue4ss')
conflicts=('ue4ss')
options=('!strip' '!debug')
source=("ue4ss-zdev-${pkgver}.zip::https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v${pkgver}/zDEV-UE4SS_v${pkgver}.zip"
        "ue4ss-install")
sha256sums=('02401c207b8fecfa0f38e8bf4df1d83ee87d7e190af2f02ca5d4bc7cd7c2ef8c'
            '4b8f23e80ab84888d75200987bf7aa315a21c53b956cdc51d6ee689031996f0b')

latestver() {
    # Latest non-prerelease release (the experimental-latest rolling build is a
    # prerelease and is intentionally excluded — see ue4ss-experimental-zdev).
    gh api repos/UE4SS-RE/RE-UE4SS/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    # Upstream's install shape: only the dwmapi.dll proxy sits in the game's
    # Win64 directory, and every other file lives in a ue4ss/ subfolder beside
    # it. Mirror that tree so the deploy helper reproduces it verbatim.
    install -d "$pkgdir/usr/share/ue4ss"
    cp -r "$srcdir/dwmapi.dll" "$srcdir/ue4ss" "$pkgdir/usr/share/ue4ss/"

    install -Dm644 "$srcdir/ue4ss/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # The license belongs under /usr/share/licenses, and Docs/ (a snapshot of
    # docs.ue4ss.com), README.md and Changelog.md are noise in a game folder —
    # the dev payload proper is the PDBs, tool mods, configs and templates.
    rm -rf "$pkgdir/usr/share/ue4ss/ue4ss/Docs"
    rm -f "$pkgdir/usr/share/ue4ss/ue4ss/LICENSE" \
          "$pkgdir/usr/share/ue4ss/ue4ss/README.md" \
          "$pkgdir/usr/share/ue4ss/ue4ss/Changelog.md"

    chmod -R u=rwX,go=rX "$pkgdir/usr/share/ue4ss"
    install -Dm755 "$srcdir/ue4ss-install" "$pkgdir/usr/bin/ue4ss-install"
}
