# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

# Why ty-bin instead of extra/ty?
#   extra/ty bundles jemalloc compiled for 4 KiB pages and aborts at startup
#   on 16 KiB-page aarch64 systems (Asahi Linux, Ampere, AWS Graviton with
#   CONFIG_ARM64_16K_PAGES, some RPi configs):
#       <jemalloc>: Unsupported system page size
#   Astral's upstream binary builds set JEMALLOC_SYS_WITH_LG_PAGE=16, which
#   configures jemalloc for a 64 KiB maximum page size and works on 4 K, 16 K,
#   and 64 K page hosts. This PKGBUILD installs that upstream binary verbatim.

pkgname=ty-bin
_pkgname=ty
pkgver=0.0.100
pkgrel=1
pkgdesc='Extremely fast Python type checker and language server (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/astral-sh/ty'
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

_base="${url}/releases/download/${pkgver}"

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/astral-sh/ty/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base}/ty-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base}/ty-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${_base}/ty-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums=('860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c')
sha256sums_x86_64=('27267f4a8b89f235ab8e59e005d12475c231d662d7adf1b14f687e47b628b04f')
sha256sums_aarch64=('c3e5c5ff6422d90a5f08481c9ccb7c2063676fcf9dc7fec96061881308bb2f89')
sha256sums_armv7h=('4534386ca07fa68014fb32a0b5775febb375f7f23d10ba8bcba5e8f71ca8ee4e')

# Map Arch CARCH -> upstream target triple subdir inside the tarball.
_target_x86_64='x86_64-unknown-linux-gnu'
_target_aarch64='aarch64-unknown-linux-gnu'
_target_armv7h='armv7-unknown-linux-gnueabihf'

package() {
    local _target_var="_target_${CARCH}"
    local _target="${!_target_var}"
    local _bin="${srcdir}/ty-${_target}/ty"

    install -Dm755 "${_bin}" "${pkgdir}/usr/bin/ty"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    "${_bin}" generate-shell-completion bash | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/bash-completion/completions/ty"
    "${_bin}" generate-shell-completion zsh | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/zsh/site-functions/_ty"
    "${_bin}" generate-shell-completion fish | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/fish/vendor_completions.d/ty.fish"
}
