# Maintainer: Nathan Elliott <38136612-NathanTheTerrible@users.noreply.gitlab.com>
pkgname=libpdq
pkgver=0.2.3
pkgrel=2
pkgdesc="Library for PDQ-256 perceptual image hashing"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/NathanTheTerrible/libpdq"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc')
provides=("$pkgname=$pkgver")
conflicts=()
# Keep the static archive (libpdq.a) in the package — Arch strips static
# libs by default. libpdq's "embeddable, runs on a toaster" framing makes
# static linking a load-bearing use case, so we override.
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('53e7f2b6a324712f79e978730d0b0604cae01a0714bc423825c2edafa8ce887c')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"

  # Library, static archive, and header via the project's own install target.
  make install DESTDIR="$pkgdir" PREFIX="/usr"

  # CLI tool not covered by the Makefile install target — handle here.
  install -Dm755 pdq "$pkgdir/usr/bin/pdq"

  # Standard Arch package conventions for license and docs.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
