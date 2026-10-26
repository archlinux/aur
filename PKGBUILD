# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=diamond-dragon
pkgver=20250708
pkgrel=1
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

latestver() {
    # Doomworld's topic page is the announced version, but it sits behind a
    # Cloudflare managed challenge that rejects an unmodified curl and a
    # browser User-Agent alike, so it cannot be read. The four Google Drive
    # files are the distribution itself: a release is a replaced artifact, and
    # Drive reports each file's upload time, so the newest of those dates is
    # the version. Read as UTC because the release date is not a declared
    # field anywhere else.
    local _id _hdr _lm _date _newest=""
    for _id in "$_gdrive_main" "$_gdrive_augzen" "$_gdrive_hacx" "$_gdrive_neonover"; do
        # confirm=t is required: without it this endpoint answers 200 with an
        # empty body and no Last-Modified, which would read as no release at all.
        _hdr=$(curl -fsSI --max-time 30 \
                 "https://drive.usercontent.google.com/download?id=${_id}&export=download&confirm=t") || return 1
        _lm=$(grep -ioP '^last-modified:\s*\K.*' <<< "$_hdr" | tr -d '\r')
        # Reject an absent header rather than falling through: date(1) accepts an
        # empty string and answers with today, which would look like a release.
        [[ -z "$_lm" ]] && return 1
        _date=$(date -u -d "$_lm" +%Y%m%d) || return 1
        [[ -z "$_newest" || "$_date" > "$_newest" ]] && _newest=$_date
    done
    echo "$_newest"
}

_gdrive_fetch() {
    local id=$1 output=$2
    # Fetch straight to the file. Passing the artifact through a shell variable
    # (or through echo) deletes every null byte, which silently truncates these
    # ZIP archives; only the interstitial is ever read into a variable, and there
    # is none once the scan-confirm flag is set. bsdtar failing on a file this
    # endpoint did not serve is the intended loud failure.
    curl -fsSL -o "$output" \
        "https://drive.usercontent.google.com/download?id=${id}&export=download&confirm=t"
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
