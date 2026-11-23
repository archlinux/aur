# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=ltex-ls-plus
pkgver=19.0.0
pkgrel=1
pkgdesc="Language server for LanguageTool with support for LaTeX, Markdown, and others"
arch=(any)
url="https://github.com/ltex-plus/ltex-ls-plus"
license=(MPL-2.0)
depends=('java-runtime>=21' bash)
makedepends=(maven)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('98810851421517400af34fa0cc562ae98ceb1adb9130f6b6873e12a053fab14d0cdf513685e31cbd8b46bbb0da0ac1f9f2c2b510a7a43732cfda481a4a6e2125')
b2sums=('a6f5c37bcdc7fd5691b61cb078c177d82307a9822d0fe41d077d918e06d1a25c221c930c434947e2c886446980227164d8c106c4ddd42d27b323f25a23f4281b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  # Without the Kotlin daemon, which would keep running for hours after the build. Before Kotlin
  # 2.4.20 it also breaks later builds once its classpath in $srcdir is gone: new daemons hand
  # their clients over to it while it shuts down (https://youtrack.jetbrains.com/issue/KT-75840)
  mvn package -Prelease -DskipTests -Dkotlin.compiler.daemon=false \
    -Dmaven.repo.local="$srcdir/m2"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  # Not offline (-o): Surefire resolves its JUnit Platform provider only when tests run, so
  # build() can't fetch it. The tests themselves only use localhost (a LanguageTool HTTP server
  # on port 8081, the TCP launcher test on 52714). LanguageToolPremiumIntegrationTest, which uses
  # the API of LanguageTool's service with an account, skips itself without LANGUAGETOOL_USERNAME
  # and LANGUAGETOOL_API_KEY, so they're unset in case the environment has them.
  env -u LANGUAGETOOL_USERNAME -u LANGUAGETOOL_API_KEY \
    mvn test -Prelease -Dkotlin.compiler.daemon=false -Dmaven.repo.local="$srcdir/m2"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit

  install -Dm644 "README.md" "ACKNOWLEDGMENTS.md" "changelog.xml" -t "${pkgdir}/usr/share/doc/${pkgname}"
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
    "--server-command-line": "/usr/bin/ltex-ls-plus"
  }
}
EOF
}
