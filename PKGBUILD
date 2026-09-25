# Maintainer: robertfoster
pkgname=ceasta-git
_pkgname="${pkgname%-git}"
pkgver=0.10.0.r0.gfebf93c
pkgrel=1
pkgdesc="Disassembler, decompiler and debugger with a built-in MCP server (experimental glfw GUI + CLI)"
arch=('x86_64')
url="https://github.com/ngwg/ceasta"
# ceasta itself; vendored lua, dear imgui (MIT) and capstone (BSD-3-Clause) are linked in
license=('GPL-3.0-only' 'MIT' 'BSD-3-Clause')
depends=('glfw' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libgl' 'libstdc++')
makedepends=('cmake' 'git')
optdepends=('ttf-dejavu: DejaVu Sans Mono for the listing (falls back to the imgui built-in font)')
provides=("${_pkgname}" "${_pkgname}-cli")
conflicts=("${_pkgname}" "${_pkgname}-cli" "${_pkgname}-bin")
source=("${_pkgname}::git+${url}.git"
  "${_pkgname}.desktop")
sha256sums=('SKIP'
            '4ea9ee523b63d0a9fb3ff2082ef008044dc7d5915a73a9c310231b7420b85ddc')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCEASTA_LINUX_GUI=ON \
    -Wno-dev
  cmake --build build
  # the gui is silently skipped when glfw / OpenGL are not found
  [[ -x build/ceasta ]]
}

package() {
  cd "${_pkgname}"

  install -Dm755 -t "${pkgdir}/usr/bin" ../build/ceasta-cli

  # the gui loads plugins from plugins/ next to its /proc/self/exe path
  # (plus ~/.config/ceasta/plugins), so it lives in its own lib dir
  install -Dm755 -t "${pkgdir}/usr/lib/${_pkgname}" ../build/ceasta
  ln -s "/usr/lib/${_pkgname}/ceasta" "${pkgdir}/usr/bin/ceasta"
  install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}/plugins" plugins/*
  ln -s "/usr/share/${_pkgname}/plugins" "${pkgdir}/usr/lib/${_pkgname}/plugins"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 docs/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" \
    README.md docs/{CHANGELOG,lua,mcp}.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE docs/THIRD_PARTY_NOTICES.md
}
