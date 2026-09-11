# Maintainer: Felix Stubner <felix.stubner@gmail.com>
#
# These values are a template, not what users install.
#
# publish.yml's `aur` job renders this file on every release: it downloads
# each asset, hashes the bytes, checks the result against the published
# .sha256 sidecar, rewrites pkgver and every sha256sums line, and pushes the
# result to aur.archlinux.org.
#
# The sha256sums lines below hold placeholder names, not digests. They used
# to hold real-looking 64-hex values left behind by whichever release last
# touched the file -- a 0.3.0 label over the v0.2.6 digests -- which read as
# the shipped manifest and, worse, would have survived a render step that
# silently failed to substitute. A placeholder cannot: makepkg rejects it,
# and the render step scans for a leftover marker before handing the file to
# AUR, which has no review step of its own.
#
# That scan is a plain grep over the whole file, so keep the literal marker
# out of these comments.
#
# If you ever need to build this by hand, take each digest from the `.sha256`
# asset on the release page.

pkgname=netscli-bin
_binname=netscli
pkgver=0.3.1
pkgrel=1
pkgdesc="Network diagnostics CLI, terminal UI, and MCP server"
arch=('x86_64' 'aarch64')
url="https://netscli.com"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_binname}")
conflicts=("${_binname}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/fstubner/netscli/v${pkgver}/LICENSE")
source_x86_64=("${_binname}-${pkgver}-x86_64::https://github.com/fstubner/netscli/releases/download/v${pkgver}/netscli-linux-x86_64")
source_aarch64=("${_binname}-${pkgver}-aarch64::https://github.com/fstubner/netscli/releases/download/v${pkgver}/netscli-linux-aarch64")
sha256sums=(6f035a96b0da6e99589b2a1656f59bee8c6519686d8a94627301e074746041d3)
sha256sums_x86_64=('fcfa09284ae5019d01f1b7f9ed4f0b846ffebb8bbdbb778ee1c305461af3b0f1')
sha256sums_aarch64=('ea319f8a8b0218591953ee131ab014fe81749b2859f7fe3e2c9c2ae82257a5ac')

package() {
  local src
  if [[ $CARCH == "x86_64" ]]; then
    src="${_binname}-${pkgver}-x86_64"
  else
    src="${_binname}-${pkgver}-aarch64"
  fi

  install -Dm755 "${srcdir}/${src}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

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
