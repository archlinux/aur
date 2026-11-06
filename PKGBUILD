# Maintainer: bobrik <an9rax@gmail.com>

pkgname=dota2-minify-bin
pkgver=2
pkgrel=1
pkgdesc="Dota 2 Mod Patcher & Toolkit — prebuilt binary"
arch=('x86_64')
url="https://github.com/Egezenn/dota2-minify"
license=('GPL-3.0-or-later')
depends=(
    'freetype2'
    'fontconfig'
    'hicolor-icon-theme'
)
optdepends=(
    'chromium: open the web UI in a standalone app window (any Chromium-based browser works)'
)
makedepends=('7zip' 'icoutils')
provides=('dota2-minify')
conflicts=('dota2-minify' 'dota2-minify-rc-bin')

# https://github.com/Egezenn/dota2-minify/releases
_tag="Minify-v${pkgver}"
source=("${pkgname}-${pkgver}.zip::https://github.com/Egezenn/dota2-minify/releases/download/${_tag}/Minify-v${pkgver}-linux.zip")
sha256sums=('7968db46be30a5c1a5cad122fdf6d836bd28ccf3dfb10a201128b02d8716e529')

noextract=("${pkgname}-${pkgver}.zip")

prepare() {
    cd "${srcdir}"
    rm -rf minify
    7za x -ominify "${pkgname}-${pkgver}.zip"
    icotool -x \
        --width=256 \
        --height=256 \
        -o "${srcdir}/favicon.png" \
        "${srcdir}/minify/_internal/bin/images/favicon.ico"
}

package() {
    # Zip layout (v2+):
    #   Minify          (ELF executable)
    #   _internal/      (PyInstaller bundle; bin/, ui/, locales/ live here)
    #   mods/           (included mods)
    #   LICENSE
    #   README.md

    install -dm755 "${pkgdir}/usr/share/dota2-minify"
    cp -a --no-preserve=ownership "${srcdir}/minify/." "${pkgdir}/usr/share/dota2-minify/"

    install -dm755 "${pkgdir}/usr/bin"
    cat >"${pkgdir}/usr/bin/dota2-minify" <<EOF
#!/bin/sh
set -eu

system_root=/usr/share/dota2-minify
runtime_root="\${XDG_DATA_HOME:-\$HOME/.local/share}/dota2-minify"
runtime_version="${pkgver}-${pkgrel}"
version_file="\$runtime_root/.package-version"

mkdir -p "\$runtime_root"

if [ ! -x "\$runtime_root/Minify" ] || [ ! -f "\$version_file" ] || [ "\$(cat "\$version_file")" != "\$runtime_version" ]; then
  tar -C "\$system_root" -cf - . | tar -C "\$runtime_root" -xf -
  printf '%s\n' "\$runtime_version" > "\$version_file"
fi

exec "\$runtime_root/Minify" "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/dota2-minify"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat >"${pkgdir}/usr/share/applications/dota2-minify.desktop" <<'EOF'
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

    install -Dm644 "${srcdir}/favicon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dota2-minify.png"

    install -Dm644 "${pkgdir}/usr/share/dota2-minify/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
