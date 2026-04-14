# Maintainer: bobrik <an9rax@gmail.com>

pkgname=dota2-minify-bin
pkgver=1.13.1
pkgrel=3
pkgdesc="Dota 2 Mod Patcher & Toolkit — prebuilt binary"
arch=('x86_64')
url="https://github.com/Egezenn/dota2-minify"
license=('GPL-3.0-or-later')
depends=(
    'freetype2'
    'fontconfig'
    'hicolor-icon-theme'
)
makedepends=('7zip' 'icoutils')
provides=('dota2-minify')
conflicts=('dota2-minify' 'dota2-minify-rc-bin')

# https://github.com/Egezenn/dota2-minify/releases
_tag="Minify-v${pkgver}"
source=("${pkgname}-${pkgver}.zip::https://github.com/Egezenn/dota2-minify/releases/download/${_tag}/Minify-v${pkgver}-linux.zip")
sha256sums=('de11fb082b5f8cfac06457b0f1b23d51fb2d01b501927e44b913ab6b333a29a1')

noextract=("${pkgname}-${pkgver}.zip")

prepare() {
    cd "${srcdir}"
    7za x "${pkgname}-${pkgver}.zip"
    icotool -x \
        --width=256 \
        --height=256 \
        -o "${srcdir}/bin/images/favicon.png" \
        "${srcdir}/bin/images/favicon.ico"
}

package() {
    # Zip layout matches the stable binary release:
    #   Minify          (ELF executable)
    #   _internal/      (PyInstaller bundled libraries)
    #   bin/            (images, data files)
    #   mods/           (included mods)
    #   LICENSE
    #   README.md

    install -dm755 "${pkgdir}/usr/share/dota2-minify"

    (
        cd "${srcdir}" || exit
        for _item in Minify _internal bin mods LICENSE README.md; do
            cp -a --no-preserve=ownership "${_item}" "${pkgdir}/usr/share/dota2-minify/"
        done
    )

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

    install -Dm644 "${pkgdir}/usr/share/dota2-minify/bin/images/favicon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dota2-minify.png"

    install -Dm644 "${pkgdir}/usr/share/dota2-minify/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
