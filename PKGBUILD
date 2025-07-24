# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>

pkgname=vet
pkgver=1.0.0
pkgrel=1
pkgdesc='A command-line tool that acts as a safety net for the risky curl | bash pattern'
arch=('any')
url="https://github.com/vet-run/$pkgname"
license=('MIT')
depends=('bash' 'coreutils' 'curl' 'diffutils' 'less')
checkdepends=('bats' 'bats-assert' 'bats-support')
optdepends=(
    'bat: syntax-highlighting pager for script review'
    'shellcheck: for linting downloaded scripts'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0d1119c2dae24c86adfc0034e527ef2eb811282a76af7c84254107643a4477e69f0d1de83746aa9427ef122546397532f26c1b39b692cd935ed881f75fda3556')

check() {
    cd $pkgname-$pkgver

    # Link system bats helpers since git submodules aren't in release tarball
    rm -rf tests/helpers
    mkdir -p tests/helpers
    ln -sf /usr/lib/bats/bats-assert tests/helpers/bats-assert
    ln -sf /usr/lib/bats/bats-support tests/helpers/bats-support

    bats tests/vet.bats
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
