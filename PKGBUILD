# Maintainer: mfw <espadonne@outlook.com>

pkgname=armfortas
pkgver=0.1.0
pkgrel=1
pkgdesc='Bespoke Fortran compiler with owned frontend and code generators'
arch=('x86_64')
url='https://github.com/FortranGoingOnForty/armfortas'
license=('GPL-3.0-only')
# Runtime requirements: the compiler invokes ld and consumes GCC CRT objects.
depends=('binutils' 'gcc' 'glibc')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e59fc642d28637dae814ec431cad898388a219a68db8f8c02ff64a4782859492')

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin armfortas --bin afs
}

check() {
    cd "$pkgname-$pkgver"
    export AFS_RUNTIME_CACHE="$srcdir/runtime-cache"

    target/release/armfortas --version
    target/release/afs --version
    printf '%s\n' \
        'program package_smoke' \
        '  if (2 + 2 /= 4) error stop 1' \
        'end program package_smoke' > "$srcdir/package-smoke.f90"
    target/release/armfortas \
        "$srcdir/package-smoke.f90" -o "$srcdir/package-smoke"
    "$srcdir/package-smoke"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/armfortas "$pkgdir/usr/bin/armfortas"
    install -Dm755 target/release/afs "$pkgdir/usr/bin/afs"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
