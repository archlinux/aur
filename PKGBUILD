# Maintainer: Luis Martinez
# Credit: desbma
pkgname=zoxide-git
_pkgname=zoxide
pkgver=0.6.0.r4.g1828414
pkgrel=3
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/ajeetdsouza/zoxide"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver()  {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgname}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/zoxide
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    find man -name '*.1' -type f \
      -exec install -Dm 644 '{}' -t "${pkgdir}/usr/share/man/man1/" \;
}
