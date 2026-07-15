# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.19.10
pkgrel=2
pkgdesc="Open-source AI agent originally based on Gemini CLI by QwenLM"
arch=('x86_64' 'aarch64')
url="https://github.com/QwenLM/${_pkgname}"
license=('Apache-2.0')
depends=('nodejs>=22.0.0' 'ripgrep')
optdepends=('xdg-utils: open links and launch browser integration')
provides=("$_pkgname" "${_name}")
conflicts=("$_pkgname" "${_name}")

source_x86_64=("${_pkgname}-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.gz"
               "system-defaults.json")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz"
                "system-defaults.json")

b2sums_x86_64=('df7bbdbd6b28ca93f927539ed3957b2382967bd7edaf7ad4bf46ee0183ebce31ef270ca8be8143b3d770d4799baad42eaf15d931c79071bff64801febab05760'
               '30c86151e58bd11bd1d39238646aae2dd8bc743ca2a03b64371a9dc36eae81c3acade6f39fe0235b0e7f8b059c7181d04ae5d134a3a316e0f9b3815b8f197bee')
b2sums_aarch64=('6e471c21c5402c5ce59b51cfebee867ed96021c04d0074ab45db44c1a54a6399b44b33603abd45ecebf9cb42d43d35f7b32b77d834323c9e15c8e0192c581798'
                '30c86151e58bd11bd1d39238646aae2dd8bc743ca2a03b64371a9dc36eae81c3acade6f39fe0235b0e7f8b059c7181d04ae5d134a3a316e0f9b3815b8f197bee')

package() {
  local appdir="${pkgdir}/usr/lib/${_pkgname}"
  install -d "${appdir}" "${pkgdir}/usr/bin"

  cp -a "${srcdir}/${_pkgname}/lib/." "${appdir}/"
  sed -e '/^ROOT=/d' \
      -e 's|"$ROOT/node/bin/node"|/usr/bin/node|g' \
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
