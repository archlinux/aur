# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>

pkgname=ac-launcher-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Launcher for Asheron's Call emulator servers that runs the game through Proton, without Steam"
arch=('x86_64')
url="https://github.com/codingncaffeine/AC-Launcher"
license=('GPL-3.0-only')
provides=('ac-launcher')
conflicts=('ac-launcher')
# Every library the payload links or loads at run time, plus the programs the launcher runs:
# tar unpacks Proton, python runs umu-launcher's self-contained release, xdg-open opens links.
depends=('glibc' 'libgcc' 'libstdc++' 'icu' 'openssl' 'ca-certificates' 'fontconfig'
         'libx11' 'libxext' 'libxrandr' 'libxi' 'libxcursor' 'libxfixes' 'libice' 'libsm'
         'ttf-font' 'hicolor-icon-theme' 'tar' 'python' 'xdg-utils')
optdepends=('libsecret: keep account passwords in the desktop keyring instead of the accounts file'
            'umu-launcher: use the system umu-launcher instead of the copy the launcher downloads'
            'gtk3: folder picker when no desktop portal is available'
            'libglvnd: GPU-accelerated drawing')
options=('!strip' '!debug')   # self-contained .NET payload
source=("$url/releases/download/v$pkgver/ac-launcher-$pkgver-linux-x64.tar.gz")
noextract=("ac-launcher-$pkgver-linux-x64.tar.gz")
sha256sums=('d0a165c95a64a486fa25ee7c8e20e13df3c05ffba21dff3bce27383caa03d9c2')

prepare() {
    rm -rf "$srcdir/payload"
    mkdir -p "$srcdir/payload"
    bsdtar -xf "$srcdir/ac-launcher-$pkgver-linux-x64.tar.gz" -C "$srcdir/payload"
}

package() {
    local src="$srcdir/payload/ac-launcher-$pkgver"
    local lib="$pkgdir/usr/lib/ac-launcher"

    # Copy the whole payload. Never narrow this to a list of names: a self-contained .NET app is
    # the apphost, ~200 managed assemblies, native libraries and JSON manifests, and a list
    # silently drops whatever it does not name.
    install -dm755 "$lib"
    cp -a "$src/." "$lib/"
    rm -rf "$lib/share" "$lib/LICENSE" "$lib/THIRD-PARTY-NOTICES.md"

    # Refuse to package a payload that cannot start.
    local f dlls
    for f in ACLauncher ACLauncher.dll ACLauncher.runtimeconfig.json ACLauncher.deps.json libcoreclr.so libhostfxr.so; do
        [[ -f $lib/$f ]] || { echo "==> ERROR: $f is missing from the payload." >&2; return 1; }
    done
    dlls=$(find "$lib" -maxdepth 1 -name '*.dll' | wc -l)
    (( dlls >= 150 )) || { echo "==> ERROR: only $dlls managed assemblies in the payload." >&2; return 1; }

    cp -a "$src/share" "$pkgdir/usr/"
    install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$src/THIRD-PARTY-NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/ac-launcher" <<'EOF'
#!/bin/sh
exec /usr/lib/ac-launcher/ACLauncher "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/ac-launcher"
}
