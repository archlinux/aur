# Maintainer: agony <27015 at riseup dot net>

pkgname=pgconsole
pkgver=1.3.0
pkgrel=2
pkgdesc="Web-based PostgreSQL editor with access control and audit logging"
arch=('any')
url="https://github.com/pgplex/pgconsole"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("https://registry.npmjs.org/@pgplex/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('721cfb0afddbacd015d01115849f85aa208fd00ee75c7979ac502e43ee873909')

# Modules the server bundle leaves external, as in upstream scripts/build-server.mjs
_externals=('pg' 'postgres' 'express' '@libpg-query/parser' '@electric-sql/pglite' '@electric-sql/pglite-socket')

build() {
  local name deps=()
  for name in "${_externals[@]}"; do
    deps+=("${name}@$(jq -r --arg name "${name}" '.dependencies[$name]' package/package.json)")
  done
  mkdir -p runtime
  cd runtime
  printf '{"private": true}\n' > package.json
  npm install --cache "${srcdir}/npm-cache" --omit=dev --ignore-scripts --no-package-lock --no-audit --no-fund "${deps[@]}"
}

package() {
  local dest="${pkgdir}/usr/lib/${pkgname}"
  install -Dm755 package/dist/server.mjs -t "${dest}/dist"
  cp -r package/dist/client "${dest}/dist/"
  install -Dm644 package/package.json -t "${dest}"
  cp -r runtime/node_modules "${dest}/"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/dist/server.mjs" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 package/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
