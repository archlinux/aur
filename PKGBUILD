# Maintainer: Dimytch <aspamkiller from yandex point ru>

pkgname=openssl-gost-engine-git
pkgver=1.507
pkgrel=1
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
  '48d0f67b1e5e103b1162f86e46cfab2184598914c2e49ae193d1fe429dfe2da852bea569b64c3a8c882f8a87cb1d5e301f97021a8b7b4082408b59a5b131cb97'
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
