# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Mikkel Kroman <mk@maero.dk>

pkgname=crystal-git
pkgver=0.24.1.r27.ge04565fbd
_last_release="0.24.1-2"
pkgrel=1
pkgdesc="The Crystal Programming Language"
arch=('i686' 'x86_64')
url="http://crystal-lang.org"
license=('Apache')
depends=('gc' 'libatomic_ops' 'pcre' 'libevent')
makedepends=('git' 'libxml2' 'llvm')
checkdepends=('libyaml' 'libxml2' 'gmp' 'git' 'inetutils')
optdepends=('shards: To make the crystal deps command work'
            'libyaml: For YAML support'
            'gmp: For BigInt support'
            'libxml2: For XML support')
conflicts=('crystal')
provides=('crystal')
source=("git+https://github.com/crystal-lang/crystal.git")
source_i686+=("https://github.com/crystal-lang/crystal/releases/download/v${_last_release/-*/}/${pkgname/-git/}-$_last_release-linux-i686.tar.gz")
source_x86_64+=("https://github.com/crystal-lang/crystal/releases/download/v${_last_release/-*/}/${pkgname/-git/}-$_last_release-linux-x86_64.tar.gz")

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${pkgname/-git/}"

  make FLAGS="--release --no-debug" \
       PATH="$srcdir/${pkgname/-git/}-$_last_release/bin:$PATH" \
       CRYSTAL_PATH="$srcdir/${pkgname/-git/}/src" \
       CRYSTAL_CONFIG_PATH="lib:/usr/lib/crystal" \
       CRYSTAL_CACHE_DIR="/tmp/crystal"
  make docs CRYSTAL_CACHE_DIR="/tmp/crystal"
}

check() {
  cd "$srcdir/${pkgname/-git/}"

  make spec \
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
sha256sums_i686=('4f45f8ea57486be0f8d035c466edda848b7e1a7aa809fff4ea31311fd8ebea97')
sha256sums_x86_64=('b75df8522f2302270b48e6b77812a0cb0086e338cdf884227e0076afbf83aca7')
