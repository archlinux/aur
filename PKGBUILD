pkgbase="linux-tpm453-release-bin"
pkgname=("linux-tpm453-release-bin" "linux-tpm453-release-bin-headers")
pkgver=7.0.1
pkgrel=1
pkgdesc="Prebuilt TPM453 release kernel package"
arch=('x86_64')
license=('GPL-2.0-only')
options=('!strip' '!debug')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('libarchive' 'zstd')
_release_base_url='https://github.com/docker-mobile/linux-tpm453/releases/download/linux-tpm453-release-7.0.1-1'
_kernel_asset='linux-tpm453-release-7.0.1-1-x86_64.pkg.tar.zst'
_headers_asset='linux-tpm453-release-headers-7.0.1-1-x86_64.pkg.tar.zst'
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
  '86a3001b400f77c631e7a84ed6fabd016f6e7d1e772fb0d17ed807e54a459814'
  'a5fb53aa4f987592a676eb7de619fcb86522be9d21e3b4a46e07ec18d9ec5b9b'
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

package_linux-tpm453-release-bin() {
  pkgdesc="Prebuilt TPM453 release kernel and modules"
  provides=(
    "linux-tpm453-release=${pkgver}-${pkgrel}"
    'VIRTUALBOX-GUEST-MODULES'
    'WIREGUARD-MODULE'
    'KSMBD-MODULE'
    'V4L2LOOPBACK-MODULE'
    'NTSYNC-MODULE'
    'VHBA-MODULE'
    'ADIOS-MODULE'
  )
  conflicts=("linux-tpm453-release")

  _extract_pkg_payload "$srcdir/${_kernel_asset}" "$pkgdir"
}

package_linux-tpm453-release-bin-headers() {
  pkgdesc="Prebuilt headers for the TPM453 release kernel"
  depends=("linux-tpm453-release-bin=${pkgver}-${pkgrel}")
  provides=("linux-tpm453-release-headers=${pkgver}-${pkgrel}" 'LINUX-HEADERS')
  conflicts=("linux-tpm453-release-headers")

  _extract_pkg_payload "$srcdir/${_headers_asset}" "$pkgdir"
}
