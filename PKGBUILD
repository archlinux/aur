# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for OpenPowerMac: repackages the official GitHub release tarball.
# Publish by pushing this file and the generated .SRCINFO to
#   ssh://aur@aur.archlinux.org/openpowermac-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=openpowermac-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="Power Macintosh G4 emulator written from scratch: runs Mac OS 9, with 2D and 3D acceleration"
arch=('x86_64')
url="https://github.com/codingncaffeine/OpenPowerMac"
license=('MIT')
provides=('openpowermac')
conflicts=('openpowermac')
# The publish is self-contained (.NET and the emulator core are inside). The tarball's own SDL3
# is dropped in favor of the system one, which also has a native PipeWire backend. The X
# libraries are what the Avalonia window and the input capture load; icu is .NET globalization.
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'sdl3' 'fontconfig' 'freetype2' 'libglvnd' 'libx11' 'libice'
         'libsm' 'libxi' 'libxcursor' 'libxext' 'libxrandr' 'libxrender' 'libxfixes')
optdepends=('xdg-utils: open the Drop Box folder in the file manager')
options=('!strip')   # a self-contained .NET bundle; stripping breaks it
_raw="$url/raw/v$pkgver/packaging"
# Every downloaded file carries the version in its name: makepkg keeps a file it already has
# under the same name, so a name without the version fails the checksum on an upgrade.
source=("$url/releases/download/v$pkgver/OpenPowerMac-$pkgver-linux-x64.tar.gz"
        "openpowermac-$pkgver.desktop::$_raw/io.github.codingncaffeine.OpenPowerMac.desktop"
        "openpowermac-$pkgver.metainfo.xml::$_raw/io.github.codingncaffeine.OpenPowerMac.metainfo.xml"
        "openpowermac-$pkgver-16.png::$_raw/icons/openpowermac-16.png"
        "openpowermac-$pkgver-24.png::$_raw/icons/openpowermac-24.png"
        "openpowermac-$pkgver-32.png::$_raw/icons/openpowermac-32.png"
        "openpowermac-$pkgver-48.png::$_raw/icons/openpowermac-48.png"
        "openpowermac-$pkgver-64.png::$_raw/icons/openpowermac-64.png"
        "openpowermac-$pkgver-128.png::$_raw/icons/openpowermac-128.png"
        "openpowermac-$pkgver-256.png::$_raw/icons/openpowermac-256.png")
sha256sums=('5638784b9e414df5f8ba39adc8c58e4b5624631f57ac103834071d0f83044e3e'
            '93eb5e2333dc8a8a2df3a547ef4b324e0386986b02cfe858a75bc943e409e602'
            'e801122b0200a6c3c74c425384f0890af02496081b86f4a2658b6a09470d234f'
            '19e281b0a45d8c0ee09fa868a7e02bd5b64b695a211c342b12f338e1a84b5b1a'
            '9dcb5c334cb967fe11d8378333d33cd2a861ac074988aa31cc052843c1e357cd'
            'e247c59ee83ddb189560e6a21b0eabda6e1bda932fe1e96b1cfd7e48a4cf7fb9'
            '0f372fb53b34287348e4c7e7780f25d8d474f346234b176eac7aa1081fc32659'
            '6ef63048146df6a3168b33cdd6094976b0c76d9a8300ce5ad65b278d04b3ba1d'
            '83df7f34efe9e706644f8bb7019af0bd485961a134fbb9df80c5fbf632fec7c6'
            '20d0f89c654efee2cc6e51ad7a191301086fdd880f6657f44bbeee5839900706')

package() {
    local _payload="$srcdir/OpenPowerMac-$pkgver-linux-x64"
    install -dm755 "$pkgdir/usr/lib/openpowermac" "$pkgdir/usr/bin"

    # Copy the entire publish output, never a list of names: the app is the apphost, about 200
    # managed assemblies, the native libraries and the runtimeconfig/deps JSON, and it does not
    # start with any of them missing.
    cp -a "$_payload/." "$pkgdir/usr/lib/openpowermac/"
    rm -f "$pkgdir/usr/lib/openpowermac/libSDL3.so.0"   # the system sdl3 is used instead (see depends)
    rm -f "$pkgdir/usr/lib/openpowermac/README.txt" "$pkgdir/usr/lib/openpowermac/LICENSE" \
          "$pkgdir/usr/lib/openpowermac/THIRD-PARTY-NOTICES.md"

    # Guard the copy above; nothing in the build or install path notices a missing assembly.
    local _dlls _f
    _dlls=$(find "$pkgdir/usr/lib/openpowermac" -maxdepth 1 -name '*.dll' | wc -l)
    if (( _dlls < 150 )); then
        echo "==> ERROR: only $_dlls managed assemblies packaged (expected about 200)." >&2
        return 1
    fi
    for _f in OpenPowerMac OpenPowerMac.dll OpenPowerMac.runtimeconfig.json OpenPowerMac.deps.json \
              libcoreclr.so libhostfxr.so libopmcapi.so; do
        if [[ ! -f "$pkgdir/usr/lib/openpowermac/$_f" ]]; then
            echo "==> ERROR: $_f is missing from the package payload." >&2
            return 1
        fi
    done

    printf '#!/bin/sh\nexec /usr/lib/openpowermac/OpenPowerMac "$@"\n' > "$pkgdir/usr/bin/openpowermac"
    chmod 755 "$pkgdir/usr/bin/openpowermac"

    install -Dm644 "$srcdir/openpowermac-$pkgver.desktop" \
        "$pkgdir/usr/share/applications/io.github.codingncaffeine.OpenPowerMac.desktop"
    install -Dm644 "$srcdir/openpowermac-$pkgver.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/io.github.codingncaffeine.OpenPowerMac.metainfo.xml"
    local _size
    for _size in 16 24 32 48 64 128 256; do
        install -Dm644 "$srcdir/openpowermac-$pkgver-$_size.png" \
            "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/openpowermac.png"
    done
    install -Dm644 "$_payload/README.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
    install -Dm644 "$_payload/THIRD-PARTY-NOTICES.md" "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"
    install -Dm644 "$_payload/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
