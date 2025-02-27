# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname='vrcx-bin'
pkgdesc='Friendship management tool for VRChat (extracted AppImage version)'
pkgver='2025.03.01'
pkgrel='1'
arch=('x86_64')
url='https://vrcx.app/'
license=('MIT')
depends=('nss' 'alsa-lib' 'nspr' 'hicolor-icon-theme' 'dotnet-runtime-9.0' 'gtk3' 'libappindicator-gtk3' 'libindicator-gtk2' 'libnotify' 'libxss' 'libxtst')
makedepends=('squashfs-tools')
conflicts=('vrcx')
provides=('vrcx')
source=("https://github.com/vrcx-team/VRCX/releases/download/v$pkgver/VRCX_${pkgver//./}.AppImage"
        "LICENSE-v$pkgver::https://raw.githubusercontent.com/vrcx-team/VRCX/refs/tags/v$pkgver/LICENSE"
        'vrcx'
        'VRCX.desktop')
sha256sums=('77eb2a79b3c3642d065ad77ee7f47529720a51ba59d24f5816ea6c7f6f481c2b'
            '1927804117a7ac55e00646df36f77edd09d2cfee850588fc453a81d01bad90d1'
            'c3ccbe3fab13b0ff78278d34106e06ac334b4becee7f311f1dcbcf122e950478'
            '81271c8d53c51e255eb65b9f4e671f7b3e51c7c123229d6c9adcdc9233a543ce')

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
    mkdir opt
    extract_appimage "VRCX_${pkgver//./}.AppImage" opt/vrcx -no-xattrs
    rm -f opt/vrcx/AppRun
    rm -f opt/vrcx/.DirIcon
    rm -f opt/vrcx/vrcx.desktop
    rm -f opt/vrcx/resources/app-update.yml
    rm -rf opt/vrcx/usr/lib
    mv opt/vrcx/usr usr
    sed -i -e "s/^Version=.*/Version=$pkgver/" VRCX.desktop
}

package() {
    install -d -Dm755 "$pkgdir/opt"
    cp -r opt/vrcx "$pkgdir/opt"
    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 vrcx -t "$pkgdir/usr/bin"
    install -d -Dm755 "$pkgdir/usr/share"
    cp -r usr/share/icons "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/applications"
    install -Dm644 VRCX.desktop -t "$pkgdir/usr/share/applications"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "LICENSE-v$pkgver" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 opt/vrcx/LICENSE.electron.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 opt/vrcx/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname"

    find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type l -print0 | while IFS='' read -r -d '' file; do
        target="$(readlink -- "$file")"
        case "$target" in
            /*) :;;
            usr/*) ln -sf -- "../../$target" "$file";;
        esac
    done

    find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type d -print0 | while IFS='' read -r -d '' dir; do
        chmod 0755 -- "$dir"
        chown 0:0 -- "$dir"
    done

    find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type f -print0 | while IFS='' read -r -d '' file; do
        chmod 0644 -- "$file"
        chown 0:0 -- "$file"
    done
    
    find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type l -o -type d -o -type f -o -print0 | while IFS='' read -r -d '' file; do
        error 'File of unrecognized type: %s' "${file#"$pkgdir"}"
        rm -- "$file"
    done
    
    chmod 0755 "$pkgdir/opt/vrcx/vrcx"
}
