# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Mikkel Kroman <mk@maero.dk>

pkgname=crystal-git
pkgver=0.7.3.r0.gbf72b07
_last_release="0.7.2-1"
pkgrel=1
pkgdesc="The Crystal Programming Language"
arch=('i686' 'x86_64')
url="http://crystal-lang.org"
license=('Apache')
depends=('libunwind' 'gc' 'llvm' 'libatomic_ops' 'pcre' 'libpcl' 'libevent')
optdepends=('libyaml: For YAML support'
            'gmp: For BigInt support'
            'libxml2: For XML support')
makedepends=('git')
conflicts=('crystal')
provides=('crystal')
source=("git://github.com/manastech/crystal.git")
source_i686+=("http://cloud.aeshna.de/u/mrzyx/crystal32/crystal32-${_last_release/-*/}.tar.gz")
source_x86_64+=("https://github.com/manastech/crystal/releases/download/${_last_release/-*/}/${pkgname/-git/}-$_last_release-linux-x86_64.tar.gz")

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  rm -rf "$srcdir/bin"

  if [ -d "$srcdir/${pkgname/-git/}-$_last_release/bin" ]; then
    ln -sf "$srcdir/${pkgname/-git/}-$_last_release/bin" "$srcdir/bin"
  elif [ -f "$srcdir/crystal32-${_last_release/-*/}" ]; then
    mkdir -p "$srcdir/bin"
    cp "$srcdir/crystal32-${_last_release/-*/}" "$srcdir/bin/crystal"
  fi
}

build() {
  cd "$srcdir/${pkgname/-git/}"

  make release=1 \
       PATH="$srcdir/bin:$PATH" \
       CRYSTAL_PATH="$srcdir/${pkgname/-git/}/src" \
       CRYSTAL_CONFIG_PATH="libs:/usr/lib/crystal"
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  # /usr/bin/crystal compiled executable
  # /usr/lib/crystal/ compiler src & core libs
  # /usr/share/doc/crystal/samples/ samples

  install -Dm755 ".build/crystal" "$pkgdir/usr/bin/crystal"
  install -dm755 "$pkgdir/usr/lib"
  cp -rv src "$pkgdir/usr/lib/crystal"
  install -dm755 "$pkgdir/usr/share/doc/crystal"
  cp -rv samples "$pkgdir/usr/share/doc/crystal/"
}

# vim:set ts=2 sw=2 et:
sha256sums=('SKIP')
sha256sums_i686=('ec9e8bd61852935e7cd5ebd954cef150d67064193504e8ae13b379ece48bbc33')
sha256sums_x86_64=('1ab9d2e1019c490200c0c1ccd9057d216d67f25376de82a5f6f131f4ef5054ef')
