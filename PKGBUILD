# Maintainer: Yakov Till <yakov.till@gmail.com>

# UE4SS is a Windows-only DLL-injection mod loader for Unreal Engine 4/5 games.
# This package tracks the experimental channel, where all active development
# ships (stable v3.0.1 dates from 2024-02). The release asset filename embeds a
# git-describe string, so pkgver maps that to Arch form by replacing '-' with
# '_' (3.0.1-953-gb872ad11 -> 3.0.1_953_gb872ad11) and the source URL
# reconstructs the original filename. Nothing here runs on the Arch host (the
# DLLs are x86_64 PE *guest* code), hence arch=any.
#
# Source the `experimental` (archival) tag, NOT `experimental-latest`. Upstream
# CI uploads each uniquely-named build to `experimental` permanently (append-
# only, 300+ historical builds) but DELETES and re-uploads `experimental-latest`
# on every build — so an `experimental-latest` URL 404s the moment a newer build
# lands, while an `experimental` URL stays valid forever. Pinning the archival
# tag means a published pkgver never becomes uninstallable; updates are routine,
# not a race against upstream.
pkgname=ue4ss-experimental
pkgver=3.0.1_1016_g6c26f038
pkgrel=1
pkgdesc="Lua/C++ mod loader DLLs for Win64 Unreal Engine 4/5 games (experimental)"
arch=('any')
url="https://docs.ue4ss.com/"
license=('MIT')
depends=('bash')
optdepends=('wine: run Windows Unreal Engine games under Wine/Proton to mod them')
provides=('ue4ss')
conflicts=('ue4ss')
options=('!strip' '!debug')

_verstr="${pkgver//_/-}"
source=("ue4ss-${pkgver}.zip::https://github.com/UE4SS-RE/RE-UE4SS/releases/download/experimental/UE4SS_v${_verstr}.zip"
        "ue4ss-install")
sha256sums=('1a60989c29f94791f880f6e46130a7121533ffde753482572cba4a2e69f5fed9'
            'd5ae8372ecdc7171c7a6179511bf9dd8fe1905a83eac03abf7ae1292fe780cb0')

latestver() {
    # The archival `experimental` tag holds every build, so pick the newest by
    # git-describe commit count (the integer after the first '-'), then map the
    # '-' separators to '_' for a valid, monotonically sorting Arch pkgver. The
    # ^UE4SS_v anchor excludes zDEV-/zCustomGameConfigs/zMapGenBP.
    gh api repos/UE4SS-RE/RE-UE4SS/releases/tags/experimental --jq '.assets[].name' \
        | grep -oP '^UE4SS_v\K[0-9]+\.[0-9]+\.[0-9]+-[0-9]+-g[0-9a-f]+' \
        | sort -V | tail -1 | tr '-' '_'
}

package() {
    # Experimental uses the 3.x split layout: dwmapi.dll at the archive root plus
    # everything else under ue4ss/ (UE4SS.dll, UE4SS-settings.ini, LICENSE, Mods/).
    install -d "$pkgdir/usr/share/ue4ss"
    cp -r "$srcdir/dwmapi.dll" "$srcdir/ue4ss" "$pkgdir/usr/share/ue4ss/"
    chmod -R u=rwX,go=rX "$pkgdir/usr/share/ue4ss"

    install -Dm644 "$srcdir/ue4ss/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # The license lives under /usr/share/licenses; don't also ship it in the payload.
    rm -f "$pkgdir/usr/share/ue4ss/ue4ss/LICENSE"

    install -Dm755 "$srcdir/ue4ss-install" "$pkgdir/usr/bin/ue4ss-install"
}
