# Maintainer: Retrovibed <engineering@retrovibe.space>
pkgname=retrovibed
pkgver=0.0.1783357241000
pkgrel=1
pkgdesc='Personal digital archiving and distribution platform with a built-in torrent client, media player, and at-cost cloud storage'
url='https://retrovibe.space'
arch=('x86_64')
license=('custom')
depends=(
  'duckdb'
  'ffmpeg'
)

makedepends=(
  'go'
)

backup=('etc/retrovibed/config.env')

source=("${pkgname}::git+https://github.com/retrovibed/retrovibed.git")
sha1sums=('SKIP')

build() {
  install -d -m 755 "${srcdir}/.dist/usr/bin"
  cp -r "${srcdir}/${pkgname}/.dist/linux/"* "${srcdir}/.dist"
  GOBIN="${srcdir}/.dist/usr/bin" go build -C "${srcdir}/${pkgname}/shallows" \
    -buildmode=pie -trimpath -tags "duckdb_use_lib" -buildvcs=false \
    -o "${srcdir}/.dist/usr/bin" ./cmd/retrovibe/...
}

package() {
  cp -r "${srcdir}/.dist/"* "${pkgdir}"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
