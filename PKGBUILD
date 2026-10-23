# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Viper Synapse: repackages the official GitHub release tarball.
# Submit by pushing this, viper-synapse.install and the generated .SRCINFO (makepkg --printsrcinfo > .SRCINFO) to
#   ssh://aur@aur.archlinux.org/viper-synapse-bin.git
pkgname=viper-synapse-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Razer device settings: key bindings, macros, lighting and sensitivity, in a Synapse-style window"
arch=('x86_64')
url="https://github.com/codingncaffeine/Viper-Synapse"
license=('GPL-3.0-or-later')
provides=('viper-synapse')
conflicts=('viper-synapse')
# Self-contained .NET publish. Avalonia draws through X11 or Wayland; icu = .NET globalization; udev for the rule.
depends=('fontconfig' 'freetype2' 'libglvnd' 'libx11' 'libxi' 'libxcursor' 'libxext' 'libxrandr' 'libxrender'
         'libice' 'libsm' 'wayland' 'libxkbcommon' 'icu' 'zlib' 'systemd')
options=('!strip')   # a self-contained .NET bundle: stripping breaks it
install=viper-synapse.install
source=("$url/releases/download/v$pkgver/ViperSynapse-$pkgver-linux-x64.tar.gz")
sha256sums=('a02e61dd2c0b0fcb10e88634ba8a25a5fe5f477163d11e004527024be733831e')
noextract=("ViperSynapse-$pkgver-linux-x64.tar.gz")

prepare() {
    rm -rf "${srcdir:?}/publish"
    mkdir -p "$srcdir/publish"
    bsdtar -xf "$srcdir/ViperSynapse-$pkgver-linux-x64.tar.gz" -C "$srcdir/publish"
}

package() {
    install -dm755 "$pkgdir/usr/lib/viper-synapse" "$pkgdir/usr/bin"
    # Copy the WHOLE publish output, never a list of names: a narrowed copy installs cleanly and fails at launch.
    cp -a "$srcdir/publish/." "$pkgdir/usr/lib/viper-synapse/"
    local _f
    for _f in README.txt LICENSE viper-synapse.png 70-viper-synapse.rules; do
        rm -f "${pkgdir:?}/usr/lib/viper-synapse/$_f"
    done

    for _f in viper-synapse viper-synapsed viper-cli viper-synapse.dll viper-synapsed.dll ViperSynapse.Core.dll ViperSynapse.Hardware.dll libcoreclr.so libSkiaSharp.so; do
        [[ -f "$pkgdir/usr/lib/viper-synapse/$_f" ]] || { echo "==> ERROR: $_f is missing from the payload." >&2; return 1; }
    done
    for _f in viper-synapse viper-synapsed viper-cli; do
        printf '#!/bin/sh\nexec /usr/lib/viper-synapse/%s "$@"\n' "$_f" > "$pkgdir/usr/bin/$_f"
        chmod 755 "$pkgdir/usr/bin/$_f"
    done

    install -Dm644 "$srcdir/publish/70-viper-synapse.rules" "$pkgdir/usr/lib/udev/rules.d/70-viper-synapse.rules"
    echo uinput | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/viper-synapse-uinput.conf"
    install -Dm644 "$srcdir/publish/viper-synapse.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/viper-synapse.png"
    install -Dm644 "$srcdir/publish/README.txt" "$pkgdir/usr/share/doc/viper-synapse/README.txt"
    install -Dm644 "$srcdir/publish/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/io.github.codingncaffeine.ViperSynapse.desktop" <<'DESK'
[Desktop Entry]
Name=Viper Synapse
GenericName=Razer Device Settings
Comment=Key bindings, macros, lighting and sensitivity for Razer keyboards, keypads and mice
Exec=viper-synapse
Icon=viper-synapse
Terminal=false
Type=Application
Categories=Settings;HardwareSettings;Utility;
Keywords=razer;synapse;macro;keypad;tartarus;naga;basilisk;mouse;keyboard;rgb;chroma;dpi;
StartupWMClass=viper-synapse
DESK
}
