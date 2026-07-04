# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=photogimp
pkgver=3.0
pkgrel=3
pkgdesc="GIMP config overlay that mimics Adobe Photoshop layout and shortcuts"
arch=('any')
url="https://github.com/Diolinux/PhotoGIMP"
license=('GPL-3.0-only')
depends=('gimp')
source=("${pkgname}-${pkgver}.zip::https://github.com/Diolinux/PhotoGIMP/releases/download/${pkgver}/PhotoGIMP-linux.zip"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Diolinux/PhotoGIMP/${pkgver}/LICENSE"
        "photogimp-shortcuts-fix.patch::https://github.com/Diolinux/PhotoGIMP/commit/df8d6d30216bd3940f59ed898ede020df93781ce.patch")
sha256sums=('1af6e2a6308bbc0fb716a7dbbd68036adbcc091da16432869c7c6c6aef18e54e'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '18747c44702f637dcbd26040b1ee9b8d0d864f07e6722038f24f8d88b1239674')

prepare() {
    cd "${srcdir}/PhotoGIMP-linux"

    # Carry the upstream shortcuts fix until it lands in a tagged release.
    patch -Np1 -i "${srcdir}/photogimp-shortcuts-fix.patch"

    # Upstream still disables GIMP 3's default brush-size shortcuts.
    sed -i \
        -e 's|^(action "tools-size-decrease-skip")$|(action "tools-size-decrease-skip" "bracketleft")|' \
        -e 's|^(action "tools-size-increase-skip")$|(action "tools-size-increase-skip" "bracketright")|' \
        .config/GIMP/3.0/shortcutsrc
    # Fail loudly if upstream churn ever stops the patterns matching.
    grep -q '^(action "tools-size-decrease-skip" "bracketleft")$' .config/GIMP/3.0/shortcutsrc
    grep -q '^(action "tools-size-increase-skip" "bracketright")$' .config/GIMP/3.0/shortcutsrc
}

package() {
    cd "${srcdir}/PhotoGIMP-linux"

    # Remove macOS artifacts, auto-generated files, and empty dirs
    find . -name '.DS_Store' -delete
    rm -f .config/GIMP/3.0/pluginrc
    find .config/GIMP/3.0/ -type d -empty -delete

    # Fix Flatpak paths in theme.css for native GIMP
    sed -i 's|/app/share/|/usr/share/|g;s|/app/etc/|/etc/|g' .config/GIMP/3.0/theme.css

    # Install GIMP config files to system staging directory
    install -dm755 "${pkgdir}/usr/share/${pkgname}/config"
    cp -r .config/GIMP/3.0/* "${pkgdir}/usr/share/${pkgname}/config/"

    # Install icons
    local _icons=".local/share/icons/hicolor"
    for size in 16x16 32x32 48x48 64x64 128x128 512x512; do
        install -Dm644 "${_icons}/${size}/apps/photogimp.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/photogimp.png"
    done
    # 256x256 icon is misplaced upstream (256x256/256x256.png instead of 256x256/apps/photogimp.png)
    install -Dm644 "${_icons}/256x256/256x256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/photogimp.png"

    # Install .desktop file with patched Exec (upstream hardcodes flatpak)
    install -Dm644 ".local/share/applications/org.gimp.GIMP.desktop" \
        "${pkgdir}/usr/share/applications/photogimp.desktop"
    sed -i -e 's|^Exec=.*|Exec=photogimp %U|' \
           -e '/^TryExec=/d' \
        "${pkgdir}/usr/share/applications/photogimp.desktop"
    echo 'TryExec=photogimp' >> "${pkgdir}/usr/share/applications/photogimp.desktop"

    # Install wrapper script (launches GIMP with isolated PhotoGIMP config)
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/photogimp" <<'WRAPPER'
#!/bin/sh
PGDIR="${XDG_CONFIG_HOME:-$HOME/.config}/PhotoGIMP"
if [ ! -d "$PGDIR" ]; then
    echo "PhotoGIMP: First launch — copying config to $PGDIR"
    mkdir -p "$PGDIR"
    cp -r /usr/share/photogimp/config/* "$PGDIR/"
fi
# One-time repair of configs this wrapper copied from earlier package
# revisions, whose shortcutsrc explicitly unbound GIMP's default [ / ]
# brush-size keys. The marker keeps any later deliberate unbinding by
# the user untouched.
if [ ! -f "$PGDIR/.photogimp-shortcuts-migrated" ]; then
    if grep -Eq '^\(action "tools-size-(de|in)crease-skip"\)$' "$PGDIR/shortcutsrc" 2>/dev/null; then
        echo "PhotoGIMP: one-time repair — restoring GIMP's default [ / ] brush-size shortcuts"
        sed -i \
            -e 's|^(action "tools-size-decrease-skip")$|(action "tools-size-decrease-skip" "bracketleft")|' \
            -e 's|^(action "tools-size-increase-skip")$|(action "tools-size-increase-skip" "bracketright")|' \
            "$PGDIR/shortcutsrc"
    fi
    touch "$PGDIR/.photogimp-shortcuts-migrated"
fi
export GIMP3_DIRECTORY="$PGDIR"
exec gimp "$@"
WRAPPER

    # Install license
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

latestver() {
    curl -s "https://api.github.com/repos/Diolinux/PhotoGIMP/releases/latest" \
        | grep -Po '"tag_name":\s*"\K[^"]+'
}
