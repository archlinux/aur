# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=crystal
pkgver=0.7.5
pkgrel=2
_binary_rel=1
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
source_i686+=("https://github.com/manastech/crystal/releases/download/$pkgver/$pkgname-$pkgver-$_binary_rel-linux-i686.tar.gz")
source_x86_64+=("https://github.com/manastech/crystal/releases/download/$pkgver/$pkgname-$pkgver-$_binary_rel-linux-x86_64.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make release=1 \
       PATH="$srcdir/$pkgname-$pkgver-$_binary_rel/bin:$PATH" \
       CRYSTAL_PATH="$srcdir/$pkgname-$pkgver/src" \
       CRYSTAL_CONFIG_VERSION="$pkgver" \
       CRYSTAL_CONFIG_PATH="libs:/usr/lib/crystal"
  make doc
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ "$CARCH" = "x86_64" ]; then # TODO: remove with 0.7.6
    make spec CRYSTAL_PATH="$srcdir/$pkgname-$pkgver/src" \
              CRYSTAL_CONFIG_VERSION="$pkgver"
  fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # /usr/bin/crystal                compiled executable
  # /usr/lib/crystal/               compiler src & core libs
  # /usr/share/doc/crystal/api      api docs
  # /usr/share/doc/crystal/samples/ samples

  install -Dm755 ".build/crystal" "$pkgdir/usr/bin/crystal"

  install -dm755 "$pkgdir/usr/lib"
  cp -av src "$pkgdir/usr/lib/crystal"

  install -dm755 "$pkgdir/usr/share/doc/crystal"
  cp -av doc     "$pkgdir/usr/share/doc/crystal/api"
  cp -av samples "$pkgdir/usr/share/doc/crystal/"
}

sha256sums=('e07e6f033f72db00861c68dc71f7d5f1afb00800f77d0cbf1dcb5634e6b95d5e')
sha256sums_i686=('d0ee8b5d81917c7ae559760793d8b611034590bfb965fe450f3d430d97d56c34')
sha256sums_x86_64=('e852d176d26e749083005fb7689ff2c28f3a987df62cb29b6dd8e7f417c90a6c')
