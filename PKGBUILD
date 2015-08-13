# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=crystal
pkgver=0.7.6
pkgrel=1
_binary_rel=1
pkgdesc="The Crystal Programming Language"
arch=('i686' 'x86_64')
url="http://crystal-lang.org"
license=('Apache')
depends=('libunwind' 'gc-static' 'llvm' 'libatomic_ops' 'pcre' 'libpcl' 'libevent')
makedepends=('libxml2')
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

  make spec CRYSTAL_PATH="$srcdir/$pkgname-$pkgver/src" \
            CRYSTAL_CONFIG_VERSION="$pkgver"
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

  install -Dm644 etc/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_crystal"
}

sha256sums=('28ba8fd5ccc43be6bfa8069ce2d61134a8fbed0332c81a2d49629b919d1de5b6')
sha256sums_i686=('6f9d8d7bb3795c590c49fc7da33110ca9977323ff1bd61fbace589ddb44f57b0')
sha256sums_x86_64=('5fd6781ecf7243d2a71ec9c1aa93ad6a1fadef0d231c329280720c271183c1ff')
