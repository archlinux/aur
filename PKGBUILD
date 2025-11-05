# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gopher64"
pkgname="${_pkgname}-bin"
pkgver=1.1.10
pkgrel=1
pkgdesc="N64 emulator written in Rust"
arch=('aarch64' 'x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'wayland'
)
makedepends=(
  'gendesk'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
        # "${_pkgsrc}.1024x1024.png::${url}/raw/refs/tags/v${pkgver}/data/icon/${_pkgname}.png")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-aarch64")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64")
sha256sums=('95e04ec4bc1331e8d12bfb353db17dd8e7c8d7d9f83c0580728453b8e9b8b4d1'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'c5b7d0fc27c4a838b174b6b2f3357d66b888b97cd9b5acd5460d1d102c7a8597'
            '886c63542d29a20804de8c3555a9abb2dac635b55b521ecffb067ec484780d67'
            '589dbc308e9910010fa0cbfdfa895dbc7dc895876ad3fda882008c59d7db3d22')
sha256sums_aarch64=('f3cfc6344f90fb00a530351e7cbb4567b0be33580c0da82ed282dc22297587e5')
sha256sums_x86_64=('f3c11202585d33d4a456891bbc7b94f6b65055637c239016fed272e851fa0d21')

for _size in 128 256 512; do
  source+=("${_pkgsrc}.${_size}x${_size}.png::${url}/raw/refs/tags/v${pkgver}/data/icon/${_pkgname}_${_size}x${_size}.png")
done

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --name "${_pkgname}" \
    --exec "${_pkgname}" \
    --icon "${_pkgname}" \
    --comment "${pkgdesc}" \
    --categories "Game;Emulator" \
    "${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  for _size in 128 256 512; do
    install -vDm644 "${_pkgsrc}.${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
  done
}
