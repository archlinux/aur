# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=chrome-devtools-mcp
pkgver=1.14.0
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
sha512sums=('b0eec6626aa7be68d0d25f638aebf0d83c8fc62de70404c56f1bcd53c02b6a960e51713bf73e9f6e280ab836c9f3f8ec8bfe0e0373af1e51aaf379872f07a618')

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
