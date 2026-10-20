# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=duxlabs-dev
_repo=dux-search
_binname=dsearch

pkgname=${_binname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Fast filesystem search service"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
license=('MIT')
provides=("${_binname}")
conflicts=("${_binname}")

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "dsearch.service"  # local file next to PKGBUILD (same as -git)
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('4cee96286c5b7da9763a4694868bb1853b33bb1558821e0c609ad2eabd426bfa'
            '061aff88c1f93bea87d705221482a55c2a4ec093d410785e7e8c44c99a1409d8'
            '4203149be986e77617da42b0c7297e268b5daf89bf796ecbc41263e7746b031d')
sha256sums_x86_64=('c46f6ce6f58e39e3d1c125aa4466034c9fd4402756b3f5438317d19ec3f820a0')
sha256sums_aarch64=('ac9fdf6fc94048fc3fe190326f93df5b6a2b85a2482df13d4a34956268e94535')

# makepkg's mime sniffing does not reliably detect a gzipped ELF, so decompress it ourselves
noextract=("${_binname}-${arch[0]}-${pkgver}.gz" "${_binname}-${arch[1]}-${pkgver}.gz")

prepare() {
  cd "${srcdir}" || exit 1

  gzip -dcf "${_binname}-${CARCH}-${pkgver}.gz" > "${_binname}-${CARCH}-${pkgver}"
}

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  # systemd user unit (same path as your -git package)
  install -Dm644 "dsearch.service" "${pkgdir}/usr/lib/systemd/user/dsearch.service"

  # docs
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
