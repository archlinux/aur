# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ronalde <r.v.engelen+aur@gmail.com>
# Contributor: dexterlb <dexterlb@qtrp.org>

pkgname=roc-toolkit-git
pkgver=0.3.0.r0.g57b932b8
pkgrel=3
pkgdesc="Real-time audio streaming over network"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/roc-streaming/roc-toolkit"
license=(MPL2)
provides=(roc-toolkit)
conflicts=(roc-toolkit roc)
replaces=(roc)
depends=(
  glibc
  gcc-libs
  libunwind
  libuv
  openfec
  speexdsp
)
makedepends=(
  alsa-lib
  cpputest
  gengetopt
  libpulse
  ragel
  scons
  sox
  git
)
optdepends=(
  'libpulse: for roc-conv, roc-receive and roc-send'
  'sox: for roc-conv, roc-receive and roc-send'
)
source=("git+https://github.com/roc-streaming/roc-toolkit.git")
sha256sums=('SKIP')

pkgver() {
  cd "roc-toolkit"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local scons_options=(
    --prefix=/usr
    --libdir=/usr/lib
    --disable-openssl  # disable as it is not yet used
    --enable-tests
    --enable-examples
  )

  cd "roc-toolkit"
  scons "${scons_options[@]}"
}

check() {
  local scons_options=(
    --prefix=/usr
    --libdir=/usr/lib
    --disable-openssl  # disable as it is not yet used
    --enable-tests
    --enable-examples
  )

  cd "roc-toolkit"
  scons test "${scons_options[@]}"
}

package() {
  local scons_options=(
    --prefix=/usr
    --libdir=/usr/lib
  )

  cd "roc-toolkit"
  scons DESTDIR="$pkgdir/" "${scons_options[@]}" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 3rdparty/hedley/COPYING -t "$pkgdir/usr/share/licenses/${pkgname}/hedley.COPYING"
}
