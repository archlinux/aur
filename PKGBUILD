# Maintainer: 9sx77ssl <233811469+9sx77ssl@users.noreply.github.com>
# Development (VCS) package: builds the latest main branch from source on the user's machine.
# Upstream: https://github.com/Egezenn/dota2-minify

pkgname=dota2-minify-git
pkgver=2rc8.r1.gf2f751d
pkgrel=1
pkgdesc="Dota 2 Mod Patcher & Toolkit (latest git source build)"
arch=('x86_64')
url="https://github.com/Egezenn/dota2-minify"
options=('!debug')
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'gobject-introspection'
    'freetype2'
    'fontconfig'
    'hicolor-icon-theme'
    'wine'
)
makedepends=(
    'git'
    'nodejs'
    'npm'
    'uv'
    'icoutils'
)
provides=('dota2-minify')
conflicts=('dota2-minify' 'dota2-minify-bin' 'dota2-minify-rc-bin')
source=("$pkgname::git+https://github.com/Egezenn/dota2-minify.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    local _ver
    _ver="$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^Minify-v//; s/\([^-]*-g\)/r\1/; s/-/./g')"

    if [ -n "$_ver" ]; then
        printf '%s' "$_ver"
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$pkgname"

    # Keep uv's cache and managed interpreters inside the build dir.
    export UV_CACHE_DIR="$srcdir/.uv-cache"
    export UV_PYTHON_INSTALL_DIR="$srcdir/.uv-python"
    export UV_NO_PROGRESS=1

    # `--extra linux` pulls pygobject/pycairo/pywebview[gtk] so the GUI backend
    # gets bundled by PyInstaller (plain `uv sync` would ship a GUI-less bundle).
    uv sync --extra linux

    npm --prefix Minify/ui/web ci

    uv run python scripts/build.py --clean

    # 256px application icon (PyInstaller ignores icons on Linux).
    icotool -x --width=256 --height=256 \
        -o "$srcdir/dota2-minify.png" \
        "Minify/bin/images/favicon.ico"
}

package() {
    cd "$pkgname"

    local _root="$pkgdir/usr/lib/$pkgname"
    install -dm755 "$_root"
    cp -a --no-preserve=ownership scripts/dist/Minify/. "$_root/"

    find "$_root" -type d -name '__pycache__' -prune -exec rm -rf {} +
    find "$_root" -type f \( -name '*.pyc' -o -name '*.pyo' \) -delete

    install -Dm644 "$srcdir/dota2-minify.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/dota2-minify.png"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/dota2-minify" <<'LAUNCH'
#!/bin/sh
set -eu

# The app chdir()s into its own directory and writes cache/config/logs/mods there,
# so the read-only system install is copied to a per-user runtime dir once per version.
system_root=/usr/lib/dota2-minify-git
runtime_root="${XDG_DATA_HOME:-$HOME/.local/share}/dota2-minify-git"
runtime_version="__RUNTIME_VERSION__"
version_file="$runtime_root/.package-version"

mkdir -p "$runtime_root"

if [ ! -x "$runtime_root/Minify" ] || [ ! -f "$version_file" ] || [ "$(cat "$version_file")" != "$runtime_version" ]; then
    tar -C "$system_root" -cf - . | tar -C "$runtime_root" -xf -
    printf '%s\n' "$runtime_version" > "$version_file"
fi

exec "$runtime_root/Minify" "$@"
LAUNCH
    sed -i "s|__RUNTIME_VERSION__|${pkgver}-${pkgrel}|" "$pkgdir/usr/bin/dota2-minify"
    chmod 755 "$pkgdir/usr/bin/dota2-minify"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/dota2-minify.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Dota 2 Minify
Comment=Dota 2 Mod Patcher & Toolkit
Exec=dota2-minify
Icon=dota2-minify
Terminal=false
Categories=Game;
Keywords=dota2;mod;patcher;
EOF

    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
