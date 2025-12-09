# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=diamond-dragon
pkgver=20250707
pkgrel=2
pkgdesc="Catgirl cyberpunk action GZDoom gameplay mod"
arch=('any')
url="https://www.doomworld.com/forum/topic/153613-diamond-dragon-catgirl-cyberpunk-action-updated-7725/"
license=('custom')
depends=()
optdepends=('gzdoom: GZDoom source port'
            'uzdoom-bin: UZDoom fork of GZDoom')
makedepends=('curl')

# Google Drive file IDs
_gdrive_main="1WgEfXcawz38fKKag1ADZdf-OCocWFmDb"        # DiamondDragon.pk3
_gdrive_augzen="1zGOJmaAjPBOVCDwFXxHe3sQJzJWBtE16"      # AugZen Addon.pk3
_gdrive_hacx="1FLWE-HtaNX1cZv7JT_nhwArJMBeOMvar"        # Hacx2.0 Addon.pk3
_gdrive_neonover="1bGV0IZgL57eW8bgaAotXArKKn_ETf6LU"    # NeonOver Addon.pk3

_gdrive_fetch() {
    local id=$1 output=$2
    local page=$(curl -fsSL "https://drive.google.com/uc?export=download&id=${id}")
    if echo "$page" | grep -q 'download-form'; then
        local uuid=$(echo "$page" | grep -oP 'name="uuid" value="\K[^"]+')
        [[ -z "$uuid" ]] && { echo "Failed to extract uuid for $output"; return 1; }
        curl -fL --progress-bar -o "$output" \
            "https://drive.usercontent.google.com/download?id=${id}&export=download&confirm=t&uuid=${uuid}"
    else
        echo "$page" > "$output"
    fi
}

prepare() {
    _gdrive_fetch "$_gdrive_main" "DiamondDragon.pk3"
    _gdrive_fetch "$_gdrive_augzen" "AugZen-Addon.pk3"
    _gdrive_fetch "$_gdrive_hacx" "Hacx2.0-Addon.pk3"
    _gdrive_fetch "$_gdrive_neonover" "NeonOver-Addon.pk3"

    # Extract credits as license
    bsdtar -xf "DiamondDragon.pk3" CREDIT.txt
}

package() {
    install -Dm644 DiamondDragon.pk3 "$pkgdir/usr/share/doom/diamond-dragon/DiamondDragon.pk3"
    install -Dm644 AugZen-Addon.pk3 "$pkgdir/usr/share/doom/diamond-dragon/addons/AugZen-Addon.pk3"
    install -Dm644 Hacx2.0-Addon.pk3 "$pkgdir/usr/share/doom/diamond-dragon/addons/Hacx2.0-Addon.pk3"
    install -Dm644 NeonOver-Addon.pk3 "$pkgdir/usr/share/doom/diamond-dragon/addons/NeonOver-Addon.pk3"
    install -Dm644 CREDIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
