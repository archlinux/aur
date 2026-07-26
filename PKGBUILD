# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>
# Contribuitor: Torge Matthies <openglfreak at googlemail dot com>

_omit_libs=true
_electron_ver=40
_dotnet_ver=9.0

pkgname='vrcx-nightly-bin'
pkgdesc='Friendship management tool for VRChat (extracted AppImage version)'
_pkgver='2026-07-26T12.53-40e7750'
pkgver=${_pkgver//-/.}
pkgrel='1'
arch=('x86_64')
url='https://vrcx.app/'
license=('MIT')
depends=('nss' 'alsa-lib' 'nspr' 'hicolor-icon-theme' "dotnet-runtime-$_dotnet_ver" 'gtk3' 'libnotify' 'libxss' 'libxtst')
makedepends=('squashfs-tools')
conflicts=('vrcx')
provides=('vrcx')
source=("https://github.com/Natsumi-sama/VRCX/releases/download/${_pkgver}/VRCX_${_pkgver}_x64.AppImage"
  "LICENSE-v$_pkgver::https://raw.githubusercontent.com/Natsumi-sama/VRCX/refs/tags/$_pkgver/LICENSE"
  'vrcx'
  'VRCX.desktop')
sha256sums=('eb2a267249ac5c0d3f1c4d647d51fdb2b38d00593c4ab0d0dc6c6bae61fcaaad'
  'e51564d05fd8f98bba289b476815150c78d3bf8f4acd248d78986e0061bb7427'
  'f7b1a299fe162337a9a3b066478b38a1cb524dae7a7e55669d3c6f02dc5f361b'
  '7582adf143859d66d1b75fd13f4d5be6041fb99bc949764f247ba8c3d790e76c')

if [ "$_omit_libs" = true ]; then
  depends+=('libglvnd' 'vulkan-icd-loader' "electron$_electron_ver")
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
  printf '%s\n' "$((e_shoff + e_shentsize * e_shnum))"
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
  printf '%s\n' "$((0x$offset + 0x$size))"
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
  shift
  shift
  offset="$(get_squashfs_offset "$file")" || return
  unsquashfs -o "$offset" -d "$dir" ${1+"$@"} /dev/stdin <"$file"
)

build() {
  mkdir opt
  extract_appimage "VRCX_${_pkgver}_x64.AppImage" opt/vrcx -no-xattrs
  rm opt/vrcx/AppRun
  rm opt/vrcx/.DirIcon
  rm opt/vrcx/vrcx.desktop
  rm opt/vrcx/resources/app-update.yml
  rm -r opt/vrcx/resources/app.asar.unpacked/build/Electron/dotnet-runtime
  rm -r opt/vrcx/resources/dotnet-runtime
  if [ "$_omit_libs" = true ]; then
    rm opt/vrcx/resources/app.asar.unpacked/build/Electron/Microsoft.Win32.SystemEvents.dll
    rm opt/vrcx/resources/app.asar.unpacked/build/Electron/System.Management.dll
    rm opt/vrcx/resources/app.asar.unpacked/build/Electron/System.Security.Cryptography.ProtectedData.dll
    rm opt/vrcx/resources/app.asar.unpacked/build/Electron/System.Windows.Extensions.dll

    (
      CDPATH='' cd opt/vrcx/resources/app.asar.unpacked/node_modules/node-api-dotnet
      case "$CARCH" in
      x86_64) netarch=x64 ;;
      i686 | pentium4) netarch=x32 ;;
      aarch64) netarch=arm64 ;;
      armv7h) netarch=arm32 ;;
      esac
      for path in linux-*; do
        case "$path" in
        linux-"$netarch") : ;;
        *) rm -r -- "$path" ;;
        esac
      done
      for path in net*; do
        case "$path" in
        net"$_dotnet_ver" | net"$_dotnet_ver".js) : ;;
        *) rm -r -- "$path" ;;
        esac
      done
      rm -r -- osx-*
      rm -r -- win-*
    )

    rm opt/vrcx/vk_swiftshader_icd.json
    rm opt/vrcx/libvk_swiftshader.so
    ln -sf "../../usr/lib/electron$_electron_ver/libEGL.so" opt/vrcx/libEGL.so
    ln -sf "../../usr/lib/electron$_electron_ver/libGLESv2.so" opt/vrcx/libGLESv2.so
    ln -sf "../../usr/lib/electron$_electron_ver/libffmpeg.so" opt/vrcx/libffmpeg.so
    ln -sf ../../usr/lib/libvulkan.so.1 opt/vrcx/libvulkan.so.1

    for lib in opt/vrcx/*.so* opt/vrcx/*.dll*; do
      case "$lib" in 'opt/vrcx/*.so*' | 'opt/vrcx/*.dll*') continue ;; esac
      if ! [ -h "$lib" ]; then
        error 'Unknown library: %s' "${lib#opt/vrcx/}"
      fi
    done
  fi
  rm -r opt/vrcx/usr/lib
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
  sed -i -e "s/^Version=.*/Version=$_pkgver/" VRCX.desktop
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
  install -Dm644 "LICENSE-v$_pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 opt/vrcx/LICENSE.electron.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 opt/vrcx/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname"
  rm -- "$pkgdir/opt/vrcx/LICENSE.electron.txt"
  rm -- "$pkgdir/opt/vrcx/LICENSES.chromium.html"

  find "$pkgdir/opt/vrcx" "$pkgdir/usr/share" -type l -print0 | while IFS='' read -r -d '' file; do
    target="$(readlink -- "$file")"
    case "$target" in
    /*) : ;;
    usr/*) ln -sf -- "../../$target" "$file" ;;
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
