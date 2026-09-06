# Maintainer: Yakov Till <yakov.till@gmail.com>

# zDEV variant of ue4ss-experimental: upstream's developer release asset from
# the experimental channel. Its UE4SS.dll and dwmapi.dll are the same binaries
# as in the regular UE4SS_v*.zip; on top of them it ships UE4SS.pdb (the debug
# symbols UE4SS uses to symbolicate its own crash dumps), extra developer tool
# mods absent from the regular asset (ActorDumperMod, EventViewerMod,
# KismetDebuggerMod, jsbLuaProfilerMod), CustomGameConfigs, MapGenBP, and the
# VTable/member-variable layout templates used to add support for unsupported
# games. The PDBs must sit next to their DLLs in the game folder, so
# ue4ss-install deploys them with the rest of the payload — picking this
# variant opts into that. UE4SS is a Windows-only DLL-injection mod loader;
# nothing here runs on the Arch host (x86_64 PE *guest* code), hence arch=any.
#
# As in ue4ss-experimental: pkgver maps the git-describe string in the asset
# filename to Arch form ('-' -> '_'), and the source URL pins the append-only
# archival `experimental` tag, NOT `experimental-latest` (whose assets are
# deleted and re-uploaded on every CI build, 404ing published URLs).
pkgname=ue4ss-experimental-zdev
pkgver=3.0.1_1125_g527a483b
pkgrel=1
pkgdesc="Lua/C++ mod loader DLLs for Win64 Unreal Engine 4/5 games (experimental, with debug symbols and dev tool mods)"
arch=('any')
url="https://docs.ue4ss.com/"
license=('MIT')
depends=('bash')
optdepends=('wine: run Windows Unreal Engine games under Wine/Proton to mod them')
provides=('ue4ss' 'ue4ss-experimental')
conflicts=('ue4ss' 'ue4ss-experimental')
options=('!strip' '!debug')

_verstr="${pkgver//_/-}"
source=("ue4ss-experimental-zdev-${pkgver}.zip::https://github.com/UE4SS-RE/RE-UE4SS/releases/download/experimental/zDEV-UE4SS_v${_verstr}.zip"
        "ue4ss-install")
sha256sums=('b65b2fcc69e0c117525cb3ff85ed08d98d42c41eee559358bc241223067bb1bf'
            'd5ae8372ecdc7171c7a6179511bf9dd8fe1905a83eac03abf7ae1292fe780cb0')

latestver() {
    # Newest build on the archival `experimental` tag by git-describe commit
    # count. Anchored on the zDEV asset name so we never bump to a build whose
    # zDEV asset is missing.
    gh api repos/UE4SS-RE/RE-UE4SS/releases/tags/experimental --jq '.assets[].name' \
        | grep -oP '^zDEV-UE4SS_v\K[0-9]+\.[0-9]+\.[0-9]+-[0-9]+-g[0-9a-f]+' \
        | sort -V | tail -1 | tr '-' '_'
}

package() {
    # Experimental uses the 3.x split layout: dwmapi.dll at the archive root
    # plus everything else under ue4ss/.
    install -d "$pkgdir/usr/share/ue4ss"
    cp -r "$srcdir/dwmapi.dll" "$srcdir/ue4ss" "$pkgdir/usr/share/ue4ss/"
    chmod -R u=rwX,go=rX "$pkgdir/usr/share/ue4ss"

    install -Dm644 "$srcdir/ue4ss/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # The license lives under /usr/share/licenses, and Docs/ (a snapshot of
    # docs.ue4ss.com), README.md and Changelog.md are noise in a game folder —
    # the dev payload proper is the PDBs, tool mods, configs and templates.
    rm -rf "$pkgdir/usr/share/ue4ss/ue4ss/Docs"
    rm -f "$pkgdir/usr/share/ue4ss/ue4ss/LICENSE" \
          "$pkgdir/usr/share/ue4ss/ue4ss/README.md" \
          "$pkgdir/usr/share/ue4ss/ue4ss/Changelog.md"

    install -Dm755 "$srcdir/ue4ss-install" "$pkgdir/usr/bin/ue4ss-install"
}
