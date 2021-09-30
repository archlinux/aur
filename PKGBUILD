# Maintainer: Dimytch <aspamkiller from yandex point ru>

pkgname=openssl-gost-engine-git
pkgver=1.507
pkgrel=2
pkgdesc="A reference implementation of the Russian GOST crypto algorithms for OpenSSL"
arch=('i686' 'x86_64')
url="https://github.com/gost-engine/engine/"
license=('apache')
depends=('perl' 'openssl')
makedepends=('git' 'cmake')
optdepends=('ca-certificates')
provides=('openssl-gost-engine-git')
conflicts=(
  'openssl-gost-engine'
  'gost-engine'
)
source=(
  "git+https://github.com/gost-engine/engine.git"
  "gost.cnf"
  "example-openssl.cnf"
  "install.sh"
)
sha512sums=(
  SKIP
  '431f810f822a347135d10c99f98ed2516e6afe310def77fc9aa0b41dc0578b05e2684f77e1062ea934961720f6d11f73f27e38548bccfe61709e81f8d53c484e'
  '1e1b08e3a6bffebebe7f878f3bb5c16d6b3f31d4572f114663db75cee9237d9bee168cbfcaa2747c237f27fbe58b4f91f159b04ffce69e988bb9483e5bec3591'
  '37048d4c1e9252a02d4a3c22330bc97ea79834b5debc52418aa090c40b27a6e2fe2cf563d248df10b8687eae37e699d7e5eda4fa40f03f4d9313a3af5a7d3a5a'
)
install='install.sh'
backup=(
  'etc/ssl/gost.cnf'
)

pkgver(){
  cd "$srcdir/engine"
  git checkout openssl_1_1_1 >/dev/null 2>&1
  echo "1.`git rev-list --count HEAD`"
}
prepare() {
  cd "$srcdir/engine"
  git checkout openssl_1_1_1
  mkdir -p build
}

build() {
  cd "$srcdir/engine/build"
  git checkout openssl_1_1_1
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  cmake --build . --config Release
}

check() {
  cd "$srcdir/engine/build"
  git checkout openssl_1_1_1
  make test
}

package() {
  cd "$srcdir/engine/build"
  git checkout openssl_1_1_1

  DESTDIR="$pkgdir" cmake --build . --target install --config Release
  mkdir -p -m0755 "$pkgdir/etc/ssl"
  install -m0644 "$srcdir/gost.cnf" "$pkgdir/etc/ssl"
  mkdir -p -m0755 "$pkgdir/usr/lib/openssl-gost-engine"
  install -m0644 "$srcdir/engine/INSTALL.md" \
                 "$srcdir/engine/LICENSE" \
                 "$srcdir/engine/README.gost" \
                 "$srcdir/engine/README.md" \
        "$pkgdir/usr/lib/openssl-gost-engine"
}
