# Maintainer: robertfoster
pkgname=ceasta
pkgver=0.11.0 # renovate: datasource=github-tags depName=ngwg/ceasta
pkgrel=1
pkgdesc="Disassembler, decompiler and debugger with a built-in MCP server (experimental glfw GUI + CLI)"
arch=('x86_64')
url="https://github.com/ngwg/ceasta"
# ceasta itself; vendored lua, dear imgui (MIT) and capstone (BSD-3-Clause) are linked in
license=('GPL-3.0-only' 'MIT' 'BSD-3-Clause')
depends=('glfw' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libgl' 'libstdc++')
makedepends=('cmake')
optdepends=('ttf-dejavu: DejaVu Sans Mono for the listing (falls back to the imgui built-in font)')
provides=("${pkgname}-cli")
conflicts=("${pkgname}-cli" "${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.desktop")
sha256sums=('f847b1925c85cb275e7066802845163066aa971cbc1e9d810d63f2e18cbb8b74'
  '4ea9ee523b63d0a9fb3ff2082ef008044dc7d5915a73a9c310231b7420b85ddc'
)

build() {
  cmake -S "${pkgname}-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCEASTA_LINUX_GUI=ON \
    -Wno-dev
  cmake --build build
  # the gui is silently skipped when glfw / OpenGL are not found
  [[ -x build/ceasta ]]
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 -t "${pkgdir}/usr/bin" ../build/ceasta-cli

  # the gui loads plugins from plugins/ next to its /proc/self/exe path
  # (plus ~/.config/ceasta/plugins), so it lives in its own lib dir
  install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" ../build/ceasta
  ln -s "/usr/lib/${pkgname}/ceasta" "${pkgdir}/usr/bin/ceasta"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/plugins" plugins/*
  ln -s "/usr/share/${pkgname}/plugins" "${pkgdir}/usr/lib/${pkgname}/plugins"

  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 docs/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md docs/{CHANGELOG,lua,mcp}.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE docs/THIRD_PARTY_NOTICES.md
}
