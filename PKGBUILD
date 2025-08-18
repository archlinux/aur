# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=vet
pkgver=1.0.2
pkgrel=1
pkgdesc='A command-line tool that acts as a safety net for the risky curl pipe to bash pattern'
arch=('any')
url="https://getvet.sh/"
license=('MIT')
depends=('bash' 'coreutils' 'curl' 'diffutils' 'less')
checkdepends=('bats' 'bats-assert' 'bats-support')
optdepends=(
    'bat: syntax-highlighting pager for script review'
    'shellcheck: for linting downloaded scripts'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/vet-run/vet/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=('ab59591183233125fc9f3db2c39a79d0f7df2972543765f44fc2c04fc84caaab350e4872ac1e90bf5adadfcfb004d3aea5acf56e5d91ebfc049ec24e01d8420e')

check() {
    cd $pkgname-$pkgver

    # Use system bats helpers (normally git submodules, not present in release tarball)
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
