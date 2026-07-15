# Maintainer: archibald869 <archibald869 at web dot de>
# Maintainer: Tom Hale <tom at hale dot ee>
#
# Binary variant of freefilesync: tracks the latest Donation Edition
# release from freefilesync.org and installs the pre-built binaries
# with the donor license key activated.
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=freefilesync-bin
_pkgname=freefilesync
pkgver=14.10
pkgrel=1
pkgdesc="Folder comparison and synchronization (Donation Edition)"
arch=("x86_64")
url="https://freefilesync.org"
license=('LicenseRef-freefilesync.org')
provides=("freefilesync")
conflicts=("freefilesync")
depends=("gtk3")
makedepends=("curl" "unzip")
options=(!strip !debug)

# Donation transaction ID: env var takes precedence, else read from ./FFS_tx
_FFS_TX="${_FFS_TX:-$(cat "${startdir}/FFS_tx")}"

_update_and_cache_flag='update_and_cache'

# Called from prepare() with arg: "${_pkgver_cache_file}" to write to file.
# With no argument (eg usual makepkg), print the version already cached.
pkgver() {
    local _pkgver_cache_file="${srcdir}/.pkgver"

    if [[ -e "${_pkgver_cache_file}" && $1 != "${_update_and_cache_flag}" ]]; then
        cat "$_pkgver_cache_file" && return 0
    fi

    # Fetch the thank-you page and extract the version from the Linux download URL
    local _page
    _page=$(curl -fsL -A Mozilla "${url}/thank-you.php?tx=${_FFS_TX}")

    # Extract version from: FreeFileSync_14.10_%5BDonation_Edition%5D_Linux.zip
    local _ver
    _ver=$(printf '%s\n' "$_page" \
        | grep -o 'FreeFileSync_[0-9.]*_%5BDonation_Edition%5D_Linux\.zip' \
        | head -1 \
        | grep -oE '[0-9]+\.[0-9]+([0-9]+)?(\.[0-9]+)?' \
        | head -1)

    if [[ -z "$_ver" ]]; then
        echo "Error: could not determine version from thank-you page" >&2
        return 1
    fi

    printf '%s\n' "$_ver" | tee "${_pkgver_cache_file}"
}

prepare() {
    pkgver=$(pkgver "${_update_and_cache_flag}")
    echo "Downloading FreeFileSync ${pkgver} Donation Edition..."

    # Fetch the thank-you page to get the full download URL (with expire & hash)
    local _page
    _page=$(curl -fsL -A Mozilla "${url}/thank-you.php?tx=${_FFS_TX}")

    # Extract the full Linux download URL from the HTML
    local _dl_url
    _dl_url=$(printf '%s\n' "$_page" \
        | grep -o 'https://freefilesync.org/supporter-edition/FreeFileSync_[^"]*Linux\.zip[^"]*' \
        | head -1)

    if [[ -z "$_dl_url" ]]; then
        echo "Error: could not find Linux download URL on thank-you page" >&2
        return 1
    fi

    cd "${srcdir}"

    # Download the Donation Edition zip
    curl -fL -A Mozilla -o "FreeFileSync_${pkgver}_Donation_Edition_Linux.zip" "$_dl_url"

    # Extract the .run installer and .license key
    unzip -o "FreeFileSync_${pkgver}_Donation_Edition_Linux.zip" -d "${srcdir}"

    # The .license file is the donor activation key; save it for package()
    local _license_file
    _license_file=$(find "${srcdir}" -name '*.license' | head -1)
    if [[ -z "$_license_file" ]]; then
        echo "Error: .license file not found in zip" >&2
        return 1
    fi
    cp "$_license_file" "${srcdir}/Registered.dat"
}

package() {
    install -d "$pkgdir/opt/$_pkgname"

    # extract installer archive from installer binary
    local _run_file
    _run_file=$(find "$srcdir" -name '*Install.run' | head -1)
    offset=$(grep -abo -m 1 -F "<FFS_TAR_START>" "$_run_file" | cut -d : -f 1)
    offset=$((offset + 16))
    tail -c +$offset "$_run_file" > "$srcdir/FreeFileSync_${pkgver}_Install.tar"

    # extract inner archive, freefilesync-mime.xml and .desktop files from installer archive
    tar -xf "$srcdir/FreeFileSync_${pkgver}_Install.tar" -C "$srcdir" --wildcards \
        FreeFileSync.tar.gz \
        freefilesync-mime.xml \
        '*.desktop'

    # extract inner archive
    tar -xzf "$srcdir/FreeFileSync.tar.gz" --no-same-owner -C "$pkgdir/opt/$_pkgname"

    # install the donor license key as Registered.dat (activates Donation Edition)
    install -Dm644 "$srcdir/Registered.dat" "$pkgdir/opt/$_pkgname/Resources/Registered.dat"

    # documentation
    install -d "$pkgdir/usr/share/doc/$_pkgname"
    ln -sf "/opt/$_pkgname/User Manual.pdf" "$pkgdir/usr/share/doc/$_pkgname/User_Manual.pdf"

    # license
    install -d "$pkgdir/usr/share/licenses/${pkgname}"
    cp "$pkgdir/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    # MIME types
    install -Dm644 -t "$pkgdir/usr/share/mime/packages/" "$srcdir/freefilesync-mime.xml"

    # icons
    install -Dm644 -t "$pkgdir/usr/share/pixmaps/" \
        "$pkgdir/opt/$_pkgname/Resources/FreeFileSync.png" \
        "$pkgdir/opt/$_pkgname/Resources/RealTimeSync.png"

    # desktop launchers
    for tmpl in "$srcdir"/*.template.desktop; do
        f="${tmpl/.template/}"
        # eliminate FFS_INSTALL_PATH and fix quoting of Exec command
        new='Exec=/bin/bash -c '"'"'paths=(%F); cd "$(dirname "${paths[0]}")"; "/opt/freefilesync/\1" "${paths[@]}"'"'"
        sed -E -e 's#^Exec=.+FFS_INSTALL_PATH/([^\\"]+)\\".+$'"#$new#" \
            -e 's#^(Exec=")FFS_INSTALL_PATH/([^"]+")#\1/opt/freefilesync/\2#' \
            -e 's#^(Icon="?)FFS_INSTALL_PATH/Resources/#\1#' \
            "$tmpl" > "$f"
        install -Dm644 -t "$pkgdir/usr/share/applications/" "$f"
    done
    # fix icon and categories in FreeFileSync-edit-with.desktop
    sed -e 's#^X-KDE-Priority=TopLevel$#X-KDE-Priority=TopLevel\nIcon=FreeFileSync.png\nCategories=Utility;FileTools;Archiving;#' \
        -i "$pkgdir/usr/share/applications/FreeFileSync-edit-with.desktop"
}
