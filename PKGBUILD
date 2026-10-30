# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codeg-server-bin
_pkgname=codeg-server
pkgver=0.41.3
pkgrel=1
pkgdesc='Standalone server of Codeg, a collaborative multi-agent AI coding workspace (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/xintaofei/codeg'
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'openssl'
  'xz'
)
provides=('codeg-server')
conflicts=('codeg-server')
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/xintaofei/codeg/v${pkgver}/LICENSE")
source_x86_64=("codeg-server-linux-x64.tar.gz::https://github.com/xintaofei/codeg/releases/download/v${pkgver}/codeg-server-linux-x64.tar.gz")
source_aarch64=("codeg-server-linux-arm64.tar.gz::https://github.com/xintaofei/codeg/releases/download/v${pkgver}/codeg-server-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('6f75b90946c0fb8b7ccc8ac7b831185b4da505ccf0393aefe43288bc806ad7e8')
sha256sums_aarch64=('3428c5909b2e6a01a426186f653fa3a22f5fd1e13f8b61fab482f4e91ce3674b')

package() {
  local tar_root

  case "${CARCH}" in
    x86_64) tar_root='codeg-server-linux-x64' ;;
    aarch64) tar_root='codeg-server-linux-arm64' ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${srcdir}/${tar_root}/." "${pkgdir}/usr/lib/${_pkgname}/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'SCRIPT'
#!/bin/sh
cd /usr/lib/codeg-server || exit 1
exec ./codeg-server "$@"
SCRIPT

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
