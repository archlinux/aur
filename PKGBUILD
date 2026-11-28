# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=tinox-bin
pkgver=2.9.11
pkgrel=1
pkgdesc="Native, statically typed programming language with an LLVM backend, garbage collection, and concurrency support (prebuilt binary)"
arch=('x86_64')
url="https://github.com/subnix-work/tinox"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'openssl' 'llvm' 'gcc' 'xz' 'bzip2')
optdepends=(
  'gc: only for TINOX_GC=boehm builds',
  'clang: tinox repl / dev-mode on-the-fly runtime recompilation'
  'sqlite: DB feature with driver = "sqlite" in tinox.toml'
  'postgresql-libs: DB feature with driver = "postgres" in tinox.toml'
  'mariadb-libs: DB feature with driver = "mysql" in tinox.toml'
)
# Versioned (not bare "tinox") so a versioned makedepends on another
# package (e.g. jgrep-tinox's makedepends=('tinox>=2.0.0')) can actually
# resolve against this -- pacman only matches a "provides" against a
# version constraint if the provides entry itself carries a version.
provides=("tinox=$pkgver")
conflicts=('tinox')
source=("https://github.com/subnix-work/tinox/releases/download/v${pkgver}/tinox-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('2a6ff44a60f5883a03b9dfb48e826fded993a5b6db549cb00e6ac434a02e4b4f')

package() {
  cd "$srcdir"
  install -Dm755 tinox "$pkgdir/usr/bin/tinox"
  install -Dm644 runtime.c "$pkgdir/usr/share/tinox/runtime.c"
  # runtime.h: include path for [native] C sources next to runtime.c
  install -Dm644 runtime.h "$pkgdir/usr/share/tinox/runtime.h"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cp -r core "$pkgdir/usr/share/tinox/core"
  find "$pkgdir/usr/share/tinox/core" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/tinox/core" -type f -exec chmod 644 {} \;
}
