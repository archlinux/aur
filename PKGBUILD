# Maintainer: Maxim Novikov <the.mlex@gmail.com>

pkgname=openssl-gost-engine
pkgver=3.0.3.r760.e0a500a
pkgrel=1
pkgdesc="A reference implementation of the Russian GOST crypto algorithms for OpenSSL"
arch=('i686' 'x86_64')
url="https://github.com/gost-engine/engine/"
license=('MIT')
depends=('perl' 'openssl')
makedepends=('git' 'cmake')
optdepends=('ca-certificates')
provides=('openssl-gost-engine')
conflicts=(
  'openssl-gost-engine'
  'gost-engine'
)
source=(
  "git+https://github.com/gost-engine/engine.git#commit=e0a500a"
  "git+https://github.com/provider-corner/libprov.git#commit=8a126e0"
  "gost.cnf"
  "example-openssl.cnf"
  "openssl-gost-engine.install"
)
sha512sums=(
  SKIP
  SKIP
  'ad43a736c26c36b11a39f9b0831839a8bc033f838ce5bc5d93930e2610fcfa69679799bb1fc413f16fc189449df31bae9690d44b18bd7d7b28fe2eb2bdf9084a'
  'b78d96d14edce1be96fab96da0e97e4c94c59e311428e2f84d77864366e7b3bbaaf6a8192d275552bb578075a5aada2200be83bec256ceb9aa057f0a892d6f8b'
  '1083718c4aad31c1b41743c77bae202f2746e0610e2f7c7891f70b97cff52b9ffd5afdd82edf41a991492425ac823d14949a35d9fff375a9963fbc2e645461ad'
)
install='openssl-gost-engine.install'
backup=(
  'etc/ssl/gost.cnf'
)

pkgver(){
  cd "$srcdir/engine"
  printf "3.0.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$srcdir/engine"

  git submodule init
  git config submodule.libs/libprov.url "${srcdir}/libprov"
  git -c protocol.file.allow=always submodule update

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
