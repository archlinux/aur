# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Xperience: repackages the official GitHub release bundle.
# Submit by pushing this and the generated .SRCINFO (makepkg --printsrcinfo > .SRCINFO) to
#   ssh://aur@aur.archlinux.org/xperience-bin.git
pkgname=xperience-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Settings and HID-BPF driver for the XPPen Artist 16 3rd pen display: keys, dials, pen, work area"
arch=('x86_64')
url="https://github.com/codingncaffeine/Xperience"
license=('GPL-3.0-or-later' 'GPL-2.0-only')
provides=('xperience')
conflicts=('xperience')
# Self-contained .NET publish. Avalonia draws through X11; icu = .NET globalization.
# udev-hid-bpf loads the driver, polkit asks for the rights to install it.
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'fontconfig' 'freetype2' 'libglvnd'
         'libx11' 'libxext' 'libxi' 'libxrandr' 'libxcursor' 'libxrender' 'libice' 'libsm'
         'udev-hid-bpf' 'polkit')
optdepends=("plasma-desktop: the pen settings Xperience reads and writes are KDE Plasma's"
            "libkscreen: brightness of the tablet's screen, and the list of monitors")
options=('!strip')   # a self-contained .NET bundle: stripping breaks it
source=("Xperience-$pkgver-linux-x64.tar.gz::$url/releases/download/v$pkgver/Xperience-$pkgver-linux-x64.tar.gz")
sha256sums=('544c7cf451ec36eb28a2123495285afe859b79cf80dd89e5f3cb8fdd81c5365f')
noextract=("Xperience-$pkgver-linux-x64.tar.gz")

prepare() {
    rm -rf "${srcdir:?}/publish"
    mkdir -p "$srcdir/publish"
    bsdtar -xf "$srcdir/Xperience-$pkgver-linux-x64.tar.gz" -C "$srcdir/publish"
}

package() {
    install -dm755 "$pkgdir/usr/lib/xperience" "$pkgdir/usr/bin"
    # Copy the WHOLE publish output, never a list of names: a narrowed copy installs cleanly and fails at launch.
    cp -a "$srcdir/publish/." "$pkgdir/usr/lib/xperience/"
    local _f
    for _f in README.txt LICENSE io.github.codingncaffeine.Xperience.desktop; do
        rm -f "${pkgdir:?}/usr/lib/xperience/$_f"
    done
    rm -rf "${pkgdir:?}/usr/lib/xperience/LICENSES"
    for _f in xperience xperience.dll Xperience.Core.dll libcoreclr.so libSkiaSharp.so libHarfBuzzSharp.so \
              0010-XPPen__Artist16_3rd.bpf.o xperience-driver-helper xperience.png; do
        [[ -f "$pkgdir/usr/lib/xperience/$_f" ]] || { echo "==> ERROR: $_f is missing from the payload." >&2; return 1; }
    done
    printf '#!/bin/sh\nexec /usr/lib/xperience/xperience "$@"\n' > "$pkgdir/usr/bin/xperience"
    chmod 755 "$pkgdir/usr/bin/xperience"

    install -Dm644 "$srcdir/publish/xperience.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/xperience.png"
    install -Dm644 "$srcdir/publish/io.github.codingncaffeine.Xperience.desktop" \
        "$pkgdir/usr/share/applications/io.github.codingncaffeine.Xperience.desktop"
    install -Dm644 "$srcdir/publish/README.txt" "$pkgdir/usr/share/doc/xperience/README.txt"
    install -Dm644 "$srcdir/publish/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/publish/LICENSES/GPL-2.0-only.txt" "$pkgdir/usr/share/licenses/$pkgname/GPL-2.0-only.txt"
}
