# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=gbe_fork-bin
pkgver=2026_08_23
pkgrel=1
pkgdesc="Goldberg Steam Emulator fork — drop-in Steam API replacement for LAN multiplayer without Steam"
arch=('x86_64')
url="https://github.com/Detanup01/gbe_fork"
license=('LGPL-3.0-only')
depends=('glibc' 'bash' 'gcc-libs')
optdepends=(
    'lib32-gcc-libs: 32-bit native Linux game support'
    'lib32-glibc: 32-bit native Linux game support'
    'libx11: experimental overlay (native Linux x64)'
    'lib32-libx11: experimental overlay (native Linux x86)'
    'wine: running Windows games with the emulator'
)
provides=('gbe_fork')
conflicts=('gbe_fork')
options=('!debug')
_tag="release-${pkgver}"
source=("${pkgname}-linux-${pkgver}.tar.bz2::${url}/releases/download/${_tag}/emu-linux-release.tar.bz2"
        "${pkgname}-win-${pkgver}.7z::${url}/releases/download/${_tag}/emu-win-release.7z")
sha256sums=('ae1a950c650464e3efa533ab8ba446d575962b8f1045d4f289f7a54393e55282'
            '812dd5f6edd3f175219cc9836e55c1ef4154854a00fb0a6ff197254b85579baf')
noextract=("${pkgname}-win-${pkgver}.7z")

latestver() {
    curl -fsSL "https://api.github.com/repos/Detanup01/gbe_fork/releases/latest" |
        jq -r '.tag_name // empty' | sed 's/^release-//; s/-/_/g'
}

prepare() {
    rm -rf linux windows
    mv release linux
    bsdtar -xf "${pkgname}-win-${pkgver}.7z"
    mv release windows
}

package() {
    local _libdir="$pkgdir/usr/lib/gbe_fork"

    # Linux: emulator shared libraries (regular + experimental, x64 + x86)
    for _variant in regular experimental; do
        for _arch in x64 x86; do
            install -Dm755 "linux/$_variant/$_arch/libsteam_api.so" "$_libdir/linux/$_variant/$_arch/libsteam_api.so"
            install -Dm755 "linux/$_variant/$_arch/steamclient.so" "$_libdir/linux/$_variant/$_arch/steamclient.so"
        done
    done

    # Windows: emulator DLLs (for Proton/Wine games)
    install -Dm644 windows/regular/x64/steam_api64.dll "$_libdir/windows/regular/x64/steam_api64.dll"
    install -Dm644 windows/regular/x86/steam_api.dll "$_libdir/windows/regular/x86/steam_api.dll"
    install -Dm644 windows/experimental/x64/steam_api64.dll "$_libdir/windows/experimental/x64/steam_api64.dll"
    install -Dm644 windows/experimental/x86/steam_api.dll "$_libdir/windows/experimental/x86/steam_api.dll"

    # Windows: steamclient experimental (loader, overlay, DLLs for DRM-protected games)
    local _sce="windows/steamclient_experimental"
    local _sce_dst="$_libdir/windows/steamclient_experimental"
    install -Dm644 "$_sce/steamclient64.dll" "$_sce_dst/steamclient64.dll"
    install -Dm644 "$_sce/steamclient.dll" "$_sce_dst/steamclient.dll"
    install -Dm644 "$_sce/steamclient_loader_x64.exe" "$_sce_dst/steamclient_loader_x64.exe"
    install -Dm644 "$_sce/steamclient_loader_x86.exe" "$_sce_dst/steamclient_loader_x86.exe"
    install -Dm644 "$_sce/GameOverlayRenderer64.dll" "$_sce_dst/GameOverlayRenderer64.dll"
    install -Dm644 "$_sce/GameOverlayRenderer.dll" "$_sce_dst/GameOverlayRenderer.dll"
    install -Dm644 "$_sce/ColdClientLoader.ini" "$_sce_dst/ColdClientLoader.ini"
    install -Dm644 "$_sce/extra_dlls/steamclient_extra_x64.dll" "$_sce_dst/extra_dlls/steamclient_extra_x64.dll"
    install -Dm644 "$_sce/extra_dlls/steamclient_extra_x86.dll" "$_sce_dst/extra_dlls/steamclient_extra_x86.dll"
    install -Dm644 "$_sce/README.experimental_steamclient.md" "$_sce_dst/README.experimental_steamclient.md"
    cp -r --no-preserve=ownership "$_sce/dll_injection.EXAMPLE" "$_sce_dst/dll_injection.EXAMPLE"
    find "$_sce_dst/dll_injection.EXAMPLE" -type f -exec chmod 644 {} +

    # Windows: old Steam.dll for legacy games
    install -Dm644 windows/steam_old_lib/Steam.dll "$_libdir/windows/steam_old_lib/Steam.dll"

    # CLI tools (x64 to /usr/bin, x86 kept in lib)
    install -Dm755 linux/tools/generate_interfaces/generate_interfaces_x64 "$pkgdir/usr/bin/gbe-generate-interfaces"
    install -Dm755 linux/tools/lobby_connect/lobby_connect_x64 "$pkgdir/usr/bin/gbe-lobby-connect"
    install -Dm755 linux/tools/generate_interfaces/generate_interfaces_x86 "$_libdir/tools/generate_interfaces_x86"
    install -Dm755 linux/tools/lobby_connect/lobby_connect_x86 "$_libdir/tools/lobby_connect_x86"

    # Steamclient loader (Linux, directory structure preserved for x32/x64 subdirs)
    install -Dm755 linux/tools/steamclient_loader/steamclient_loader.sh "$_libdir/tools/steamclient_loader/steamclient_loader.sh"
    for f in linux/tools/steamclient_loader/ldr_*.EXAMPLE.txt; do
        install -Dm644 "$f" "$_libdir/tools/steamclient_loader/$(basename "$f")"
    done
    install -Dm644 linux/tools/steamclient_loader/README.md "$_libdir/tools/steamclient_loader/README.md"
    install -Dm644 linux/tools/steamclient_loader/x32/README.md "$_libdir/tools/steamclient_loader/x32/README.md"
    install -Dm644 linux/tools/steamclient_loader/x64/README.md "$_libdir/tools/steamclient_loader/x64/README.md"

    # Gamepad test utility
    install -Dm755 linux/tests/gamepad/test_gamepad_linux_x64 "$_libdir/tools/test_gamepad_x64"
    install -Dm755 linux/tests/gamepad/test_gamepad_linux_x86 "$_libdir/tools/test_gamepad_x86"

    # Example steam_settings (shared between platforms)
    cp -r --no-preserve=ownership linux/steam_settings.EXAMPLE "$_libdir/steam_settings.EXAMPLE"
    find "$_libdir/steam_settings.EXAMPLE" -type f -exec chmod 644 {} +

    # Documentation
    local _docdir="$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 linux/README.release.md "$_docdir/README.release.md"
    install -Dm644 linux/CHANGELOG.md "$_docdir/CHANGELOG.md"
    install -Dm644 linux/CREDITS.md "$_docdir/CREDITS.md"
    install -Dm644 linux/experimental/README.experimental_linux.md "$_docdir/README.experimental_linux.md"
    install -Dm644 windows/experimental/README.experimental.md "$_docdir/README.experimental_windows.md"
    install -Dm644 windows/steamclient_experimental/README.experimental_steamclient.md "$_docdir/README.experimental_steamclient.md"
    install -Dm644 windows/steam_old_lib/README.steam_old_lib.md "$_docdir/README.steam_old_lib.md"
    install -Dm644 linux/tools/generate_interfaces/README.generate_interfaces.md "$_docdir/README.generate_interfaces.md"
    install -Dm644 linux/tools/lobby_connect/README.lobby_connect.md "$_docdir/README.lobby_connect.md"
}
