# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.26.1
pkgrel=1
pkgdesc="Open-source AI agent originally based on Gemini CLI by QwenLM"
arch=('x86_64' 'aarch64')
url="https://github.com/QwenLM/${_pkgname}"
license=('Apache-2.0')
depends=('nodejs>=22.0.0' 'ripgrep')
optdepends=('xdg-utils: open links and launch browser integration'
            'docker: run agent tools in a sandboxed container'
            'podman: run agent tools in a sandboxed container'
            'git: version control integrations')
provides=("$_pkgname" "${_name}")
conflicts=("$_pkgname" "${_name}")

source_x86_64=("${_pkgname}-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.gz"
               "system-defaults.json")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz"
                "system-defaults.json")

b2sums_x86_64=('153c8f5462693523faa2e07f13393f6d6c223ee5b58af411155ad9ea54c75bf3c9811e104c40b8d47cd43f234102fa7c6910ab8bd71e07f4056551f5b37148ba'
               '30c86151e58bd11bd1d39238646aae2dd8bc743ca2a03b64371a9dc36eae81c3acade6f39fe0235b0e7f8b059c7181d04ae5d134a3a316e0f9b3815b8f197bee')
b2sums_aarch64=('98815834b6c5ec12919418dfba302e8768c33161542f8c67f1159f22c1ed9f9055925e3deef9ea0038566af3d7f35bc97c5dac95086beadd95bb2eb785398dc1'
                '30c86151e58bd11bd1d39238646aae2dd8bc743ca2a03b64371a9dc36eae81c3acade6f39fe0235b0e7f8b059c7181d04ae5d134a3a316e0f9b3815b8f197bee')

package() {
  local appdir="${pkgdir}/usr/lib/${_pkgname}"
  install -d "${appdir}" "${pkgdir}/usr/bin"

  cp -a "${srcdir}/${_pkgname}/lib/." "${appdir}/"
  sed -e '/^ROOT=/d' \
      -e 's|"$ROOT/node/bin/node"|/usr/bin/node|g' \
      -e "s|\"\$ROOT/bin/qwen\"|\"/usr/bin/${_name}\"|g" \
      -e "s|\"\$ROOT/lib/|\"/usr/lib/${_pkgname}/|g" \
      "${srcdir}/${_pkgname}/bin/qwen" > "${pkgdir}/usr/bin/${_name}"
  chmod 755 "${pkgdir}/usr/bin/${_name}"
  if grep -q 'ROOT' "${pkgdir}/usr/bin/${_name}"; then
    echo "ERROR: Unhandled ROOT references in the startup script!" >&2
    return 1
  fi
  rm -rf "${appdir}/vendor/ripgrep"

  rm -f "${appdir}/LICENSE"
  rm -f "${appdir}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${_pkgname}/README.md"

  install -Dm644 -t "${pkgdir}/etc/qwen-code" "system-defaults.json"
}
