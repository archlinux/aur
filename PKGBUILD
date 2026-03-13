# Maintainer: Josh W <info@soundspan.io>

pkgname=soundspan-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Native desktop client for soundspan"
arch=('x86_64' 'aarch64')
url="https://github.com/soundspan/soundspan-app"
license=('GPL-3.0-only')
depends=('alsa-lib' 'gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install="${pkgname}.install"

source_x86_64=(
  "${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/soundspan_${pkgver}_amd64.deb"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/soundspan_${pkgver}_arm64.deb"
)
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  local deb_path archive_root

  case "${CARCH}" in
    x86_64)
      deb_path="${srcdir}/${pkgname}-${pkgver}-x86_64.deb"
      ;;
    aarch64)
      deb_path="${srcdir}/${pkgname}-${pkgver}-aarch64.deb"
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  archive_root="${srcdir}/deb-extract"
  rm -rf "${archive_root}"
  mkdir -p "${archive_root}" "${pkgdir}"

  bsdtar -xf "${deb_path}" -C "${archive_root}"
  bsdtar -xf "${archive_root}"/data.tar.* -C "${pkgdir}"
}
