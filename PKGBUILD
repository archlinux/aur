# Maintainer: Tom Hale <tom at hale dot ee>

# Binary variant of freefilesync: tracks the latest Donation Edition
# release from freefilesync.org and installs the pre-built binaries
# with the donor license key activated.

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=freefilesync-donation-bin-release
_pkgname=freefilesync
pkgver=14.10
pkgrel=3
pkgdesc="Folder comparison and synchronization (Donation Edition)"
arch=("x86_64")
url="https://freefilesync.org"
license=('LicenseRef-freefilesync.org')
provides=("freefilesync")
conflicts=("freefilesync" "freefilesync-bin")
depends=("gtk3")
makedepends=("curl" "unzip")
install=".install"
options=(!strip !debug)

_update_and_cache_flag='This is used by prepare() calling pkgver() to save version of the downloaded release'

# Called from prepare() with arg: "${_pkgver_cache_file}" to write to file.
# With no argument (eg usual makepkg), print the version already cached.
pkgver() {
    local _pkgver_cache_file="${srcdir}/.pkgver"

    if [[ -e "${_pkgver_cache_file}" && $1 != "${_update_and_cache_flag}" ]]; then
        cat "$_pkgver_cache_file" && return 0
    fi

    # Extract version from the Linux download URL on the thank-you page:
    # FreeFileSync_14.10_%5BDonation_Edition%5D_Linux.zip
    local _ver
    _ver=$(curl -fsL -A Mozilla "${url}/thank-you.php?tx=${_FFS_TX}" \
        | grep -oE 'FreeFileSync_[0-9.]+_%5BDonation_Edition%5D_Linux\.zip' \
        | head -1 | grep -oE '[0-9]+\.[0-9]+([0-9]+)?(\.[0-9]+)?' | head -1)

    if [[ -z "$_ver" ]]; then
        echo "Error: could not determine version from thank-you page" >&2
        return 1
    fi

    printf '%s\n' "$_ver" | tee "${_pkgver_cache_file}"
}

prepare() {
    local _donation_tx_file=$XDG_CONFIG_HOME/FreeFileSync/DonationLicenceTx

    # Donation transaction ID: env var $_FFS_TX takes precedence, else read from $_donation_tx_file
    # Expected value is in format: pi_xxxxxxxxxxxxxxxxxxxxxxxx
    _FFS_TX="${_FFS_TX:-$(cat "${_donation_tx_file}")}" || {
        cat <<EOF

ERROR: Donation transaction token not found, either via (in order):
- \$_FFS_TX
- $_donation_tx_file

NOTE: expected value is in format: pi_xxxxxxxxxxxxxxxxxxxxxxxx
EOF
        exit 1
    }

    pkgver=$(pkgver "${_update_and_cache_flag}")
    echo "Downloading FreeFileSync ${pkgver} Donation Edition..."

    local _zip_file="FreeFileSync_${pkgver}_Donation_Edition_Linux.zip"

    # Fetch the thank-you page to get the full download URL (with expire & hash)
    local _dl_url
    _dl_url=$(curl -fsL -A Mozilla "${url}/thank-you.php?tx=${_FFS_TX}" \
        | grep -oE 'https://freefilesync.org/supporter-edition/FreeFileSync_[^"]*Linux\.zip[^"]*' \
        | head -1)

    if [[ -z "$_dl_url" ]]; then
        echo "Error: could not find Linux download URL on thank-you page" >&2
        return 1
    fi

    cd "${srcdir}"

    # Download and extract the Donation Edition zip
    curl -fL -A Mozilla -o "$_zip_file" "$_dl_url"
    unzip -o "$_zip_file" -d "${srcdir}"

    # The .license file is the donor activation key; save it for package()
    cp "FreeFileSync_${pkgver}_[Donation_Edition]_Install.license" "${srcdir}/Registered.dat"

    # Extract installer archive from the .run binary and unpack inner archives
    local _run_file="FreeFileSync_${pkgver}_[Donation_Edition]_Install.run"
    local offset
    offset=$(grep -abo -m 1 -F "<FFS_TAR_START>" "$_run_file" | cut -d : -f 1)
    offset=$((offset + 16))  # skip past the <FFS_TAR_START> marker (16 bytes)
    tail -c +$offset "$_run_file" | tar -xf - --wildcards \
        FreeFileSync.tar.gz \
        freefilesync-mime.xml \
        '*.desktop'
}

package() {
    install -d "$pkgdir/opt/$_pkgname"

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
        # shellcheck disable=SC2016 # $() is intentionally literal for the desktop file
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

# vim:set ts=2 sw=2 et ft=PKGBUILD:
