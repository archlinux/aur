# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for VM Qontrol: repackages the official GitHub release tarball (glibc, self-contained .NET).
# At release: set pkgver, put the tarball's sha256 in sha256sums, then push this and the generated .SRCINFO
# (makepkg --printsrcinfo > .SRCINFO) to ssh://aur@aur.archlinux.org/vm-qontrol-bin.git
pkgname=vm-qontrol-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Create, run and fine-tune QEMU/KVM virtual machines: guided setup, unattended installs, settings that explain themselves"
arch=('x86_64')
url="https://github.com/codingncaffeine/VM-Qontrol"
license=('GPL-3.0-or-later')
provides=('vm-qontrol')
conflicts=('vm-qontrol')
# Self-contained .NET publish (Avalonia draws through X11 or Wayland; icu = .NET globalization), plus what every
# machine needs: QEMU, its disk tool and UEFI firmware.
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'fontconfig' 'freetype2' 'libglvnd' 'libx11' 'libxext' 'libxi' 'libxrandr'
         'libxcursor' 'libxrender' 'libice' 'libsm' 'libxkbcommon' 'wayland'
         'qemu-desktop' 'edk2-ovmf')
optdepends=('swtpm: the TPM Windows 11 requires'
            'virt-viewer: a window for each machine screen (or spice-gtk spicy)'
            'spice-gtk: hand USB devices to machines without a password'
            'osinfo-db: recognize the operating system on an installer disc'
            'virtiofsd: fast shared folders'
            'passt: faster user-mode networking'
            'quickemu: the operating-system download catalog'
            'wimlib: Windows downloads from Microsoft'
            'libisoburn: Windows downloads from Microsoft (xorriso)'
            'ffmpeg: screen recording'
            'polkit: one-prompt host changes (host drives, PCI handover, huge pages, nested virtualization)')
options=('!strip')   # a self-contained .NET bundle: stripping breaks it
source=("$url/releases/download/v$pkgver/VMQontrol-$pkgver-linux-x64.tar.gz")
sha256sums=('4b17528218a736a9da3dd5bc9388e38e70022e1b82f9cbd632ec08a31f4a5a5a')
noextract=("VMQontrol-$pkgver-linux-x64.tar.gz")

prepare() {
    rm -rf "${srcdir:?}/publish"
    mkdir -p "$srcdir/publish"
    bsdtar -xf "$srcdir/VMQontrol-$pkgver-linux-x64.tar.gz" -C "$srcdir/publish"
}

package() {
    install -dm755 "$pkgdir/usr/lib/vm-qontrol" "$pkgdir/usr/bin"
    # Copy the WHOLE publish output, never a list of names: a narrowed copy installs cleanly and fails at launch.
    cp -a "$srcdir/publish/." "$pkgdir/usr/lib/vm-qontrol/"
    rm -rf "${pkgdir:?}/usr/lib/vm-qontrol/share" "${pkgdir:?}/usr/lib/vm-qontrol/README.txt" "${pkgdir:?}/usr/lib/vm-qontrol/LICENSE"
    local _f
    for _f in vmqontrol vmq VmQontrol.Core.dll libcoreclr.so libSkiaSharp.so libHarfBuzzSharp.so; do
        [[ -f "$pkgdir/usr/lib/vm-qontrol/$_f" ]] || { echo "==> ERROR: $_f is missing from the payload." >&2; return 1; }
    done
    for _f in vmqontrol vmq; do
        printf '#!/bin/sh\nexec /usr/lib/vm-qontrol/%s "$@"\n' "$_f" > "$pkgdir/usr/bin/$_f"
        chmod 755 "$pkgdir/usr/bin/$_f"
    done

    install -dm755 "$pkgdir/usr/share"
    cp -a "$srcdir/publish/share/icons" "$pkgdir/usr/share/"
    install -Dm644 "$srcdir/publish/share/io.github.codingncaffeine.VMQontrol.desktop" \
        "$pkgdir/usr/share/applications/io.github.codingncaffeine.VMQontrol.desktop"
    install -Dm644 "$srcdir/publish/share/io.github.codingncaffeine.VMQontrol.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/io.github.codingncaffeine.VMQontrol.metainfo.xml"
    install -Dm644 "$srcdir/publish/README.txt" "$pkgdir/usr/share/doc/vm-qontrol/README.txt"
    install -Dm644 "$srcdir/publish/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
