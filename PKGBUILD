# Maintainer: bobrik <an9rax@gmail.com>

pkgname=dota2-minify-rc-bin
pkgver=1.14rc2
pkgrel=1
pkgdesc="Dota 2 Mod Patcher & Toolkit — prebuilt release candidate binary"
arch=('x86_64')
url="https://github.com/Egezenn/dota2-minify"
license=('GPL-3.0-or-later')
depends=(
  'freetype2'
  'fontconfig'
  'hicolor-icon-theme'
)
provides=('dota2-minify')
conflicts=('dota2-minify' 'dota2-minify-bin')
options=('!strip')

_tag="Minify-v${pkgver}"
source=("${pkgname}-${pkgver}.zip::https://github.com/Egezenn/dota2-minify/releases/download/${_tag}/Minify-v${pkgver}-linux.zip")
sha256sums=('9ef5eb721e5ef26ac2611c6b003c1f7b496644c36790de62972c2230f36727dc')

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
    for _item in *; do
      [[ "${_item}" = *.zip ]] && continue
      cp -a --no-preserve=ownership "${_item}" "${pkgdir}/usr/share/dota2-minify/"
    done
  )

  # Keep the packaged tree read-only and run from a per-user copy because
  # Minify writes config, logs, and downloaded helper binaries beside itself.
  install -dm755 "${pkgdir}/usr/share/dota2-minify/config"
  install -dm755 "${pkgdir}/usr/share/dota2-minify/logs"
  install -dm755 "${pkgdir}/usr/share/dota2-minify/bin/rescomproot"

  install -dm755 "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/dota2-minify" <<EOF
#!/bin/sh
set -eu

system_root=/usr/share/dota2-minify
runtime_root="\${XDG_DATA_HOME:-\$HOME/.local/share}/dota2-minify"
runtime_version="${pkgver}-${pkgrel}"
version_file="\$runtime_root/.package-version"

mkdir -p "\$runtime_root" "\$runtime_root/config" "\$runtime_root/logs"

if [ ! -x "\$runtime_root/Minify" ] || [ ! -f "\$version_file" ] || [ "\$(cat "\$version_file")" != "\$runtime_version" ]; then
  tar -C "\$system_root" \
    --exclude='./config' \
    --exclude='./logs' \
    -cf - . | tar -C "\$runtime_root" -xf -
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

  install -Dm644 "${pkgdir}/usr/share/dota2-minify/bin/images/logo.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dota2-minify.png"

  install -Dm644 "${pkgdir}/usr/share/dota2-minify/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('9ef5eb721e5ef26ac2611c6b003c1f7b496644c36790de62972c2230f36727dc')
