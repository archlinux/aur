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
  '38b340d7993f6af9d4be752707de4ef7a12d7ce8da2d8c1e783e8135402cd9e8'
  'd5fdf0f4025b29db50663e7e61e4557b95fcdc48df277b3f3ac4afd55d0cfdf3'
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
