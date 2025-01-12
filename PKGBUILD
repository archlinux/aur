# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname='vrcx-bin'
pkgdesc='Friendship management tool for VRChat (extracted AppImage version)'
_pkgver='2025-01-11T00.49-b29dc8d'
pkgver="${_pkgver//-/.}"
pkgrel='1'
arch=('x86_64')
url='https://vrcx.app/'
license=('MIT')
depends=('nss' 'alsa-lib' 'nspr' 'hicolor-icon-theme' 'gtk3' 'libappindicator-gtk3' 'libindicator-gtk2' 'libnotify' 'libxss' 'libxtst')
makedepends=('squashfs-tools')
conflicts=('vrcx')
provides=('vrcx')
source=("https://github.com/Natsumi-sama/VRCX/releases/download/$_pkgver/VRCX_$_pkgver.AppImage"
        "https://raw.githubusercontent.com/Natsumi-sama/VRCX/refs/tags/$_pkgver/LICENSE"
        'vrcx'
        'vrcx.desktop')
sha256sums=('dd469268f49c632b5ac6745a88bb28e2a42ffb548e5427df51584bc2b27756e8'
            '47632c518fb825225fa0b792caebc12165fb153a3f510c57fc1d3b0793a5394d'
            'c3ccbe3fab13b0ff78278d34106e06ac334b4becee7f311f1dcbcf122e950478'
            'f367ad84fa61503389d20fe747dc0af48974da6909ce9135589939613935ce6f')

get_squashfs_offset() (
    elf_header="$(LC_ALL=C readelf -h -- "$1")" || return
    e_shoff="$(printf '%s\n' "$elf_header" | sed -n 's/^ *Start of section headers: *\([0-9][0-9]*\) (bytes into file)$/\1/p;t q;b;:q q')" || return
    [ -n "$e_shoff" ] || return
    e_shentsize="$(printf '%s\n' "$elf_header" | sed -n 's/^ *Size of section headers: *\([0-9][0-9]*\) (bytes)$/\1/p;t q;b;:q q')" || return
    [ -n "$e_shentsize" ] || return
    e_shnum="$(printf '%s\n' "$elf_header" | sed -n 's/^ *Number of section headers: *\([0-9][0-9]*\)$/\1/p;t q;b;:q q')" || return
    [ -n "$e_shnum" ] || return
    printf '%s\n' "$((e_shoff+e_shentsize*e_shnum))"
)

extract_appimage() (
    [ "$#" -ge 2 ] || return
    file="$1"
    dir="$2"
    shift; shift
    offset="$(get_squashfs_offset "$file")" || return
    unsquashfs -no-xattrs -o "$offset" -d "$dir" "$@" /dev/stdin <"$file"
)

build() {
    mkdir opt
    extract_appimage "VRCX_$_pkgver.AppImage" opt/vrcx
    rm -f opt/vrcx/AppRun
    rm -f opt/vrcx/.DirIcon
    rm -f opt/vrcx/vrcx.desktop
    rm -f opt/vrcx/resources/app-update.yml
    rm -rf opt/vrcx/usr/lib
    mv opt/vrcx/usr usr
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
    install -Dm644 vrcx.desktop -t "$pkgdir/usr/share/applications"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 opt/vrcx/LICENSE.electron.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 opt/vrcx/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname"

    find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type l -print0 | while IFS='' read -r file; do
        target="$(readlink -- "$file")"
        case "$target" in
            /*) :;;
            usr/*) ln -sf -- "../../$target" "$file";;
        esac
    done

    find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type d -print0 | while IFS='' read -r dir; do
        chmod 0755 -- "$dir"
        chown 0:0 -- "$dir"
    done

    find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type f -print0 | while IFS='' read -r file; do
        chmod 0644 -- "$file"
        chown 0:0 -- "$file"
    done
    
    find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type l -o -type d -o -type f -o -print0 | while IFS='' read -r file; do
        error 'File of unrecognized type: %s' "${file#"$pkgdir"}"
        rm -- "$file"
    done
    
    chmod 0755 "$pkgdir/opt/vrcx/vrcx"
}
