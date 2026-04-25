pkgbase="linux-tpm453-stable-bin"
pkgname=("linux-tpm453-stable-bin" "linux-tpm453-stable-bin-headers")
pkgver=7.0.1.r20260421.g2a5a214aa4d
pkgrel=1
pkgdesc="Prebuilt TPM453 stable kernel package"
arch=('x86_64')
license=('GPL-2.0-only')
options=('!strip' '!debug')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('libarchive' 'zstd')
_release_base_url='https://github.com/docker-mobile/linux-tpm453/releases/download/linux-tpm453-stable-7.0.1.r20260421.g2a5a214aa4d-1'
_kernel_asset='linux-tpm453-stable-7.0.1.r20260421.g2a5a214aa4d-1-x86_64.pkg.tar.zst'
_headers_asset='linux-tpm453-stable-headers-7.0.1.r20260421.g2a5a214aa4d-1-x86_64.pkg.tar.zst'
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
  '93f62ef248b8afc0e2d1cadca5aaef69e714f5539c87a1108e7676c8d4ee804a'
  'bc183a4b6c3ff114d34317191bf31a9d1ebb9344ab9b38cc0ccfb21d7bd3468e'
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

package_linux-tpm453-stable-bin() {
  pkgdesc="Prebuilt TPM453 stable kernel and modules"
  provides=(
    "linux-tpm453-stable=${pkgver}-${pkgrel}"
    'VIRTUALBOX-GUEST-MODULES'
    'WIREGUARD-MODULE'
    'KSMBD-MODULE'
    'V4L2LOOPBACK-MODULE'
    'NTSYNC-MODULE'
    'VHBA-MODULE'
    'ADIOS-MODULE'
  )
  conflicts=("linux-tpm453-stable")

  _extract_pkg_payload "$srcdir/${_kernel_asset}" "$pkgdir"
}

package_linux-tpm453-stable-bin-headers() {
  pkgdesc="Prebuilt headers for the TPM453 stable kernel"
  depends=("linux-tpm453-stable-bin=${pkgver}-${pkgrel}")
  provides=("linux-tpm453-stable-headers=${pkgver}-${pkgrel}" 'LINUX-HEADERS')
  conflicts=("linux-tpm453-stable-headers")

  _extract_pkg_payload "$srcdir/${_headers_asset}" "$pkgdir"
}
