# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=duxlabs-dev
_repo=dux-search
_binname=dsearch

pkgname=dux-search-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Fast filesystem search service (prebuilt binary)"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
license=('MIT')
provides=("${_binname}" "${_repo}")
conflicts=("${_binname}" "${_repo}" 'dsearch-bin' 'dsearch-git' 'dux-search-git')
replaces=('dsearch-bin')

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "dsearch.service"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('4cee96286c5b7da9763a4694868bb1853b33bb1558821e0c609ad2eabd426bfa'
            '21d606307da6754f5d0f8bc7d6ad6e2ef461f6d60dae14b26cdf0e019c76183b'
            '4203149be986e77617da42b0c7297e268b5daf89bf796ecbc41263e7746b031d')
sha256sums_x86_64=('fe4f510808a565660d0de73f4a66dffc3293178ee728ed0a0d37cc611d41c77f')
sha256sums_aarch64=('b5e65bc630b6f2afbb23a899a56704ef9a0308bf8b4412e20e52e86ffecafb39')

# makepkg's mime sniffing does not reliably detect a gzipped ELF, so decompress it ourselves
noextract=("${_binname}-${arch[0]}-${pkgver}.gz" "${_binname}-${arch[1]}-${pkgver}.gz")

prepare() {
  cd "${srcdir}" || exit 1

  gzip -dcf "${_binname}-${CARCH}-${pkgver}.gz" > "${_binname}-${CARCH}-${pkgver}"
}

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  install -Dm644 "dsearch.service" "${pkgdir}/usr/lib/systemd/user/dsearch.service"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
