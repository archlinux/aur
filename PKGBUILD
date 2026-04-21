# Maintainer: Felix Stubner <felix.stubner@gmail.com>

pkgname=netscli-bin
_binname=netscli
pkgver=0.2.0
pkgrel=1
pkgdesc="Network scanner with CLI, TUI, desktop app, and MCP server"
arch=('x86_64' 'aarch64')
url="https://netscli.com"
license=('MIT')
provides=("${_binname}")
conflicts=("${_binname}")
source_x86_64=("${_binname}-${pkgver}-x86_64::https://github.com/fstubner/netscli/releases/download/v${pkgver}/netscli-linux-x86_64")
source_aarch64=("${_binname}-${pkgver}-aarch64::https://github.com/fstubner/netscli/releases/download/v${pkgver}/netscli-linux-aarch64")
sha256sums_x86_64=('94513c4aa989001ebeb4b32db063e92e09e5dbf5314bc41582859d4201b01f37')
sha256sums_aarch64=('a4016dd46f3f0de4a097f8ea035e432e8e4079838c45faa1145cf1ff8125b17c')

package() {
  local src
  if [[ $CARCH == "x86_64" ]]; then
    src="${_binname}-${pkgver}-x86_64"
  else
    src="${_binname}-${pkgver}-aarch64"
  fi

  install -Dm755 "${srcdir}/${src}" "${pkgdir}/usr/bin/${_binname}"

  # Shell completions — generate from the binary we just installed.
  "${pkgdir}/usr/bin/${_binname}" completions bash \
    > "${srcdir}/${_binname}.bash"
  install -Dm644 "${srcdir}/${_binname}.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${_binname}"

  "${pkgdir}/usr/bin/${_binname}" completions zsh \
    > "${srcdir}/_${_binname}"
  install -Dm644 "${srcdir}/_${_binname}" \
    "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"

  "${pkgdir}/usr/bin/${_binname}" completions fish \
    > "${srcdir}/${_binname}.fish"
  install -Dm644 "${srcdir}/${_binname}.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"

  # Man page.
  "${pkgdir}/usr/bin/${_binname}" man > "${srcdir}/${_binname}.1"
  install -Dm644 "${srcdir}/${_binname}.1" \
    "${pkgdir}/usr/share/man/man1/${_binname}.1"
}
