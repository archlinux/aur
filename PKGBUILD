# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for PS VulkanPlay: repackages the official GitHub release tarball.
# Publish by pushing this file and the generated .SRCINFO to
#   ssh://aur@aur.archlinux.org/ps-vulkanplay-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=ps-vulkanplay-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Remote Play client for PS5 and PS4 consoles, with its own Vulkan renderer"
arch=('x86_64')
url="https://github.com/codingncaffeine/PS-VulkanPlay"
license=('AGPL-3.0-only')
provides=('ps-vulkanplay')
conflicts=('ps-vulkanplay')
# The stream program has FFmpeg, Opus, OpenSSL and SDL3 linked in; what it needs from the system
# is the Vulkan loader and the PulseAudio client library (PipeWire serves it as well). The app is
# a self-contained .NET publish: the X libraries are what its window loads, openssl is what its
# HTTPS (the PSN sign-in) runs on.
depends=('glibc' 'gcc-libs' 'vulkan-icd-loader' 'libpulse' 'openssl' 'fontconfig' 'freetype2' 'libx11' 'libice'
         'libsm' 'libxrandr' 'libxi' 'libxcursor' 'libxext' 'libxrender')
optdepends=('webkit2gtk-4.1: the PSN sign-in page in a window of the app (otherwise it opens in the browser)'
            'vulkan-driver: a graphics driver with Vulkan 1.2'
            'libdecor: window borders on Wayland desktops that draw none'
            'xdg-utils: open the sign-in page in the browser')
options=('!strip')   # a self-contained .NET bundle; stripping breaks it
_id=io.github.codingncaffeine.PSVulkanPlay
_raw="$url/raw/v$pkgver/packaging"
# Every downloaded file carries the version in its name: makepkg keeps a file it already has
# under the same name, so a name without the version fails the checksum on an upgrade.
source=("$url/releases/download/v$pkgver/PS-VulkanPlay-$pkgver-linux-x64.tar.gz"
        "ps-vulkanplay-$pkgver.desktop::$_raw/$_id.desktop"
        "ps-vulkanplay-$pkgver.metainfo.xml::$_raw/$_id.metainfo.xml"
        "ps-vulkanplay-$pkgver-16.png::$_raw/icons/hicolor/16x16/apps/$_id.png"
        "ps-vulkanplay-$pkgver-24.png::$_raw/icons/hicolor/24x24/apps/$_id.png"
        "ps-vulkanplay-$pkgver-32.png::$_raw/icons/hicolor/32x32/apps/$_id.png"
        "ps-vulkanplay-$pkgver-48.png::$_raw/icons/hicolor/48x48/apps/$_id.png"
        "ps-vulkanplay-$pkgver-64.png::$_raw/icons/hicolor/64x64/apps/$_id.png"
        "ps-vulkanplay-$pkgver-128.png::$_raw/icons/hicolor/128x128/apps/$_id.png"
        "ps-vulkanplay-$pkgver-256.png::$_raw/icons/hicolor/256x256/apps/$_id.png")
sha256sums=('a53e0879e982075031f3dccd2f140a7e787483d3a0c7a1489fd605c7f03e246c'
            '7550fcf0217ed6035dcf75212918d3c812942a7df3b2d8afb2ad6918878c1c2e'
            '5b454a5e8fb56a492480cacd36ee8eda4e1b643ebeec0eb2cf4b02a471a2d836'
            'f20847f3df2dd0e13075a7b569ad2a754e438719756bbef5cf63cf96c0ac5f95'
            'eda0bd9a618eda2cbbb102f9a902c68e365f06ce5b2dd635a7fe30f8226b51b4'
            'f042d4a92955082e788fca572bc6ad429696d5eca11ef772ecbeb97acca5aab3'
            '57e0dd56bb07b0ea8e6661d029254623717fda0dd14c38c884e36d920f17974e'
            '96c08de540d23be0773bc5b51486090eaa3dc3a8ace0282f25552e8a223558cf'
            '7d93d88f8d55c5e29d85a53a3188111c09e2cf6952d0463d3b335cec349c97b8'
            'e00334521ad60f71fd9d98dcde5a51f434043da63acc2b34212af30b9069af79')

package() {
    local _payload="$srcdir/PS-VulkanPlay-$pkgver-linux-x64"
    install -dm755 "$pkgdir/usr/lib/ps-vulkanplay" "$pkgdir/usr/bin"

    # The stream program, and beside it (lib/ps-vulkanplay/app, where it looks) the app. The app is
    # copied whole, never by a list of names: an apphost, about 200 managed assemblies, the native
    # libraries and the runtimeconfig/deps JSON, and it does not start with any of them missing.
    install -Dm755 "$_payload/ps-vulkanplay" "$pkgdir/usr/bin/ps-vulkanplay"
    cp -a "$_payload/app" "$pkgdir/usr/lib/ps-vulkanplay/app"

    # Guard the copy above; nothing in the build or install path notices a missing assembly.
    local _dlls _f
    _dlls=$(find "$pkgdir/usr/lib/ps-vulkanplay/app" -maxdepth 1 -name '*.dll' | wc -l)
    if (( _dlls < 150 )); then
        echo "==> ERROR: only $_dlls managed assemblies packaged (expected about 200)." >&2
        return 1
    fi
    for _f in PSVulkanPlay PSVulkanPlay.dll PSVulkanPlay.runtimeconfig.json PSVulkanPlay.deps.json \
              libcoreclr.so libhostfxr.so libSkiaSharp.so libHarfBuzzSharp.so; do
        if [[ ! -f "$pkgdir/usr/lib/ps-vulkanplay/app/$_f" ]]; then
            echo "==> ERROR: $_f is missing from the package payload." >&2
            return 1
        fi
    done

    install -Dm644 "$srcdir/ps-vulkanplay-$pkgver.desktop" "$pkgdir/usr/share/applications/$_id.desktop"
    install -Dm644 "$srcdir/ps-vulkanplay-$pkgver.metainfo.xml" "$pkgdir/usr/share/metainfo/$_id.metainfo.xml"
    local _size
    for _size in 16 24 32 48 64 128 256; do
        install -Dm644 "$srcdir/ps-vulkanplay-$pkgver-$_size.png" \
            "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_id.png"
    done
    install -Dm644 "$_payload/README.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
    install -Dm644 "$_payload/NOTICE" "$pkgdir/usr/share/doc/$pkgname/NOTICE"
    install -Dm644 "$_payload/THIRD-PARTY-NOTICES.md" "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"
    install -Dm644 "$_payload/LIBRARIES.txt" "$pkgdir/usr/share/doc/$pkgname/LIBRARIES.txt"
    install -Dm644 "$_payload/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
