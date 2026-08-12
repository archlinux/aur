# Maintainer: Retrovibed <engineering@retrovibe.space>
pkgname=retrovibed
pkgver=0.0.1786568721000
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
  'rust'
)

backup=('etc/retrovibed/config.env')

source=("${pkgname}::git+https://github.com/retrovibed/retrovibed.git")
sha1sums=('SKIP')

build() {
  install -d -m 755 "${srcdir}/.dist/usr/bin"
  install -d -m 755 "${srcdir}/.dist/usr/lib/retrovibed"

  cp -r "${srcdir}/${pkgname}/.dist/linux/"* "${srcdir}/.dist"

  # build neurals
  CARGO_TARGET_DIR="native" cargo build --manifest-path "${srcdir}/${pkgname}/neurals/Cargo.toml" --release
  cp native/release/libpredicttext.{a,so} "${srcdir}/.dist/usr/lib/retrovibed/"

  CGO_LDFLAGS="-L${srcdir}/.dist/usr/lib/retrovibed -Wl,-rpath,/usr/lib/retrovibed" \
  GOBIN="${srcdir}/.dist/usr/bin" go build -C "${srcdir}/${pkgname}/shallows" \
    -buildmode=pie -trimpath -tags "duckdb_use_lib,retrovibed,neural" -buildvcs=false \
    -o "${srcdir}/.dist/usr/bin" ./cmd/retrovibe/...
}

package() {
  cp -r "${srcdir}/.dist/"* "${pkgdir}"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
