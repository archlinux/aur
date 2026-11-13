# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for OpenMac for Linux: repackages the official GitHub release tarball.
# Publish by pushing this file and the generated .SRCINFO to
#   ssh://aur@aur.archlinux.org/openmac-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=openmac-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="Macintosh emulator written from scratch: Macintosh Classic, Macintosh IIfx, Quadra 650 and Quadra 950"
arch=('x86_64')
url="https://github.com/codingncaffeine/OpenMac-for-Linux"
license=('MIT')
provides=('openmac')
conflicts=('openmac')
# The publish is self-contained (.NET and the emulator core are inside). The tarball's own SDL3
# is dropped in favor of the system one, which also has a native PipeWire backend. The X
# libraries are what the Avalonia window and the input capture load; icu is .NET globalization.
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'sdl3' 'fontconfig' 'freetype2' 'libglvnd' 'libx11' 'libice'
         'libsm' 'libxi' 'libxcursor' 'libxext' 'libxrandr' 'libxrender' 'libxfixes')
optdepends=('xdg-utils: open the drop box folder in the file manager')
options=('!strip')   # a self-contained .NET bundle; stripping breaks it
_raw="$url/raw/v$pkgver/packaging"
# Every downloaded file carries the version in its name: makepkg keeps a file it already has
# under the same name, so a name without the version fails the checksum on an upgrade.
source=("$url/releases/download/v$pkgver/OpenMac-$pkgver-linux-x64.tar.gz"
        "openmac-$pkgver.desktop::$_raw/io.github.codingncaffeine.OpenMac.desktop"
        "openmac-$pkgver.metainfo.xml::$_raw/io.github.codingncaffeine.OpenMac.metainfo.xml"
        "openmac-$pkgver-16.png::$_raw/icons/openmac-16.png"
        "openmac-$pkgver-32.png::$_raw/icons/openmac-32.png"
        "openmac-$pkgver-48.png::$_raw/icons/openmac-48.png"
        "openmac-$pkgver-64.png::$_raw/icons/openmac-64.png"
        "openmac-$pkgver-128.png::$_raw/icons/openmac-128.png"
        "openmac-$pkgver-256.png::$_raw/icons/openmac-256.png"
        "openmac-$pkgver-512.png::$_raw/icons/openmac-512.png")
sha256sums=('5e2bbacbca95fb7278001869b99ecd8ba62721c88b999868c32fd5e431b0c2c9'
            '0cb22d82f2a893ae13be5aebc8520f508e6f58c0c53dada0d685c6bba264257e'
            'bd9be9a9839a244510b5ddbb0e8ee8f7d0a3aab16b86d576513de25832eaebdf'
            '86f5118ce3d69682d8696864564762204cc8a13cdc4db965dcbea643164d732d'
            '5911f2ab75dbae09fbe2ca94edac11bc45c656758bc13e84f441c82046d7d569'
            'b9654dbd8f947cc2e3a05edc1aeceb2bc092e38dc85343ed95cd0d33804f5860'
            '82b8f5dc12ca89d1b4cbba20e01386b740a648e36db99f408b768bc5d82df19d'
            'c7dd3b4ed2a828b4b9f2ae37375a300e4b3da64e733096b66fc779ffd03a8150'
            '30d67269d1575a87ddebd39bbca3786a68c6e2c196ef98253de2989ebdbddac8'
            '529c5bf86332b6ea5405988caec2509fa7fc8f7631d8e47857724c88ffc65859')

package() {
    local _payload="$srcdir/OpenMac-$pkgver-linux-x64"
    install -dm755 "$pkgdir/usr/lib/openmac" "$pkgdir/usr/bin"

    # Copy the entire publish output, never a list of names: the app is the apphost, about 200
    # managed assemblies, the native libraries and the runtimeconfig/deps JSON, and it does not
    # start with any of them missing.
    cp -a "$_payload/." "$pkgdir/usr/lib/openmac/"
    rm -f "$pkgdir/usr/lib/openmac/libSDL3.so.0"   # the system sdl3 is used instead (see depends)
    rm -f "$pkgdir/usr/lib/openmac/README.txt" "$pkgdir/usr/lib/openmac/LICENSE" \
          "$pkgdir/usr/lib/openmac/THIRD-PARTY-NOTICES.md"

    # Guard the copy above; nothing in the build or install path notices a missing assembly.
    local _dlls _f
    _dlls=$(find "$pkgdir/usr/lib/openmac" -maxdepth 1 -name '*.dll' | wc -l)
    if (( _dlls < 150 )); then
        echo "==> ERROR: only $_dlls managed assemblies packaged (expected about 200)." >&2
        return 1
    fi
    for _f in OpenMac OpenMac.dll OpenMac.runtimeconfig.json OpenMac.deps.json libcoreclr.so \
              libhostfxr.so libopenmac_c.so; do
        if [[ ! -f "$pkgdir/usr/lib/openmac/$_f" ]]; then
            echo "==> ERROR: $_f is missing from the package payload." >&2
            return 1
        fi
    done

    printf '#!/bin/sh\nexec /usr/lib/openmac/OpenMac "$@"\n' > "$pkgdir/usr/bin/openmac"
    chmod 755 "$pkgdir/usr/bin/openmac"

    install -Dm644 "$srcdir/openmac-$pkgver.desktop" \
        "$pkgdir/usr/share/applications/io.github.codingncaffeine.OpenMac.desktop"
    install -Dm644 "$srcdir/openmac-$pkgver.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/io.github.codingncaffeine.OpenMac.metainfo.xml"
    local _size
    for _size in 16 32 48 64 128 256 512; do
        install -Dm644 "$srcdir/openmac-$pkgver-$_size.png" \
            "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/openmac.png"
    done
    install -Dm644 "$_payload/README.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
    install -Dm644 "$_payload/THIRD-PARTY-NOTICES.md" "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"
    install -Dm644 "$_payload/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
