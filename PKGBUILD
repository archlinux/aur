pkgname=factorio-demo
pkgver=2.1.23
pkgrel=1
pkgdesc="A game in which you build and maintain factories"
arch=(
  aarch64
  x86_64
)
url="http://www.factorio.com/"
license=(LicenseRef-factorio)
depends=(glibc)
makedepends=(xz)
conflicts=('factorio' 'factorio-headless' 'factorio-experimental')
source=(
  factorio.desktop
  LICENSE
)
source_aarch64=(factorio-demo_linux-arm64_${pkgver}.tar.xz::http://www.factorio.com/get-download/${pkgver}/demo/linux-arm64)
source_x86_64=(factorio-demo_linux_${pkgver}.tar.xz::http://www.factorio.com/get-download/${pkgver}/demo/linux64)
sha256sums=('8b5d83c82c2b93b7765e6a51abca11dd53858a47a5bb5c5a36591b8dec9173a6'
            '02b42f985d69541660200cd286642b3e9c9af070f95b95588910c9bf93044aa7')
sha256sums_aarch64=('c98da594e45a97f6e3f6257e3d3b4dff76074a7e7963c2d9383f57bb39249c3a')
sha256sums_x86_64=('66e1e4bcc892b97b145fb57f20952329a884764848fc261aad6ffa89604e5f22')

package() {
  cd "${srcdir}"

  install -Dm644 factorio.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd factorio
  install -Dm755 bin/x64/factorio -t "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/share/factorio"
  cp -r data/* "${pkgdir}/usr/share/factorio"
}

check() {
  cd "${srcdir}/factorio"

  local binarch
  case "${CARCH}" in
    aarch64) binarch="arm64" ;;
    x86_64)  binarch="x64" ;;
    *)       binarch="${CARCH}" ;;
  esac

  ./bin/${binarch}/factorio --version
}
