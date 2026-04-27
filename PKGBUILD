pkgbase="linux-tpm453-lts-bin"
pkgname=("linux-tpm453-lts-bin" "linux-tpm453-lts-bin-headers")
pkgver=6.18.24
pkgrel=1
pkgdesc="Prebuilt TPM453 lts kernel package"
arch=('x86_64')
license=('GPL-2.0-only')
options=('!strip' '!debug')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb: to set the correct wireless channels of your country'
            'linux-firmware: firmware images needed for some devices')
makedepends=('libarchive' 'zstd')
_release_base_url='https://github.com/docker-mobile/linux-tpm453/releases/download/linux-tpm453-lts-6.18.24-1'
_kernel_asset='linux-tpm453-lts-6.18.24-1-x86_64.pkg.tar.zst'
_headers_asset='linux-tpm453-lts-headers-6.18.24-1-x86_64.pkg.tar.zst'
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
  '749e720e2e5792cc3c2943371d0692522b7c00890f46e1f541ed4cde462139a1'
  '65215e11bef39a59200bb72e3fbb3a46384445b7bcd0e579fca6093571af3eb2'
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

package_linux-tpm453-lts-bin() {
  pkgdesc="Prebuilt TPM453 lts kernel and modules"
  provides=(
    "linux-tpm453-lts=${pkgver}-${pkgrel}"
    'VIRTUALBOX-GUEST-MODULES'
    'WIREGUARD-MODULE'
    'KSMBD-MODULE'
    'V4L2LOOPBACK-MODULE'
    'NTSYNC-MODULE'
    'VHBA-MODULE'
    'ADIOS-MODULE'
  )
  conflicts=("linux-tpm453-lts")

  _extract_pkg_payload "$srcdir/${_kernel_asset}" "$pkgdir"
}

package_linux-tpm453-lts-bin-headers() {
  pkgdesc="Prebuilt headers for the TPM453 lts kernel"
  depends=("linux-tpm453-lts-bin=${pkgver}-${pkgrel}")
  provides=("linux-tpm453-lts-headers=${pkgver}-${pkgrel}" 'LINUX-HEADERS')
  conflicts=("linux-tpm453-lts-headers")

  _extract_pkg_payload "$srcdir/${_headers_asset}" "$pkgdir"
}
