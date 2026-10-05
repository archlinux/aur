# Maintainer: nomisge <nomisge @ live . de>
pkgname=asciidoc-revealjs-toolkit
pkgver=1.0.1
pkgrel=1
pkgdesc='Asciidoc to Reveal.js toolkit'
arch=('x86_64')
url='https://codeberg.org/nomisge/asciidoc-revealjs-toolkit'
license=('GPL-3.0-or-later')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip")
sha256sums=('19a092532f31ff4de07808b091ebdeaf4bf23b7198cc5ada3e345c75f64c5222')

build() {
  cd "${srcdir}/${pkgname}"

  npm install --omit=dev --package-lock=false --cache "${srcdir}/npm-cache"
}

package() {
  cd "${srcdir}/${pkgname}"

  local appdir="${pkgdir}/usr/lib/${pkgname}"
  install -d "${appdir}"

  # Copy the project files and installed runtime dependencies.
  find . -mindepth 1 -maxdepth 1 \
    ! -name '.gitignore' \
    ! -name '.prettierignore' \
    ! -name '.prettierrc' \
    ! -name 'eslint.config.mjs' \
    ! -name 'shims.d.ts' \
    ! -name 'tsconfig.json' \
    -exec cp -a {} "${appdir}/" \;

  # Remove _where entries from package.json files.
  find "${pkgdir}" -name package.json -print0 |
    xargs -r -0 sed -i '/_where/d'

  # Remove underscored properties from the application's package.json.
  local tmppackage
  local pkgjson="${appdir}/package.json"
  tmppackage="$(mktemp)"
  jq '.|=with_entries(select(.key|test("_.+")|not))' \
    "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"

  # Remove man metadata from package.json files.
  find "${pkgdir}" -type f -name package.json | while read -r pkgjson; do
    local tmppackage
    tmppackage="$(mktemp)"
    jq 'del(.man)' "${pkgjson}" > "${tmppackage}"
    mv "${tmppackage}" "${pkgjson}"
    chmod 644 "${pkgjson}"
  done

  # Install a CLI launcher
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
exec node /usr/lib/asciidoc-revealjs-toolkit/adoc-revealjs.js "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

}

