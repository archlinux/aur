# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=vet-git
pkgver=1.0.2.r0.g3a49e66
pkgrel=1
pkgdesc='A command-line tool that acts as a safety net for the risky curl pipe to bash pattern'
arch=('any')
url="https://getvet.sh"
license=('MIT')
depends=('bash' 'coreutils' 'curl' 'diffutils' 'less')
makedepends=('git')
provides=('vet')
conflicts=('vet')
checkdepends=('bats' 'bats-assert' 'bats-support')
optdepends=(
    'bat: syntax-highlighting pager for script review'
    'shellcheck: for linting downloaded scripts'
)
source=("git+https://github.com/vet-run/vet"
        "git+https://github.com/bats-core/bats-assert"
        "git+https://github.com/bats-core/bats-support")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd vet
    git submodule init
    git config submodule.tests/helpers/bats-assert.url "$srcdir/bats-assert"
    git config submodule.tests/helpers/bats-support.url "$srcdir/bats-support"
    git -c protocol.file.allow=always submodule update --init
}

pkgver() {
    cd vet
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

check() {
    cd vet
    bats tests/vet.bats
}

package() {
    cd vet
    install -Dm755 vet -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
