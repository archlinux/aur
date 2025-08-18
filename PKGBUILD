# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=vet-git
_name=${pkgname%-git}
pkgver=1.0.2.r0.g3a49e66
pkgrel=1
pkgdesc='A command-line tool that acts as a safety net for the risky curl pipe to bash pattern'
arch=('any')
url="https://getvet.sh"
license=('MIT')
depends=('bash' 'coreutils' 'curl' 'diffutils' 'less')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
checkdepends=('bats' 'bats-assert' 'bats-support')
optdepends=(
    'bat: syntax-highlighting pager for script review'
    'shellcheck: for linting downloaded scripts'
)
source=(
    "git+https://github.com/vet-run/$_name"
    "git+https://github.com/bats-core/bats-assert"
    "git+https://github.com/bats-core/bats-support"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd $_name
    git submodule init
    git config submodule.tests/helpers/bats-assert.url "$srcdir/bats-assert"
    git config submodule.tests/helpers/bats-support.url "$srcdir/bats-support"
    git -c protocol.file.allow=always submodule update --init
}

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

check() {
    cd $_name
    bats tests/vet.bats
}

package() {
    cd $_name
    install -Dm755 $_name "$pkgdir/usr/bin/$_name"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
