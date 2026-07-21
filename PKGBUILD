# Maintainer: Arif Sardar <arifsardar.private@gmail.com>
pkgname=legacy-launcher-bootstrap
pkgver=1.40.3
pkgrel=2
pkgdesc="Unofficial Legacy Launcher for Minecraft, fetching the official jar at build time"
arch=('any')
url="https://llaun.ch/"
# Not 'MIT': the bundled LICENSE covers only the packaging. The jar ships no
# license text and upstream publishes terms only on the website, so there is no
# SPDX-listed identifier that fits.
license=('LicenseRef-LegacyLauncher')
# hicolor-icon-theme owns the icon hierarchy this package installs into.
depends=('java-runtime>=17' 'hicolor-icon-theme')
# Icons must stay flat and listed here. makepkg reduces local sources to their
# basename, so an icons/foo.svg path resolves to ./foo.svg and fails -- and
# reaching outside srcdir instead would drop them from `makepkg -S` tarballs,
# breaking every build from the AUR snapshot.
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
# The jar is a zip; without this makepkg explodes it into $srcdir.
noextract=('LegacyLauncher.jar')
# Never SKIP the jar's sum, and regenerate local sums by hand rather than with
# updpkgsums: the endpoint sits behind Cloudflare, and either shortcut can bake
# a challenge page into the package.
sha256sums=('09ba7517c8a9b30780ff9a6de230b8905247835ae0da914d66991e2b3b4b6c4e'
            '476a68d242896eb7a51ec8bb3d3fadfa93474f3b89b5a0ba40599e66b27955a8'
            'bfe4f259f20bc4626c7619e7d72ec1940e631ff0872258064a1d55e6413f73d2'
            '4d960d32736f6173fc8254b922ebf673e8a2dd2c6dfc963864a3d70b24db8a6b'
            'fd602599d1910358866bcc501118adfd13bcd89bd1a63e23953e68d153160370'
            'ece5c3bb77bfadd043591c01b3504fb9c04daa951d93322a321e15036095d6a3'
            '94aa904c39037d5cd0852a108fd9995ca422bba745903d9b1f490fb4e2ad4fc8'
            'd234769b937fa3725a51ccbf0b1a6c8405b571fe2b88f77f086daaa2bedef466')

prepare() {
    # Catches a Cloudflare challenge page reaching this far, e.g. if a maintainer
    # temporarily sets sha256sums to SKIP while bumping versions.
    bsdtar -tf LegacyLauncher.jar >/dev/null 2>&1 \
        || { echo "ERROR: LegacyLauncher.jar is not a valid archive" >&2; return 1; }
}

package() {
    install -Dm644 LegacyLauncher.jar \
        "$pkgdir/opt/legacy-launcher/LegacyLauncher.jar"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 /dev/stdin \
        "$pkgdir/usr/bin/legacy-launcher" <<'EOF'
#!/bin/sh
set -eu
exec java -jar /opt/legacy-launcher/LegacyLauncher.jar "$@"
EOF

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
    # NoDisplay keeps it out of menus -- it exists only to give shells an
    # app_id -> icon mapping for the game window.
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
    # Cinnamon instead fall back to an icon-theme lookup keyed on WM_CLASS.
    install -Dm644 "$srcdir/legacy-launcher_256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/org-springframework-boot-loader-PropertiesLauncher.png"

    install -Dm644 "$srcdir/legacy-launcher_512.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/org-springframework-boot-loader-PropertiesLauncher.png"

    # Namespaced under legacy-launcher- so they cannot collide with a plain
    # minecraft.png from another package in the shared hicolor theme.
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
