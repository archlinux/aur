# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='nimdow'
pkgver='0.7.35'
pkgrel='3'
_commit='b3097e9'
pkgdesc='Tiling window manager written in Nim'
arch=('x86_64')
url='https://github.com/avahe-kellenberger/nimdow'
license=('GPL2')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('glibc')
makedepends=('nim')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  # Save the original build.sh script
  cp -fax build.sh{,-orig}

  # The original build.sh script expects to be run from within
  # a git repository, which is not what we are doing here, so
  # we create out own build.sh script with an appropriate commit
  # hash
  cat <<__EOT__ >build.sh
#!/bin/sh
set -eu
printf -- '--- Building with latest commit: %s ---\n' "$_commit"
LATEST_COMMIT="$_commit" exec nim c --multimethods:on -o:bin/nimdow -d:release --opt:speed src/nimdow.nim
exit 127
__EOT__

  chmod +x build.sh
}

build() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  nimble release
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  install -Dm0755 bin/nimdow          "$pkgdir/usr/bin/nimdow"
  install -Dm0644 doc/nimdow.1        "$pkgdir/usr/share/man/man1/nimdow.1"
  install -Dm0644 config.default.toml "$pkgdir/usr/share/$pkgname/config.default.toml"
  install -Dm0644 nimdow.desktop      "$pkgdir/usr/share/xsessions/nimdow.desktop"
  install -Dm0644 README.md           "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=(
  '7491cf2752d6ba874d35ad86487011d2473db93e494e4311e65891f75097259c'
)
sha512sums=(
  '4448fbf7d81484232590e39a327805c3abc66d020dbaf0bf3f057283f59105718076708f56a5de7f12b3169090b22fe5c7240e4a3f6f4e045c2bd7021b4a35ce'
)
b2sums=(
  '441ec592e74af4cd4ad77422304192f12b1dba2a8cf952d5c20bc46c423bc9eae80c1d63169ce5a45316eab05ae129c292c5d4b6bc4e374c67f4caba7aa6bc18'
)

# eof
