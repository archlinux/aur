# Maintainer: <tera_1225 @ hotmail ðot com>

pkgname=vod2pod-rss
pkgver="1.2.4"
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
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.zip"
  "${pkgname}.service"
  "${pkgname}.env"
  "add_host_port_config.patch"
  "dependency_on_unit_never_type_fallback.patch"
  "fix_ffmpeg_errors.patch::${url}/commit/536819fcd0313608ce3913beea3fdb1e8e7220b4.patch"
)
sha512sums=('501ae9496d5902626a784b5fa58e4fd33094b7cd33b7f93c290a51557d1f9d85b5397fd7ebb058f29cd47c10223fc22b50af2d21982dbe23122774a498629731'
            '49ec0e7e55457ca7bfc856bb1f5b78935f996c0a57686c6e30e56487c2a4661c2d989612c46f2fda3f465242d078a98c4f507173f00cadaf0513293c5c9d34e1'
            'f5ba74ef50424d78fc11c38cdecb415a058680fdf928758d21fc35ffd8b3c4407d79151d43c7ff4efe389863d2bcc7100e9ae861dd651a2e06c055445d158898'
            '9d10dc242035b769e1ecbc1d22ec72f8476410a024ff0b5aa3943a49c3537ab028eb4000f7ad156ab1bf0d2309b53cdb871e0f0148865502e05e69db532907e1'
            '73519c662674a49b5c46bd72371e558c002adbb9698ff1656982e0e30c87f3fe6cca73652bf8794bff4e5e9ee3d5c9a40ccca9de89b7d243d02d0499eea993c7'
            'af639c80f267b0fbe680cc30c47b2b42752c51f465983d7a05f9f1e56f45555d0ec8126f64a898321205bc2c67cecd7b2a9bc16192681b3d6937b18a05c86e36')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "Patching for dependency_on_unit_never_type_fallback error"
  patch --strip=1 --input=../dependency_on_unit_never_type_fallback.patch
  echo "Patching to add possibility of configuring listen host and port"
  patch --strip=1 --input=../add_host_port_config.patch
  echo "Patching to fix ffmpeg errors"
  patch --strip=1 --input=../fix_ffmpeg_errors.patch
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
  install -Dm755 "target/release/app" "${pkgdir}/usr/bin/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" 
  mkdir -p "${pkgdir}/etc/default/"
  install -Dm600 "${srcdir}/${pkgname}.env" "${pkgdir}/etc/default/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}/templates"
  install -Dm644 "templates/index.html" "${pkgdir}/usr/share/webapps/${pkgname}/templates/"
}

