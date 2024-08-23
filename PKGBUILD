# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=ashuffle
pkgver=3.14.8
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
sha256sums=('df2bd8b1e7221fe4e81fd748928897200e6e2bd1e88305543d5db1544d8da196')


prepare() {
  cd "ashuffle-${pkgver}"
}

build() {
  cd "ashuffle-${pkgver}"

  # fix a build failure in tests where -Werror is set
  export CXXFLAGS="$CXXFLAGS -Wno-error=unused-variable"

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
