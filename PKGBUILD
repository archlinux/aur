# Maintainer: <tera_1225 @ hotmail ðot com>

pkgname=vod2pod-rss
pkgver=1.2.5
pkgrel=1
pkgdesc='Converts a YouTube or Twitch channel into a podcast (no docker)'
url="https://github.com/madiele/vod2pod-rss/"
depends=(
  'ffmpeg'
  'glibc'
  'libgcc'
  'redis'
  'yt-dlp'
)
makedepends=(
  'openssl'
  'pkgconf'
  'cargo'
)
options=(!debug !lto)
arch=('x86_64')
license=('MIT')
backup=("etc/default/${pkgname}")
source=(
  "${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
  "${pkgname}.service"
  "${pkgname}.env"
)
sha512sums=('2605a938f1f835059c656b5dcded33dbf0eeea9f499652e8c9fbe5daa06679a9edfd815e4f22cf06ac1e25bd091844a101eb52753fa138555de8007cf08da7c5'
            '49ec0e7e55457ca7bfc856bb1f5b78935f996c0a57686c6e30e56487c2a4661c2d989612c46f2fda3f465242d078a98c4f507173f00cadaf0513293c5c9d34e1'
            '4548c418a31455eac659da3635bb36b7e2107ce4416743d8a102ed061a5e78890e1af3015382ff575e9c119b2abac1f07d94accbdacf556dea66187e3610f9a9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "Fetching rust sources"
  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 -v "target/release/app" "${pkgdir}/usr/bin/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 -v "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" 
  mkdir -p "${pkgdir}/etc/default/"
  install -Dm600 -v "${srcdir}/${pkgname}.env" "${pkgdir}/etc/default/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}/templates"
  install -Dm644 -v "templates/index.html" "${pkgdir}/usr/share/webapps/${pkgname}/templates/"
  mkdir -p "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -v LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

