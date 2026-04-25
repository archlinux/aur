pkgbase="linux-tpm453-mainline-bin"
pkgname=("linux-tpm453-mainline-bin" "linux-tpm453-mainline-bin-headers")
pkgver=7.0.1.r20260423.ga3418d70e28
pkgrel=1
pkgdesc="Prebuilt TPM453 mainline kernel package"
arch=('x86_64')
license=('GPL-2.0-only')
options=('!strip' '!debug')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('libarchive' 'zstd')
_release_base_url='https://github.com/docker-mobile/linux-tpm453/releases/download/linux-tpm453-mainline-7.0.1.r20260423.ga3418d70e28-1'
_kernel_asset='linux-tpm453-mainline-7.0.1.r20260423.ga3418d70e28-1-x86_64.pkg.tar.zst'
_headers_asset='linux-tpm453-mainline-headers-7.0.1.r20260423.ga3418d70e28-1-x86_64.pkg.tar.zst'
url="${_release_base_url%/releases/download/*}"
source=(
  "${_kernel_asset}::${_release_base_url}/${_kernel_asset}"
  "${_headers_asset}::${_release_base_url}/${_headers_asset}"
)
noextract=(
  "${_kernel_asset}"
  "${_headers_asset}"
)
sha256sums=(
  '8ccb651b9d4b8c1b15ec57afa5d05cc08b0b2bc57ae491ba3329bda5c7cffc6e'
  '1f0dae26d79fd1d56973f869c4861b96529b330f0954a17c482dd7dce5f877ed'
)

_extract_pkg_payload() {
  local archive="$1"
  local dst="$2"

  install -dm755 "$dst"
  bsdtar -xf "$archive" -C "$dst" \
    --exclude .BUILDINFO \
    --exclude .MTREE \
    --exclude .PKGINFO \
    --exclude .INSTALL
}

package_linux-tpm453-mainline-bin() {
  pkgdesc="Prebuilt TPM453 mainline kernel and modules"
  provides=(
    "linux-tpm453-mainline=${pkgver}-${pkgrel}"
    'VIRTUALBOX-GUEST-MODULES'
    'WIREGUARD-MODULE'
    'KSMBD-MODULE'
    'V4L2LOOPBACK-MODULE'
    'NTSYNC-MODULE'
    'VHBA-MODULE'
    'ADIOS-MODULE'
  )
  conflicts=("linux-tpm453-mainline")

  _extract_pkg_payload "$srcdir/${_kernel_asset}" "$pkgdir"
}

package_linux-tpm453-mainline-bin-headers() {
  pkgdesc="Prebuilt headers for the TPM453 mainline kernel"
  depends=("linux-tpm453-mainline-bin=${pkgver}-${pkgrel}")
  provides=("linux-tpm453-mainline-headers=${pkgver}-${pkgrel}" 'LINUX-HEADERS')
  conflicts=("linux-tpm453-mainline-headers")

  _extract_pkg_payload "$srcdir/${_headers_asset}" "$pkgdir"
}
