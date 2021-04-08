# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=google-lyra-git
pkgver=0.0.2.r0.g4d759ef
pkgrel=1
pkgdesc="A very low-bitrate codec for speech compression"
arch=('i686' 'x86_64')
url="https://github.com/google/lyra"
license=('apache')
depends=('gcc-libs')
makedepends=('git' 'bazel')
provides=('google-lyra')
conflicts=('google-lyra')
source=("git+https://github.com/google/lyra.git")
sha256sums=('SKIP')


pkgver() {
  cd "lyra"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lyra"

  # does not work with ccache
  #export CC="/usr/bin/gcc"
  #export CXX="/usr/bin/g++"

  bazel \
    build \
    -c opt \
    :encoder_main \
    :decoder_main
}

check() {
  cd "lyra"

  #bazel test //:all
}

package() {
  cd "lyra"

  install -Dm755 "bazel-bin/encoder_main" "$pkgdir/usr/bin/lyra_encoder"
  install -Dm755 "bazel-bin/decoder_main" "$pkgdir/usr/bin/lyra_decoder"
}
