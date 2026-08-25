# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
pkgname=yubix
pkgver=0.0.6
pkgrel=1
pkgdesc="Use your YubiKey for login and sudo — safely, with no terminal"
arch=('x86_64')
url="https://github.com/codingncaffeine/yubix"
license=('GPL-3.0-or-later')
# The X11 libraries are dlopen()ed by Avalonia at runtime, so they carry no
# ELF dependency for namcap to find — they have to be listed by hand or the
# app dies on a minimal install. fontconfig/freetype2 are linked by libSkiaSharp.
depends=('dotnet-runtime' 'pam-u2f' 'libfido2' 'polkit' 'dbus'
         'fontconfig' 'freetype2' 'hicolor-icon-theme'
         'libx11' 'libxcursor' 'libxext' 'libxi' 'libxrandr' 'libglvnd')
makedepends=('dotnet-sdk')
options=('!strip')
install=yubix.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bb09388b882e9d92a0a373e089475b6ec21e9311dcaa90a6c3a8b64b6db8b7f5')

build() {
    cd "$pkgname-$pkgver"
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1
    # Keep the SDK's scratch state inside the build dir so a clean chroot build
    # behaves the same as a developer's, and nothing lands in the builder's home.
    export DOTNET_CLI_HOME="$srcdir"
    export NUGET_PACKAGES="$srcdir/nuget"

    # Publish for this architecture only. A portable publish pulls in the native
    # Skia/HarfBuzz builds for every RID .NET knows -- win, osx, musl, arm,
    # riscv, loongarch -- which is ~128 MB of foreign-architecture binaries in
    # an x86_64 package (21 MB with this). Framework-dependent either way, so it
    # still runs against the packaged dotnet-runtime.
    # DebugType=none: without it the DLLs carry the absolute path of the build
    # tree (makepkg flags it as a $srcdir reference, and it would ship the
    # builder's home directory to every user). Nothing in Yubix surfaces a
    # stack trace -- errors are reported by message -- so no diagnostics are lost.
    local publish=(-c Release -r linux-x64 --self-contained false --nologo
                   -p:DebugType=none)
    dotnet publish src/Yubix.App/Yubix.App.csproj "${publish[@]}" -o build/app
    dotnet publish src/Yubix.Helper/Yubix.Helper.csproj "${publish[@]}" -o build/helper
}

package() {
    cd "$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/lib/yubix"
    cp -a build/app "$pkgdir/usr/lib/yubix/app"
    cp -a build/helper "$pkgdir/usr/lib/yubix/helper"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/lib/yubix/app/yubix "$pkgdir/usr/bin/yubix"
    install -Dm755 data/yubix-restore "$pkgdir/usr/bin/yubix-restore"
    install -Dm755 data/yubix-pamcheck "$pkgdir/usr/lib/yubix/yubix-pamcheck"
    install -Dm644 data/zz-yubix-pam-check.hook \
        "$pkgdir/usr/share/libalpm/hooks/zz-yubix-pam-check.hook"

    install -Dm644 data/io.github.codingncaffeine.yubix.policy \
        "$pkgdir/usr/share/polkit-1/actions/io.github.codingncaffeine.yubix.policy"
    install -Dm644 data/io.github.codingncaffeine.yubix.conf \
        "$pkgdir/usr/share/dbus-1/system.d/io.github.codingncaffeine.yubix.conf"
    install -Dm644 data/io.github.codingncaffeine.yubix.service \
        "$pkgdir/usr/share/dbus-1/system-services/io.github.codingncaffeine.yubix.service"
    install -Dm644 data/yubix-helper.service \
        "$pkgdir/usr/lib/systemd/system/yubix-helper.service"
    install -Dm644 data/yubix-failsafe.service \
        "$pkgdir/usr/lib/systemd/system/yubix-failsafe.service"
    install -Dm644 data/yubix.desktop \
        "$pkgdir/usr/share/applications/yubix.desktop"

    for size in 512 256 128 64 48 32; do
        install -Dm644 "assets/icons/yubix-${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/yubix.png"
    done
}
