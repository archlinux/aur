# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=ashuffle
pkgver=3.12.5
pkgrel=2
pkgdesc="Automatic library-wide shuffle for mpd."
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient")
makedepends=("meson" "abseil-cpp>=20211102.0" "gtest>=1.10")

source=(
  "https://github.com/joshkunz/ashuffle/archive/v${pkgver}/ashuffle-${pkgver}.tar.gz"
)
sha256sums=(
  "758aa8481b589e1ed1fc3d9b431c7bf2a81b9d4f2e17147fc30b2d1934d14126"
)


prepare() {
  cd "ashuffle-${pkgver}"

  sed -i 's@absl_wyhash@absl_low_level_hash@' meson.build
}

build() {
  cd "ashuffle-${pkgver}"

  arch-meson \
    -Dtests=enabled \
    -Dunsupported_use_system_absl=true \
    -Dunsupported_use_system_gtest=true \
    builddir

  ninja -C builddir
}

check() {
  cd "ashuffle-${pkgver}"

  ninja -C builddir test
}

package() {
  cd "ashuffle-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C builddir install

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
