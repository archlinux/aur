# Maintainer: sbysb <sbysb@protonmail.com>
pkgname=ouijit-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Kanban terminal manager for CLI agent workflows with git worktree isolation'
arch=('x86_64')
url='https://github.com/ouijit/ouijit'
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libcups'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
  'git'
)
optdepends=(
  'nodejs: run the bundled CLI script directly with /usr/bin/node'
)
provides=('ouijit')
conflicts=('ouijit')
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/ouijit/ouijit/releases/download/v${pkgver}/ouijit-linux-x64.zip"
)
sha256sums=('2423f356f4ddc82c96a839cff15d468c3d008c1e95dfdfb9a32f0a5acd995375')

package() {
  # Install app to /opt
  install -dm755 "${pkgdir}/opt/ouijit"
  cp -r "${srcdir}/ouijit-linux-x64/." "${pkgdir}/opt/ouijit/"

  # Drop cross-platform koffi prebuilds we never load on x86_64 Linux.
  # Leaving these in trips namcap into pulling lib32-*, python, freebsd/openbsd libs.
  local koffi_build="${pkgdir}/opt/ouijit/resources/app/node_modules/koffi/build/koffi"
  rm -rf \
    "${koffi_build}/freebsd_arm64" \
    "${koffi_build}/freebsd_ia32" \
    "${koffi_build}/freebsd_x64" \
    "${koffi_build}/openbsd_ia32" \
    "${koffi_build}/openbsd_x64" \
    "${koffi_build}/linux_arm64" \
    "${koffi_build}/linux_armhf" \
    "${koffi_build}/linux_ia32" \
    "${koffi_build}/linux_loong64" \
    "${koffi_build}/linux_riscv64d" \
    "${koffi_build}/musl_arm64" \
    "${koffi_build}/musl_x64"

  # Dev-time generators and build tooling — not needed at runtime
  rm -rf \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/koffi/lib/native/base"/*_gen.py \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/koffi/vendor/node-addon-api/tools" \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/koffi/src/cnoke" \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/koffi/doc" \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/better-sqlite3/build/Release/obj.target" \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/better-sqlite3/build/Release/test_extension.node" \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/better-sqlite3/deps" \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/node-pty/deps" \
    "${pkgdir}/opt/ouijit/resources/app/node_modules/node-pty/third_party/conpty"

  # Normalize permissions
  find "${pkgdir}/opt/ouijit" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/ouijit" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/opt/ouijit/ouijit"
  chmod 4755 "${pkgdir}/opt/ouijit/chrome-sandbox"
  chmod 755 "${pkgdir}/opt/ouijit/chrome_crashpad_handler"

  # Symlink binary into PATH
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/ouijit/ouijit "${pkgdir}/usr/bin/ouijit"

  # Desktop entry
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ouijit.desktop" <<EOF
[Desktop Entry]
Name=Ouijit
Comment=Kanban terminal manager for CLI agent workflows
Exec=/opt/ouijit/ouijit %U
Icon=ouijit
Type=Application
Categories=Development;Utility;
EOF

  # Icon (single 256x256 png shipped inside resources/app)
  if [ -f "${pkgdir}/opt/ouijit/resources/app/icon.png" ]; then
    install -Dm644 "${pkgdir}/opt/ouijit/resources/app/icon.png" \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ouijit.png"
  fi
}
