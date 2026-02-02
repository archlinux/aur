# Maintainer: p741633 <p741633@hotmail.com>
pkgname=thc-secure-delete
pkgver=3.1.1
pkgrel=1
pkgdesc="THC secure deletion tools (srm, sfill, sswap, sdmem)"
arch=('x86_64')
url="https://github.com/gordrs/thc-secure-delete"
license=('GPL-2.0-only')
depends=('glibc' 'bash')
makedepends=('gcc' 'make' 'patch')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gordrs/thc-secure-delete/archive/refs/tags/v$pkgver.tar.gz"
  "signal-handler-fix.patch"
  "warnings-fix.patch"
  "makefile-deps.patch"
  "hardening-ldflags.patch"
)
sha256sums=('228b1cfe25c1ad5dbb8237be770779b97ebd7ea9eb9db34cee4ab31cf3a8dc13'
            '5c22a29b6e7b0e5ccb6fb8ee214e4cc4a2141c4f2e550d5007e29030c5e0f320'
            '2d7edb6089a9819c681acba53a749619b44db472151142679e350167905561ea'
            '75d24c465349f8859ed418f760e7219de2877d259a8b4aa970c3fc433f9a2d1a'
            '2d115a0460107f15849d800264aa148ee4eea804041eb74074fa6734af3d0116')
options=('!lto' '!strip')

prepare() {
  cd "$srcdir/thc-secure-delete-$pkgver"
  patch -Np0 -i "$srcdir/signal-handler-fix.patch"
  patch -Np0 -i "$srcdir/warnings-fix.patch"
  patch -Np0 -i "$srcdir/makefile-deps.patch"
  patch -Np0 -i "$srcdir/hardening-ldflags.patch"
}

build() {
  cd "$srcdir/thc-secure-delete-$pkgver"
  make
}

package() {
  cd "$srcdir/thc-secure-delete-$pkgver"

  # Binaries
  install -Dm755 srm   "$pkgdir/usr/bin/srm"
  install -Dm755 sfill "$pkgdir/usr/bin/sfill"
  install -Dm755 sswap "$pkgdir/usr/bin/sswap"
  install -Dm755 sdmem "$pkgdir/usr/bin/sdmem"
  install -Dm755 the_cleaner.sh "$pkgdir/usr/bin/the_cleaner.sh"

  # Provide the "sdel" name (Makefile intended this as a symlink to srm)
  ln -s srm "$pkgdir/usr/bin/sdel"

  # Man pages
  install -Dm644 srm.1   "$pkgdir/usr/share/man/man1/srm.1"
  install -Dm644 sfill.1 "$pkgdir/usr/share/man/man1/sfill.1"
  install -Dm644 sswap.1 "$pkgdir/usr/share/man/man1/sswap.1"
  install -Dm644 smem.1  "$pkgdir/usr/share/man/man1/smem.1"

  # License file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
