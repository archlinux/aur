# Maintainer: Arif Sardar <arifsardar.private@gmail.com>
pkgname=legacy-launcher-bootstrap
pkgver=1.40.3
pkgrel=1
pkgdesc="Legacy Launcher for Minecraft (Unofficial Installer)"
arch=('any')
url="https://llaun.ch/"
# The jar itself ships no license text and upstream publishes its terms only on
# the website, so there is no SPDX-listed license to name here. LicenseRef- is
# the SPDX form for that case. Deliberately NOT 'MIT': the repo's LICENSE covers
# only the packaging, and declaring MIT would tell users the launcher is free
# software when its actual terms are unreviewed.
license=('LicenseRef-LegacyLauncher')
# hicolor-icon-theme owns the /usr/share/icons/hicolor hierarchy this package
# installs into; without it the icon directories would be unowned.
depends=('java-runtime>=17' 'hicolor-icon-theme')
# Icons sit at the repo root rather than in icons/ because makepkg reduces every
# local source to its basename (get_filename in makepkg's util/source.sh does
# ${netfile##*/}), so a path like icons/foo.svg is looked up as ./foo.svg and
# fails. The fix is a flat layout, NOT reaching outside srcdir into the build
# directory: `makepkg -S` packages only the PKGBUILD plus what is listed here,
# so icons pulled from outside srcdir are absent from the source tarball and
# every build from it dies in package() with "cannot stat legacy-launcher.svg".
source=(
    "LegacyLauncher.jar::https://llaun.ch/jar"
    "LICENSE"
    "legacy-launcher.svg"
    "legacy-launcher_256.png"
    "legacy-launcher_512.png"
    "minecraft.svg"
    "minecraft_256.png"
    "minecraft_512.png"
)
# The jar is a zip; without noextract makepkg explodes it into $srcdir.
noextract=('LegacyLauncher.jar')
# Never SKIP the remote source: the endpoint is behind Cloudflare, and an
# unpinned fetch would silently bake a challenge page into the package.
#
# Regenerate local sums by hand, not with updpkgsums: it re-fetches the jar and
# would overwrite the pinned sum above with whatever the endpoint served.
sha256sums=('09ba7517c8a9b30780ff9a6de230b8905247835ae0da914d66991e2b3b4b6c4e'
            '476a68d242896eb7a51ec8bb3d3fadfa93474f3b89b5a0ba40599e66b27955a8'
            'bfe4f259f20bc4626c7619e7d72ec1940e631ff0872258064a1d55e6413f73d2'
            '4d960d32736f6173fc8254b922ebf673e8a2dd2c6dfc963864a3d70b24db8a6b'
            'fd602599d1910358866bcc501118adfd13bcd89bd1a63e23953e68d153160370'
            'ece5c3bb77bfadd043591c01b3504fb9c04daa951d93322a321e15036095d6a3'
            '94aa904c39037d5cd0852a108fd9995ca422bba745903d9b1f490fb4e2ad4fc8'
            'd234769b937fa3725a51ccbf0b1a6c8405b571fe2b88f77f086daaa2bedef466')

prepare() {
    # Guards the case where a maintainer temporarily sets sha256sums to SKIP
    # while bumping versions: the download endpoint is behind Cloudflare and
    # can answer with an HTML challenge page instead of the jar.
    bsdtar -tf LegacyLauncher.jar >/dev/null 2>&1 \
        || { echo "ERROR: LegacyLauncher.jar is not a valid archive" >&2; return 1; }
}

package() {
    # Install launcher
    install -Dm644 LegacyLauncher.jar \
        "$pkgdir/opt/legacy-launcher/LegacyLauncher.jar"

    # Required for any non-SPDX-listed license: namcap flags the package
    # otherwise. This file documents both halves -- MIT over the packaging,
    # upstream's own terms over the jar, name and logo.
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Wrapper script
    install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/legacy-launcher" <<'EOF'
#!/bin/sh
set -eu
exec java -jar /opt/legacy-launcher/LegacyLauncher.jar "$@"
EOF

    # Desktop entry
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/legacy-launcher.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Legacy Launcher
GenericName=Minecraft Launcher
Comment=Launch and manage Minecraft
Exec=legacy-launcher %U
Icon=legacy-launcher
Terminal=false
Categories=Game;
Keywords=minecraft;
StartupNotify=true
StartupWMClass=org-springframework-boot-loader-PropertiesLauncher
EOF

    # The game runs in its own JVM and its window is created by GLFW, which sets
    # WM_CLASS to "Minecraft*" independently of anything the launcher does.
    # StartupWMClass holds a single value, so the game needs its own entry.
    # NoDisplay keeps it out of menus and launchers -- it exists only to give
    # shells an app_id -> icon mapping for the game window.
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/legacy-launcher-minecraft.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Minecraft
Comment=Minecraft game window
Exec=legacy-launcher
Icon=legacy-launcher-minecraft
Terminal=false
NoDisplay=true
Categories=Game;
StartupWMClass=Minecraft*
EOF

    # Icons
    install -Dm644 "$srcdir/legacy-launcher.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/legacy-launcher.svg"

    install -Dm644 "$srcdir/legacy-launcher_256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/legacy-launcher.png"

    install -Dm644 "$srcdir/legacy-launcher_512.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/legacy-launcher.png"

    # The jar re-execs itself as a second JVM whose main class is Spring Boot's
    # PropertiesLauncher, and AWT derives WM_CLASS from the bottom stack frame,
    # so the window reports org-springframework-boot-loader-PropertiesLauncher.
    # StartupWMClass above covers shells that match on it (GNOME); KDE, XFCE and
    # Cinnamon instead fall back to an icon-theme lookup keyed on WM_CLASS, which
    # these copies satisfy.
    install -Dm644 "$srcdir/legacy-launcher_256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/org-springframework-boot-loader-PropertiesLauncher.png"

    install -Dm644 "$srcdir/legacy-launcher_512.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/org-springframework-boot-loader-PropertiesLauncher.png"

    # Game icons. Namespaced under legacy-launcher- so they cannot collide with
    # a plain minecraft.png from another package in the shared hicolor theme.
    install -Dm644 "$srcdir/minecraft.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/legacy-launcher-minecraft.svg"

    install -Dm644 "$srcdir/minecraft_256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/legacy-launcher-minecraft.png"

    install -Dm644 "$srcdir/minecraft_512.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/legacy-launcher-minecraft.png"

    # Same fallback for the game window's WM_CLASS. The literal asterisk is part
    # of the class GLFW reports, so it is part of the filename too.
    install -Dm644 "$srcdir/minecraft_256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/Minecraft*.png"

    install -Dm644 "$srcdir/minecraft_512.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/Minecraft*.png"
}
