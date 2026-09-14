# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=ashuffle
pkgver=3.14.10
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd."
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(MIT)

depends=("libmpdclient" "yaml-cpp" "abseil-cpp>=20211102.0")
makedepends=("meson" "gtest>=1.10")

source=(
  "https://github.com/joshkunz/ashuffle/archive/v${pkgver}/ashuffle-${pkgver}.tar.gz"
)
sha256sums=('66e1f29f309567873bb6d7bbcc21c84d00c30e9d8d40989a0db74629db3b9303')


prepare() {
  cd "ashuffle-${pkgver}"
  sed -i \
    -e '/absl_borrowed_fixup_buffer/d' \
    -e '/absl_crc_cpu_detect/d' \
    meson.build
}

build() {
  cd "ashuffle-${pkgver}"

  # fix a build failure in tests where -Werror is set
  #  also fix a deprecation warning in gtest treated as error
  export CXXFLAGS="$CXXFLAGS -Wno-error=unused-variable -Wno-error=cpp"

  arch-meson \
    -Dtests=enabled \
    -Dunsupported_use_system_absl=true \
    -Dunsupported_use_system_gtest=true \
    -Dunsupported_use_system_yamlcpp=true \
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
