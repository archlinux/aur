pkgbase="linux-tpm453-rc-bin"
pkgname=("linux-tpm453-rc-bin" "linux-tpm453-rc-bin-headers")
pkgver=7.0.rc7
pkgrel=2
pkgdesc="Prebuilt TPM453 rc kernel package"
arch=('x86_64')
license=('GPL-2.0-only')
options=('!strip' '!debug')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('libarchive' 'zstd')
_release_base_url='https://github.com/docker-mobile/linux-tpm453/releases/download/linux-tpm453-rc-7.0.rc7-2'
_kernel_asset='linux-tpm453-rc-7.0.rc7-2-x86_64.pkg.tar.zst'
_headers_asset='linux-tpm453-rc-headers-7.0.rc7-2-x86_64.pkg.tar.zst'
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
  '8fdec5202c255421a832b13d703ba5ff818ecbed0f1f62c37fc8f4099e0f3867'
  '74e01b6e966977fdbefd2a6d605ce03adf589acef298feff8f3c22e3499313f6'
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

package_linux-tpm453-rc-bin() {
  pkgdesc="Prebuilt TPM453 rc kernel and modules"
  provides=(
    "linux-tpm453-rc=${pkgver}-${pkgrel}"
    'VIRTUALBOX-GUEST-MODULES'
    'WIREGUARD-MODULE'
    'KSMBD-MODULE'
    'V4L2LOOPBACK-MODULE'
    'NTSYNC-MODULE'
    'VHBA-MODULE'
    'ADIOS-MODULE'
  )
  conflicts=("linux-tpm453-rc")

  _extract_pkg_payload "$srcdir/${_kernel_asset}" "$pkgdir"
}

package_linux-tpm453-rc-bin-headers() {
  pkgdesc="Prebuilt headers for the TPM453 rc kernel"
  depends=("linux-tpm453-rc-bin=${pkgver}-${pkgrel}")
  provides=("linux-tpm453-rc-headers=${pkgver}-${pkgrel}" 'LINUX-HEADERS')
  conflicts=("linux-tpm453-rc-headers")

  _extract_pkg_payload "$srcdir/${_headers_asset}" "$pkgdir"
}
