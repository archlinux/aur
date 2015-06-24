# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=crystal
pkgver=0.7.4
pkgrel=1
pkgdesc="The Crystal Programming Language"
arch=('i686' 'x86_64')
url="http://crystal-lang.org"
license=('Apache')
depends=('libunwind' 'gc-static' 'llvm' 'libatomic_ops' 'pcre' 'libpcl' 'libevent')
checkdepends=('libyaml' 'libxml2' 'gmp' 'git')
optdepends=('libyaml: For YAML support'
            'gmp: For BigInt support'
            'libxml2: For XML support')
conflicts=('crystal-git')
source=("https://github.com/manastech/crystal/archive/$pkgver.tar.gz")
source_i686+=("http://cloud.aeshna.de/u/mrzyx/crystal32/crystal32-$pkgver.tar.gz")
source_x86_64+=("https://github.com/manastech/crystal/releases/download/$pkgver/$pkgname-$pkgver-1-linux-x86_64.tar.gz")

prepare() {
  rm -rf "$srcdir/bin"

  if [ -d "$srcdir/$pkgname-$pkgver-1/bin" ]; then
    ln -sf "$srcdir/$pkgname-$pkgver-1/bin" "$srcdir/bin"
  elif [ -f "$srcdir/crystal32-$pkgver" ]; then
    mkdir -p "$srcdir/bin"
    cp "$srcdir/crystal32-$pkgver" "$srcdir/bin/crystal"
  fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make release=1 \
       PATH="$srcdir/bin:$PATH" \
       CRYSTAL_PATH="$srcdir/$pkgname-$pkgver/src" \
       CRYSTAL_CONFIG_VERSION="$pkgver" \
       CRYSTAL_CONFIG_PATH="libs:/usr/lib/crystal"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ "$CARCH" = "x86_64" ]; then
    make spec CRYSTAL_PATH="$srcdir/$pkgname-$pkgver/src" \
              CRYSTAL_CONFIG_VERSION="$pkgver"
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # /usr/bin/crystal compiled executable
  # /usr/lib/crystal/ compiler src & core libs
  # /usr/share/doc/crystal/samples/ samples

  install -Dm755 ".build/crystal" "$pkgdir/usr/bin/crystal"
  install -dm755 "$pkgdir/usr/lib"
  cp -rv src "$pkgdir/usr/lib/crystal"
  install -dm755 "$pkgdir/usr/share/doc/crystal"
  cp -rv samples "$pkgdir/usr/share/doc/crystal/"
}
sha256sums=('aba8893b0361d7a2846bf1803c35a61969641807008798c170ea98b566f3ac0f')
sha256sums_i686=('326d4c1522446df082325ded964da3990f404c14632e3b1993a6f60f36b3a606')
sha256sums_x86_64=('9ae57248752df2ac9dbae623a646e85c03e53c80f2087a134abe801408e039fd')
