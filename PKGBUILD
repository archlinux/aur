pkgbase="linux-tpm453-edge-bin"
pkgname=("linux-tpm453-edge-bin" "linux-tpm453-edge-bin-headers")
pkgver=7.0.1.r20260423.g7e6c35d1ea6
pkgrel=1
pkgdesc="Prebuilt TPM453 edge kernel package"
arch=('x86_64')
license=('GPL-2.0-only')
options=('!strip' '!debug')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('libarchive' 'zstd')
_release_base_url='https://github.com/docker-mobile/linux-tpm453/releases/download/linux-tpm453-edge-7.0.1.r20260423.g7e6c35d1ea6-1'
_kernel_asset='linux-tpm453-edge-7.0.1.r20260423.g7e6c35d1ea6-1-x86_64.pkg.tar.zst'
_headers_asset='linux-tpm453-edge-headers-7.0.1.r20260423.g7e6c35d1ea6-1-x86_64.pkg.tar.zst'
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
  'fa51ee61135eb767caa4e5a80401ee11d0a384b2994718a39e1a4e14ef8590c2'
  '8014f78aa44bacf1751bb3a9c4a5937c5e37cdea56c7ed4dd2420469d113ad5b'
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

package_linux-tpm453-edge-bin() {
  pkgdesc="Prebuilt TPM453 edge kernel and modules"
  provides=(
    "linux-tpm453-edge=${pkgver}-${pkgrel}"
    'VIRTUALBOX-GUEST-MODULES'
    'WIREGUARD-MODULE'
    'KSMBD-MODULE'
    'V4L2LOOPBACK-MODULE'
    'NTSYNC-MODULE'
    'VHBA-MODULE'
    'ADIOS-MODULE'
  )
  conflicts=("linux-tpm453-edge")

  _extract_pkg_payload "$srcdir/${_kernel_asset}" "$pkgdir"
}

package_linux-tpm453-edge-bin-headers() {
  pkgdesc="Prebuilt headers for the TPM453 edge kernel"
  depends=("linux-tpm453-edge-bin=${pkgver}-${pkgrel}")
  provides=("linux-tpm453-edge-headers=${pkgver}-${pkgrel}" 'LINUX-HEADERS')
  conflicts=("linux-tpm453-edge-headers")

  _extract_pkg_payload "$srcdir/${_headers_asset}" "$pkgdir"
}
