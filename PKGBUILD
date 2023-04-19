# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Mikkel Kroman <mk@maero.dk>

pkgname=crystal-git
pkgver=1.8.0.r16.g6d02f3b69
pkgrel=1
pkgdesc="The Crystal Programming Language"
arch=('x86_64' 'aarch64')
url="http://crystal-lang.org"
license=('Apache')
depends=('gc' 'pcre2' 'libevent')
makedepends=('git' 'libxml2' 'llvm' 'crystal')
checkdepends=('libyaml' 'libxml2' 'gmp' 'git' 'inetutils')
optdepends=('shards: To make the crystal deps command work'
            'libyaml: For YAML support'
            'gmp: For BigInt support'
            'libxml2: For XML support')
conflicts=('crystal')
provides=('crystal')
source=("git+https://github.com/crystal-lang/crystal.git")

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname/-git/}"

  if [ "$CARCH" = "aarch64" ]; then
    export EXPORT_CC="CC=cc" # prevent lld usage, broken on  aarch64
  fi
}

build() {
  cd "$srcdir/${pkgname/-git/}"

  make release=1 FLAGS="--no-debug" \
       CRYSTAL_PATH="$srcdir/${pkgname/-git/}/src" \
       CRYSTAL_CACHE_DIR="/tmp/crystal"
  make docs CRYSTAL_CACHE_DIR="/tmp/crystal"
}

check() {
  cd "$srcdir/${pkgname/-git/}"

  make -j1 compiler_spec std_spec \
       CRYSTAL_PATH="$srcdir/${pkgname/-git/}/src" \
       CRYSTAL_CONFIG_VERSION="$pkgver" \
       CRYSTAL_CACHE_DIR="/tmp/crystal"
}

package() {
  cd "$srcdir/${pkgname/-git/}"

  make install install_docs PREFIX="$pkgdir/usr"
  install -Dm644 src/llvm/ext/llvm_ext.o "$pkgdir/usr/share/crystal/src/llvm/ext/llvm_ext.o"
  cp -av lib/ "$pkgdir/usr/share/crystal/lib/"
}

sha256sums=('SKIP')
