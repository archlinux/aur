# Maintainer: Dimytch <aspamkiller from yandex point ru>

pkgname=openssl-gost-engine-git
pkgver=r507.aba6613
pkgrel=1
pkgdesc="A reference implementation of the Russian GOST crypto algorithms for OpenSSL"
arch=('i686' 'x86_64')
url="https://github.com/gost-engine/engine/"
license=('apache')
depends=('perl' 'openssl')
makedepends=('git' 'cmake')
optdepends=('ca-certificates')
provides=('openssl-gost-engine')
conflicts=(
  'openssl-gost-engine'
  'gost-engine'
)
source=(
  "git+https://github.com/gost-engine/engine.git#branch=openssl_1_1_1"
  "gost.cnf"
  "example-openssl.cnf"
  "openssl-gost-engine.install"
)
sha512sums=(
  SKIP
  '431f810f822a347135d10c99f98ed2516e6afe310def77fc9aa0b41dc0578b05e2684f77e1062ea934961720f6d11f73f27e38548bccfe61709e81f8d53c484e'
  '1e1b08e3a6bffebebe7f878f3bb5c16d6b3f31d4572f114663db75cee9237d9bee168cbfcaa2747c237f27fbe58b4f91f159b04ffce69e988bb9483e5bec3591'
  'ed397370b43ae9eb4018ab322bbfc754e4c4af869a39fd986efa7f96584a3845474c32b95fba6eb3140ca7b8715b1cbca8fc982edd5bcee5583bc12d76e3f874'
)
install='openssl-gost-engine.install'
backup=(
  'etc/ssl/gost.cnf'
)

pkgver(){
  cd "$srcdir/engine"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$srcdir/engine"
  mkdir -p build
}

build() {
  cd "$srcdir/engine/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build . --config Release
}

check() {
  cd "$srcdir/engine/build"
  make test
}

package() {
  cd "$srcdir/engine/build"

  DESTDIR="$pkgdir" cmake --build . --target install --config Release
  install -Dm0644 "$srcdir/gost.cnf" -t "$pkgdir/etc/ssl"

  mkdir -p -m0644 "$pkgdir/usr/share/doc/openssl-gost-engine"
  install -m0644 "$srcdir/engine/INSTALL.md" \
                 "$srcdir/engine/README.gost" \
                 "$srcdir/engine/README.md" \
                 "$pkgdir/usr/share/doc/openssl-gost-engine"
}
