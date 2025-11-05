# Maintainer: Matthew Wolffe <mfwolffe@outlook.com>
pkgname=fortress
pkgver=0.9.99
pkgrel=1
pkgdesc="A command-line file explorer written in modern Fortran with cd-on-exit"
arch=('x86_64' 'aarch64')
url="https://github.com/FortranGoingOnForty/fortress"
license=('MIT')
depends=('glibc' 'gcc-libs' 'fzf' 'git')
makedepends=('fortran-fpm' 'gcc-fortran')
install=fortress.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5eb08ae980e3e4d3469510eda0c5d325db831ab8f3ac3146befd51efa929245f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    fpm build --flag "-O2"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install the binary
    install -Dm755 "build/gfortran_"*"/app/fortress" "$pkgdir/usr/bin/fortress-bin"

    # Install shell integration files
    install -Dm644 "fortress.sh" "$pkgdir/usr/share/fortress/fortress.sh"
    install -Dm644 "fortress.fish" "$pkgdir/usr/share/fortress/fortress.fish"

    # Install bash integration to profile.d (auto-sourced on login)
    install -Dm644 "fortress.sh" "$pkgdir/etc/profile.d/fortress.sh"

    # Install fish integration to vendor functions (auto-loaded)
    install -Dm644 "fortress.fish" "$pkgdir/usr/share/fish/vendor_functions.d/fortress.fish"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "USAGE.md" "$pkgdir/usr/share/doc/$pkgname/USAGE.md"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
