pkgname=verde-bin
pkgver=0.1.126
pkgrel=1
pkgdesc='Desktop GUI for coding agents like Codex and OpenCode'
arch=('x86_64')
url='https://github.com/JonathanRiche/verde'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
  'vulkan-icd-loader'
  'glib2'
  'libglvnd'
  'libsoup3'
  'libwpe'
  'wpebackend-fdo'
  'wpewebkit'
)
optdepends=(
  'codex: local Codex CLI integration'
  'opencode: local OpenCode CLI integration'
  'zenity: native folder picker integration'
)
provides=('verde')
conflicts=('verde' 'verde-git')
options=('!strip')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/JonathanRiche/verde/releases/download/v${pkgver}/verde-v${pkgver}-linux-x86_64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/JonathanRiche/verde/v${pkgver}/LICENSE"
)
sha256sums=(
  'c16716e4357df35e5908721abb10f8fc8af221c93565f5ef474d4c80d4520b6b'
  '9952749c80ab34ca65ef1b4e8653dcf5760361aecc44dfd7dc398d991e7d9f3e'
)

package() {
  local release_root="${srcdir}/verde-v${pkgver}-linux-x86_64"
  local install_root="${pkgdir}/usr/lib/verde"

  install -d "${install_root}"
  install -d "${install_root}/share"
  cp -a "${release_root}/bin" "${install_root}/bin"
  cp -a "${release_root}/share/verde" "${install_root}/share/verde"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/verde" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
exec /usr/lib/verde/bin/verde "$@"
EOF

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/verde-launch" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
exec /usr/lib/verde/bin/verde-launch "$@"
EOF

  install -Dm644 "${release_root}/share/applications/verde.desktop" \
    "${pkgdir}/usr/share/applications/verde.desktop"
  install -Dm644 "${release_root}/share/pixmaps/verde.png" \
    "${pkgdir}/usr/share/pixmaps/verde.png"
  install -Dm644 "${release_root}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
