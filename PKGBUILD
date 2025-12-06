# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

_omit_libs=true
_omit_dlls=false
_electron_ver=38
_dotnet_ver=9.0
_runtime_ver=9
_sdk_ver=110

pkgname='vrcx-bin'
pkgdesc='Friendship management tool for VRChat (extracted AppImage version)'
pkgver='2025.12.06'
pkgrel='2'
arch=('x86_64')
url='https://vrcx.app/'
license=('MIT')
depends=('nss' 'alsa-lib' 'nspr' 'hicolor-icon-theme' "dotnet-runtime-$_dotnet_ver" 'gtk3' 'libnotify' 'libxss' 'libxtst')
makedepends=('squashfs-tools')
conflicts=('vrcx')
provides=('vrcx')
source=("https://github.com/vrcx-team/VRCX/releases/download/v$pkgver/VRCX_${pkgver}_x64.AppImage"
        "LICENSE-v$pkgver::https://raw.githubusercontent.com/vrcx-team/VRCX/refs/tags/v$pkgver/LICENSE"
        'vrcx'
        'VRCX.desktop')
sha256sums=('7b53f04f8eed61fceed41362fef209934f13a568ccee6cf5e283bd041d381197'
            '1927804117a7ac55e00646df36f77edd09d2cfee850588fc453a81d01bad90d1'
            '464858e86b74bc4c49c8ec4b59aded48bcd8f0f57ab5366b1bbe77db1d868033'
            'bdf079d1d72c5a207ae8322303a8c0c7b61fbcbc0eff6bd4a42b461f50137ff3')

if [ "$_omit_libs" = true ]; then
    depends+=('libglvnd' 'vulkan-icd-loader' "electron$_electron_ver")
fi
if [ "$_omit_dlls" = true ]; then
    depends+=("dotnet-runtime=$_dotnet_ver.$_runtime_ver.sdk$_sdk_ver" "dotnet-sdk=$_dotnet_ver.$_runtime_ver.sdk$_sdk_ver")
fi

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
    extract_appimage "VRCX_${pkgver}_x64.AppImage" opt/vrcx -no-xattrs
    rm -f opt/vrcx/AppRun
    rm -f opt/vrcx/.DirIcon
    rm -f opt/vrcx/vrcx.desktop
    rm -f opt/vrcx/resources/app-update.yml
    rm -rf opt/vrcx/resources/app.asar.unpacked/build/Electron/dotnet-runtime
    rm -rf opt/vrcx/resources/dotnet-runtime
    if [ "$_omit_libs" = true ]; then
        rm -f opt/vrcx/resources/app.asar.unpacked/build/Electron/Microsoft.Win32.SystemEvents.dll
        rm -f opt/vrcx/resources/app.asar.unpacked/build/Electron/System.Management.dll
        rm -f opt/vrcx/resources/app.asar.unpacked/build/Electron/System.Private.Windows.Core.dll
        rm -f opt/vrcx/resources/app.asar.unpacked/build/Electron/System.Security.Cryptography.ProtectedData.dll
        rm -f opt/vrcx/resources/app.asar.unpacked/build/Electron/System.Windows.Extensions.dll

        (
            CDPATH='' cd opt/vrcx/resources/app.asar.unpacked/node_modules/node-api-dotnet
            case "$CARCH" in
                x86_64) netarch=x64;;
                i686|pentium4) netarch=x32;;
                aarch64) netarch=arm64;;
                armv7h) netarch=arm32;;
            esac
            for path in linux-*; do
                case "$path" in
                    linux-"$netarch") :;;
                    *) rm -rf -- "$path";;
                esac
            done
            for path in net*; do
                case "$path" in
                    net"$_dotnet_ver"|net"$_dotnet_ver".js) :;;
                    *) rm -rf -- "$path";;
                esac
            done
            rm -rf -- osx-*
            rm -rf -- win-*
        )

        rm -f opt/vrcx/vk_swiftshader_icd.json
        rm -f opt/vrcx/libvk_swiftshader.so
        ln -sf "../../usr/lib/electron$_electron_ver/libEGL.so" opt/vrcx/libEGL.so
        ln -sf "../../usr/lib/electron$_electron_ver/libGLESv2.so" opt/vrcx/libGLESv2.so
        ln -sf "../../usr/lib/electron$_electron_ver/libffmpeg.so" opt/vrcx/libffmpeg.so
        ln -sf ../../usr/lib/libvulkan.so.1 opt/vrcx/libvulkan.so.1

        for lib in opt/vrcx/*.so* opt/vrcx/*.dll*; do
            case "$lib" in 'opt/vrcx/*.so*'|'opt/vrcx/*.dll*') continue; esac
            if ! [ -h "$lib" ]; then
                error 'Unknown library: %s' "${lib#opt/vrcx/}"
            fi
        done
    fi
    if [ "$_omit_dlls" = true ]; then
        stat "/usr/share/dotnet/shared/Microsoft.NETCore.App/$_dotnet_ver.$_runtime_ver" >/dev/null
        stat "/usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/Roslyn/bincore" >/dev/null
        (
            CDPATH='' cd opt/vrcx/resources/app.asar.unpacked/build/Electron
            for dll in *.dll; do
                if [ -e "/usr/share/dotnet/shared/Microsoft.NETCore.App/$_dotnet_ver.$_runtime_ver/$dll" ]; then
                    ln -sf "../../../../../../usr/share/dotnet/shared/Microsoft.NETCore.App/$_dotnet_ver.$_runtime_ver/$dll" "$dll"
                elif [ -e "/usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/$dll" ]; then
                    ln -sf "../../../../../../usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/$dll" "$dll"
                elif [ -e "/usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/Roslyn/bincore/$dll" ]; then
                    ln -sf "../../../../../../usr/share/dotnet/sdk/$_dotnet_ver.$_sdk_ver/Roslyn/bincore/$dll" "$dll"
                fi
            done
        )
    fi
    rm -rf opt/vrcx/usr/lib
    mv opt/vrcx/usr usr
    mkdir -p -m755 usr/share
    mkdir -p -m755 usr/share/locale
    (
        CDPATH='' cd opt/vrcx/locales
        for pak in *.pak; do
            _locale="${pak%.pak}"
            _locale="${_locale//-/_}"
            mkdir -p -- "../../../usr/share/locale/$_locale"
            mv -- "$pak" "../../../usr/share/locale/$_locale/vrcx.pak"
            ln -s -- "../../../usr/share/locale/$_locale/vrcx.pak" "$pak"
        done
    )
    if rm opt/vrcx/resources/VRCX.png 2>/dev/null; then
        ln -s ../../../usr/share/icons/hicolor/512x512/apps/vrcx.png \
            opt/vrcx/resources/VRCX.png
    fi
    if rm opt/vrcx/resources/app.asar.unpacked/build/Electron/VRCX.png 2>/dev/null; then
        ln -s ../../../../../../usr/share/icons/hicolor/512x512/apps/vrcx.png \
            opt/vrcx/resources/app.asar.unpacked/build/Electron/VRCX.png
    fi
    if [ -e opt/vrcx/resources/app.asar.unpacked/build/Electron/VRCX.ico ]; then
        mkdir -p -m755 usr/share/icons
        mkdir -p -m755 usr/share/icons/hicolor
        mkdir -p -m755 usr/share/icons/hicolor/256x256
        mkdir -p -m755 usr/share/icons/hicolor/256x256/apps
        mv opt/vrcx/resources/app.asar.unpacked/build/Electron/VRCX.ico \
            usr/share/icons/hicolor/256x256/apps/vrcx.ico
        ln -s ../../../../../../usr/share/icons/hicolor/256x256/apps/vrcx.ico \
            opt/vrcx/resources/app.asar.unpacked/build/Electron/VRCX.ico
    fi
    sed -i -e "s/^Version=.*/Version=$pkgver/" VRCX.desktop
}

package() {
    install -d -Dm755 "$pkgdir/opt"
    cp -r opt/vrcx "$pkgdir/opt"
    ln -s /dev/null "$pkgdir/opt/vrcx/.no-updater"
    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 vrcx -t "$pkgdir/usr/bin"
    install -d -Dm755 "$pkgdir/usr/share"
    cp -r usr/share/icons "$pkgdir/usr/share"
    cp -r usr/share/locale "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/applications"
    install -Dm644 VRCX.desktop -t "$pkgdir/usr/share/applications"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "LICENSE-v$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 opt/vrcx/LICENSE.electron.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 opt/vrcx/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname"
    rm -f -- "$pkgdir/opt/vrcx/LICENSE.electron.txt"
    rm -f -- "$pkgdir/opt/vrcx/LICENSES.chromium.html"

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
