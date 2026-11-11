# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-mcp
pkgver=1.13.0
pkgrel=1
pkgdesc="MCP server for Chrome DevTools"
arch=('any')
url="https://github.com/ChromeDevTools/chrome-devtools-mcp"
license=('Apache-2.0')
depends=('nodejs')
optdepends=(
  'ffmpeg: experimental screencast support'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha512sums=('61fe2a852d3eda8a3b73e80ec923031d0b7864bff22971b6331c738e4d20700ac836d710ded2e2415cc05ba8369ecc90cc01a191c2f0596040b65c77060f92a6')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${pkgname}/latest" | jq -r '.version'
}

package() {
  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"
  local cmd rel entries=0

  install -dm755 "${pkgdir}/usr/lib/node_modules"
  cp -a "${srcdir}/package" "${node_root}"

  # Entry points are read from upstream's own bin map: the build output moved
  # from build/src/bin to out/Default/gen/src/bin in 1.13.0, and a hardcoded
  # path turns the next such move into a package() crash rather than a rebuild.
  install -dm755 "${pkgdir}/usr/bin"
  while IFS=$'\t' read -r cmd rel; do
    entries=$((entries + 1))
    chmod 755 "${node_root}/${rel}"
    ln -s "../lib/node_modules/${pkgname}/${rel}" "${pkgdir}/usr/bin/${cmd}"
  done < <(python3 -c 'import json, sys
for name, path in json.load(open(sys.argv[1]))["bin"].items():
    print(name + "\t" + path.removeprefix("./"))' "${node_root}/package.json")
  (( entries )) || { error "package.json declares no bin entries"; return 1; }

  install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
