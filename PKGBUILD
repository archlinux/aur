# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Nexus Manager - repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to
#   ssh://aur@aur.archlinux.org/nexus-manager-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=nexus-manager-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Sensor display and music visualizer for the Corsair iCUE NEXUS panel"
arch=('x86_64')
url="https://github.com/codingncaffeine/Nexus-Manager"
license=('GPL-3.0-or-later')
provides=('nexus-manager')
conflicts=('nexus-manager')
# Taken from a sweep of the published binaries rather than from memory: objdump -p for
# NEEDED entries, plus a strings sweep for the libraries that are dlopened and so never
# appear in NEEDED. The .NET runtime itself is bundled, so none of it is listed here.
#   glibc/gcc-libs   libc libdl libm libpthread librt libgcc_s libstdc++
#   fontconfig       NEEDED by libSkiaSharp, which is what draws every frame
#   icu              InvariantGlobalization is deliberately false
#   libx11 ...       Avalonia's X11 backend; under Wayland this runs via XWayland
#   systemd-libs     libudev, which HidSharp uses to find the hidraw node
#   dbus             the tray icon speaks StatusNotifierItem, and the tray is how the
#                    panel is meant to be kept alive across a session
depends=('glibc' 'gcc-libs' 'bash' 'fontconfig' 'freetype2' 'icu'
         'libx11' 'libxext' 'libxi' 'libxrandr' 'libxcursor' 'libxfixes'
         'libice' 'libsm' 'libglvnd' 'systemd-libs' 'dbus')
# parec is what the music visualizers capture the default output's monitor through. It is
# optional because the sensor display - the point of the application - works with no audio
# server present at all.
optdepends=('libpulse: music visualizers (provides parec)'
            'gtk3: file dialogs where no desktop portal answers'
            'xdg-desktop-portal: file dialogs through the desktop'
            'vulkan-icd-loader: Vulkan rendering path in the editor')
options=('!strip')   # self-contained .NET bundle - stripping breaks it
install=nexus-manager-bin.install
source=("$url/releases/download/v$pkgver/nexus-manager-$pkgver-linux-x64.tar.gz")
sha256sums=('e7a2c6d1afa5efc371a807b9467422c47fdccf7ed7da409fde8d91451000a494')

package() {
    install -dm755 "$pkgdir/usr/lib/nexus-manager" "$pkgdir/usr/bin" \
                   "$pkgdir/usr/share/doc/nexus-manager"

    # ⛔ WHOLESALE, never an allow-list of names. A packaging step that selects files by
    # name ships silently incomplete the moment the payload gains a file class nobody
    # listed - on a sibling project exactly that dropped all 218 managed assemblies while
    # makepkg exited 0 and pacman installed without a word.
    cp -a "$srcdir/." "$pkgdir/usr/lib/nexus-manager/"

    # makepkg links the downloaded source into srcdir, so the copy above would otherwise
    # ship it as a dangling symlink in every install.
    rm -f "$pkgdir/usr/lib/nexus-manager/nexus-manager-$pkgver-linux-x64.tar.gz"

    # These travel in the tarball for someone unpacking it by hand; a package puts them
    # where a package puts them.
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/doc/nexus-manager/copyright"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/nexus-manager/README.md"
    rm -f "$pkgdir/usr/lib/nexus-manager/LICENSE" "$pkgdir/usr/lib/nexus-manager/README.md"

    install -Dm644 "$srcdir/packaging/70-icue-nexus.rules" \
        "$pkgdir/usr/lib/udev/rules.d/70-icue-nexus.rules"
    install -Dm644 "$srcdir/packaging/nexus-manager.desktop" \
        "$pkgdir/usr/share/applications/nexus-manager.desktop"
    install -Dm644 "$srcdir/packaging/nexus-manager-tray.desktop" \
        "$pkgdir/usr/share/applications/nexus-manager-tray.desktop"
    install -Dm644 "$srcdir/packaging/nexus-manager.service" \
        "$pkgdir/usr/lib/systemd/user/nexus-manager.service"

    # The icon tree, copied whole rather than by named size.
    find "$srcdir/packaging/icons" -type f -name '*.png' -print0 |
    while IFS= read -r -d '' f; do
        install -Dm644 "$f" "$pkgdir/usr/share/${f#"$srcdir/packaging/"}"
    done
    rm -rf "$pkgdir/usr/lib/nexus-manager/packaging"

    for exe in nexus-manager nexus-manager-editor; do
        printf '#!/bin/sh\nexec /usr/lib/nexus-manager/%s "$@"\n' "$exe" \
            > "$pkgdir/usr/bin/$exe"
        chmod 755 "$pkgdir/usr/bin/$exe"
    done
}
