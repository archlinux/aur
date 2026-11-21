# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=bladebro-bin
pkgver=4.8.3
pkgrel=1
pkgdesc='Agentic browser driver for AI: five MCP tools over a real Chromium session'
arch=('x86_64' 'aarch64')
url='https://github.com/dondai44423/bladebro'
license=('Apache-2.0')
# the release binaries link nothing beyond glibc (libc, libm, libpthread, libdl)
depends=('glibc')
optdepends=(
  'chromium: Chromium-family browser for the agent lane'
  'xvfb: virtual display for hosts without one'
  'xfwm4: window manager, so a headful Xvfb session has frame extents'
)
provides=('bladebro')
conflicts=('bladebro')
# prebuilt upstream binaries: a debug split would only carry someone else's debug info, and
# stripping would rewrite the ELF container away from the bytes upstream publishes a checksum for
options=('!strip' '!debug')

source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('c288a3e1bdc914639e9b187f151e4094b532f76b57a0fe0c1287a8a5f9e2c6bc')
sha256sums_aarch64=('e904d5cda53b42ef2a0d890a683245f76cfcc8e9e40d51dfdd982a47d36e589c')

# spelled out per architecture rather than with $CARCH: .SRCINFO records what the build host
# expanded, so $CARCH would write the x86_64 filename into source_aarch64
source_x86_64=("bladebro-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/bladebro-linux-x86_64")
source_aarch64=("bladebro-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/bladebro-linux-aarch64")

latestver() {
  gh api repos/dondai44423/bladebro/releases/latest --jq .tag_name |
    sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p'
}

package() {
  install -Dm755 "${srcdir}/bladebro-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/bladebro"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  local _bin="${srcdir}/bladebro-${pkgver}-${CARCH}" _got
  # a bare release download arrives non-executable; package() installs the mode the binary needs
  chmod 755 "${_bin}"
  _got=$("${_bin}" --version | sed -nE '1s/^bladebro v([^ ]+).*/\1/p')
  [[ $_got == "$pkgver" ]] || { error "bladebro reports '${_got}', expected ${pkgver}"; return 1; }
}
