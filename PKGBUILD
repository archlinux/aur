# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ltex-ls-plus
pkgver=18.7.0
pkgrel=1
pkgdesc="Language server for LanguageTool with support for LaTeX, Markdown, and others"
arch=('any')
url="https://github.com/ltex-plus/ltex-ls-plus"
license=('MPL-2.0')
depends=('java-runtime>=21' 'bash')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('45989e544f717448954fbf96c185a4f0cabc7e4555fd629c4dce7b0bcee94b3d4e7f8a2a0bda7f2164d53c2d9cce7a0d125cf35cff49a30b90be3e9514458ba1')
b2sums=('4125c5000f0d3913fa9a58686aeddc5223a1b62088ce8cbfa6db49b9d277c393a67f8d5a1437fd164551de62becbb023b534a2248fe132492df29c991669c4d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  mvn package -Prelease -Dmaven.test.skip=true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit

  install -Dm644 "README.md" "ACKNOWLEDGMENTS.md" "changelog.xml" -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "target/appassembler/lib"/*.jar -t "${pkgdir}/usr/share/java/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"

  local -r _basepath="/usr/share/java/${pkgname}"
  local -rA _launchermap=(
    ["ltex-ls-plus"]="org.bsplines.ltexls.LtexLanguageServerLauncher"
    ["ltex-cli-plus"]="org.bsplines.lspcli.LspCliLauncher"
  )
  local -rA _extraargs=(
    ["ltex-cli-plus"]="export LSP_CLI_JSON_SETTINGS_PATH=${_basepath}/lsp-cli-plus.json"
  )
  for _binaryname in "${!_launchermap[@]}"; do
    local _classpath="${_basepath}/*"
    cat >"${pkgdir}/usr/bin/${_binaryname}" <<EOF
#!/usr/bin/sh
${_extraargs[$_binaryname]}
exec /usr/bin/java \
-classpath "${_classpath}" \
-Dapp.name='${pkgname}' \
-Dapp.pid="\$\$" \
-Dapp.repo='${_basepath}' \
-Dapp.home='${_basepath}' \
-Dbasedir='${_basepath}' \
--enable-native-access=ALL-UNNAMED \
${_launchermap[$_binaryname]} "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${_binaryname}"
  done
  cat >"${pkgdir}${_basepath}/lsp-cli-plus.json" <<EOF
{
  "programName": "ltex-cli-plus",
  "helpMessage": {
    "description": "LTeX+ CLI - Command-line interface for LTeX+ LS",
    "visibleArguments": [
      "--client-configuration",
      "--verbose"
    ]
  },
  "defaultValues": {
    "--hide-commands": true,
    "--server-command-line": "${_basepath}/ltex-ls-plus"
  }
}
EOF
}
