# Maintainer: Yakov Till <yakov.till@gmail.com>

# zDEV variant of ue4ss: upstream's developer release asset. Its UE4SS.dll and
# dwmapi.dll are the same binaries as in the regular UE4SS_v*.zip; on top of
# them it ships UE4SS.pdb (the debug symbols UE4SS uses to symbolicate its own
# crash dumps), the offline Lua API reference (API.txt), CustomGameConfigs,
# the MapGenBP blueprint project, and the VTable/member-variable layout
# templates plus signature examples used to add support for unsupported games.
# The PDB must sit next to UE4SS.dll in the game folder, so ue4ss-install
# deploys it with the rest of the payload — picking this variant opts into
# that. UE4SS is a Windows-only DLL-injection mod loader; nothing here runs on
# the Arch host (x86_64 PE *guest* code), hence arch=any. See the ue4ss
# package for the general packaging rationale.
pkgname=ue4ss-zdev
pkgver=3.0.1
pkgrel=1
pkgdesc="Lua/C++ mod loader DLLs for Win64 Unreal Engine 4/5 games (stable, with debug symbols and dev assets)"
arch=('any')
url="https://docs.ue4ss.com/"
license=('MIT')
depends=('bash')
optdepends=('wine: run Windows Unreal Engine games under Wine/Proton to mod them')
provides=('ue4ss')
conflicts=('ue4ss')
options=('!strip' '!debug')
# The stable v3.0.1 release zip ships no LICENSE; pull it from the repo at the tag.
source=("ue4ss-zdev-${pkgver}.zip::https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v${pkgver}/zDEV-UE4SS_v${pkgver}.zip"
        "LICENSE::https://raw.githubusercontent.com/UE4SS-RE/RE-UE4SS/v${pkgver}/LICENSE"
        "ue4ss-install")
sha256sums=('af777d2af33fce4d520de35a8665e417376bcc530fec647778012ce6cdf51b2b'
            'ddc030e25d0ea87aca4ae84c0ed3f868d69273c00c0c12ea1e26f1c6130f5d2e'
            'd5ae8372ecdc7171c7a6179511bf9dd8fe1905a83eac03abf7ae1292fe780cb0')

latestver() {
    # Latest non-prerelease release (the experimental-latest rolling build is a
    # prerelease and is intentionally excluded — see ue4ss-experimental-zdev).
    gh api repos/UE4SS-RE/RE-UE4SS/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    # v3.0.1 zDEV uses the flat layout (everything at the archive root). Ship
    # the functional payload only (skip the bundled Changelog.md / README.md —
    # they are noise in a game folder).
    install -d "$pkgdir/usr/share/ue4ss"
    cp -r "$srcdir/dwmapi.dll" "$srcdir/UE4SS.dll" "$srcdir/UE4SS.pdb" \
          "$srcdir/UE4SS-settings.ini" "$srcdir/API.txt" "$srcdir/Mods" \
          "$srcdir/CustomGameConfigs" "$srcdir/MapGenBP" \
          "$srcdir/MemberVarLayoutTemplates" "$srcdir/VTableLayoutTemplates" \
          "$srcdir/UE4SS_Signatures" "$pkgdir/usr/share/ue4ss/"
    chmod -R u=rwX,go=rX "$pkgdir/usr/share/ue4ss"

    install -Dm755 "$srcdir/ue4ss-install" "$pkgdir/usr/bin/ue4ss-install"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
