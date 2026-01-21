# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname='vrcft-avalonia-bin'
pkgdesc='Cross-platform VRCFaceTracking made with Avalonia (extracted AppImage version)'
pkgver='1.1.1.0'
pkgrel='3'
arch=('x86_64')
url='https://github.com/dfgHiatus/VRCFaceTracking.Avalonia'
license=('Apache-2.0')
depends=('hicolor-icon-theme' 'gtk3' 'libnotify' 'libxss' 'libxtst')
makedepends=('squashfs-tools')
conflicts=('vrcft' 'vrcft-avalonia')
provides=('vrcft' 'vrcft-avalonia')
source=("https://github.com/dfgHiatus/VRCFaceTracking.Avalonia/releases/download/v$pkgver/VRCFaceTracking.Avalonia.$pkgver.AppImage"
        'vrcft'
        'VRCFaceTracking.Avalonia.desktop')
sha256sums=('a16f2db2b25f0bcc282f6ac257222d164e2847c3354a543f634bc0d4468e8464'
            '19c91b186937680da1ffc7cb75f03202722d69e01a0b4a454a743a44fbff6f09'
            '393092bf0c037c5c89a3a24555cf1281a36523648f97bfa4e6066f24004ee999')

# AppImage related functions copied from https://gist.github.com/openglfreak/585b6f1ba965d183c6d0e2ee8778c204

# description:
#   Gets the end of the section header table from an ELF file
# params:
#   path: string
#     The path to the ELF file
# outputs:
#   The end of the section header table, in decimal
get_shdr_table_end() (
    [ "$#" -eq 1 ] || return
    elf_header="$(LC_ALL=C readelf -h -- "$1")" || return
    e_shoff="$(printf '%s\n' "$elf_header" | sed -n 's/^ *Start of section headers: *\([0-9][0-9]*\) (bytes into file)$/\1/p;t q;b;:q q')" || return
    [ -n "$e_shoff" ] || return
    e_shentsize="$(printf '%s\n' "$elf_header" | sed -n 's/^ *Size of section headers: *\([0-9][0-9]*\) (bytes)$/\1/p;t q;b;:q q')" || return
    [ -n "$e_shentsize" ] || return
    e_shnum="$(printf '%s\n' "$elf_header" | sed -n 's/^ *Number of section headers: *\([0-9][0-9]*\)$/\1/p;t q;b;:q q')" || return
    [ -n "$e_shnum" ] || return
    printf '%s\n' "$((e_shoff+e_shentsize*e_shnum))"
)

# description:
#   Gets the end of the last section of an ELF file
# params:
#   path: string
#     The path to the ELF file
# outputs:
#   The end of the last section, in decimal
get_last_section_end() (
    [ "$#" -eq 1 ] || return
    elf_sections="$(LC_ALL=C readelf -W -S -- "$1")" || return
    IFS=' ' read -r offset size _rest <<EOF
$(printf '%s\n' "$elf_sections" | sed -n 's/^  \[ *[0-9][0-9]*\] [^ ]*  *[^ ]*  *[0-9A-Fa-f][0-9A-Fa-f]* \([0-9A-Fa-f][0-9A-Fa-f]*\) \([0-9A-Fa-f][0-9A-Fa-f]*\) .*$/\1 \2/p' | tail -n 1)
EOF
    [ -n "$offset" ] || return
    [ -n "$size" ] || return
    [ -z "$_rest" ] || return
    printf '%s\n' "$((0x$offset+0x$size))"
)

# description:
#   Gets the offset of the squashfs from an AppImage
# params:
#   path: string
#     The path to the AppImage
# outputs:
#   The offset of the squashfs, in decimal
get_squashfs_offset() (
    [ "$#" -eq 1 ] || return
    end1="$(get_shdr_table_end "$1")" || end1=0
    end2="$(get_last_section_end "$1")" || end2=0
    if [ "$end1" -gt "$end2" ]; then
        printf '%s\n' "$end1"
    else
        printf '%s\n' "$end2"
    fi
)

# description:
#   Extracts the contents of an AppImage to a directory
# params:
#   appimage: string
#     The path to the AppImage
#   directory: string
#     The path to the directory to extract into
#   [options...]: string
#     Further unsquashfs parameters
# outputs:
#   unsquashfs output
extract_appimage() (
    [ "$#" -ge 2 ] || return
    file="$1"
    dir="$2"
    shift; shift
    offset="$(get_squashfs_offset "$file")" || return
    unsquashfs -o "$offset" -d "$dir" ${1+"$@"} /dev/stdin <"$file"
)

build() {
    extract_appimage "VRCFaceTracking.Avalonia.$pkgver.AppImage" appimage -no-xattrs

    rm -f appimage/AppRun
    rm -f appimage/.DirIcon
    rm -f appimage/VRCFaceTracking.Avalonia.desktop
    rmdir appimage/usr/bin/Languages
    mv appimage/VRCFaceTracking.Avalonia.png ./
    mv appimage/usr/bin ./
    rmdir appimage/usr
    rmdir appimage

    sed -i -e "s/^Version=.*/Version=$pkgver/" VRCFaceTracking.Avalonia.desktop
}

package() {
    install -d -Dm755 "$pkgdir/opt"
    install -d -Dm755 "$pkgdir/opt/vrcft-avalonia"
    cp -r bin/. "$pkgdir/opt/vrcft-avalonia"
    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 vrcft -t "$pkgdir/usr/bin"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/applications"
    install -Dm644 VRCFaceTracking.Avalonia.desktop -t "$pkgdir/usr/share/applications"
    install -d -Dm755 "$pkgdir/usr/share/icons"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/128x128"
    install -d -Dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    install -Dm644 VRCFaceTracking.Avalonia.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"

    find "$pkgdir/opt/vrcft-avalonia" -type d -print0 | while IFS='' read -r -d '' dir; do
        chmod 0755 -- "$dir"
        chown 0:0 -- "$dir"
    done

    find "$pkgdir/opt/vrcft-avalonia" -type f -print0 | while IFS='' read -r -d '' file; do
        chmod 0644 -- "$file"
        chown 0:0 -- "$file"
    done

    find "$pkgdir/opt/vrcft-avalonia" -type l -o -type d -o -type f -o -print0 | while IFS='' read -r -d '' file; do
        error 'File of unrecognized type: %s' "${file#"$pkgdir"}"
        rm -- "$file"
    done

    chmod 0755 "$pkgdir/opt/vrcft-avalonia/VRCFaceTracking.Avalonia.Desktop"
}
