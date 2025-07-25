# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>

pkgname=vet
pkgver=1.0.1
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
b2sums=('5c2a711f4744915053714cd941b82cfd94efcf0363d029a067b267f8254dc0423cfbd73ec742b1ca76889f70f21852dc42116182433d709bacd723b2aaaed1c1')

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
