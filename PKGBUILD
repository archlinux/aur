# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=crystal
pkgver=0.7.3
pkgrel=1
pkgdesc="The Crystal Programming Language"
arch=('i686' 'x86_64')
url="http://crystal-lang.org"
license=('Apache')
depends=('libunwind' 'gc' 'llvm' 'libatomic_ops' 'pcre' 'libpcl' 'libevent')
checkdepends=('libyaml' 'libxml2')
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

  make spec CRYSTAL_PATH="$srcdir/$pkgname-$pkgver/src" \
            CRYSTAL_CONFIG_VERSION="$pkgver"
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
sha256sums=('42ca40930310846020758638061af2728c2c1745745f223c35d65a057e806f60')
sha256sums_i686=('567dca0ed596ac7801362613251a00580c17a8abdc8a98cd5b0553cd30119ece')
sha256sums_x86_64=('f5621d8140398b02c159c5f2dbd88f31541891d9d3a4317374a2dc8f20d7c147')
