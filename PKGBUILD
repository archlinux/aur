# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=ashuffle
pkgver=3.13.0
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd."
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient")
makedepends=("meson" "abseil-cpp>=20211102.0" "gtest>=1.10")

source=(
  "https://github.com/joshkunz/ashuffle/archive/v${pkgver}/ashuffle-${pkgver}.tar.gz"
  "0001_add_option_to_use_system_yaml_cpp.patch"
)
sha256sums=(
  "0e12998d4a80a9e40554dd4b5079daeba756cd05e2c9c7fd0af0af25fac9105e"
  "b2b3515daf31a886bf33119276f1b968353f5ac18e353bbc39ae05c6164d47e1"
)


prepare() {
  cd "ashuffle-${pkgver}"

  patch -p1 -i "${srcdir}/0001_add_option_to_use_system_yaml_cpp.patch"

  sed -i 's@absl_wyhash@absl_low_level_hash@' meson.build
}

build() {
  cd "ashuffle-${pkgver}"

  arch-meson \
    -Dtests=enabled \
    -Dunsupported_use_system_absl=true \
    -Dunsupported_use_system_gtest=true \
    -Dunsupported_use_system_yaml_cpp=true \
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
