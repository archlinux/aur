# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Mikkel Kroman <mk@maero.dk>

pkgname=crystal-git
pkgver=0.35.1.r29.g56ab08621
pkgrel=1
pkgdesc="The Crystal Programming Language"
arch=('x86_64' 'aarch64')
url="http://crystal-lang.org"
license=('Apache')
depends=('gc' 'libatomic_ops' 'pcre' 'libevent')
makedepends=('git' 'libxml2' 'llvm')
makedepends_x86_64=('crystal')
checkdepends=('libyaml' 'libxml2' 'gmp' 'git' 'inetutils')
optdepends=('shards: To make the crystal deps command work'
            'libyaml: For YAML support'
            'gmp: For BigInt support'
            'libxml2: For XML support')
conflicts=('crystal')
provides=('crystal')
source=("git+https://github.com/crystal-lang/crystal.git")
source_aarch64=("https://dev.alpinelinux.org/archive/crystal/crystal-0.35.0-aarch64-alpine-linux-musl.tar.gz")

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
    git clean -f
    patch -p1 < "$srcdir/9401.patch"
    patch -p1 < "$srcdir/9430.patch"
    patch -p1 < "$srcdir/9422.patch"
    export PATH="$srcdir/crystal-0.35.0-aarch64-alpine-linux-musl/bin:$PATH"
    export EXPORT_CC="CC=cc" # prevent lld usage, broken on  aarch64
  fi
}

build() {
  cd "$srcdir/${pkgname/-git/}"

  make release=1 FLAGS="--no-debug" \
       CRYSTAL_PATH="$srcdir/${pkgname/-git/}/src" \
       CRYSTAL_CONFIG_PATH="/usr/lib/crystal" \
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

  # /usr/bin/crystal                compiled executable
  # /usr/lib/crystal/               compiler src & core libs
  # /usr/share/doc/crystal/api/     api docs
  # /usr/share/doc/crystal/samples/ samples

  install -Dm755 ".build/crystal" "$pkgdir/usr/bin/crystal"

  install -dm755 "$pkgdir/usr/lib"
  cp -av src "$pkgdir/usr/lib/crystal"

  install -dm755 "$pkgdir/usr/share/doc/crystal"
  cp -av docs     "$pkgdir/usr/share/doc/crystal/api"
  cp -av samples "$pkgdir/usr/share/doc/crystal/"

  install -Dm644 etc/completion.bash "$pkgdir/usr/share/bash-completion/completions/crystal"
  install -Dm644 etc/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_crystal"

  install -Dm644 man/crystal.1 "$pkgdir/usr/share/man/man1/crystal.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('SKIP')
sha256sums_aarch64=('de903f2b53eec558cb77520cd9d52bde357bffae37fc6120308b4ddd8a7d65f9')
