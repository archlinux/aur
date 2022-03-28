# Maintainer: Kirill I <elephanttalk+aur [at] protonmail _dot_ com>

pkgname='tetronimia'
pkgdesc='That game of falling blocky thingies for your terminal, written in Nim'
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'i686' 'i486' 'aarch64' 'armv7h')
url='https://github.com/indiscipline/tetronimia'
license=('GPL3')
makedepends=('nim' 'nimble' 'coreutils')
options=(strip)
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5660c447d2ca6dab6a54a2de1c97717d24b12193b69169c8f29b72e3e89fc105951ed2f711dcb865f262b8aac9298dd66c98f45908903fdbaf0872ec9cbd8d02')
b2sums=('bb10883ab10511ce7baf32ae458f271d056faa0dfa5ca12c6f7e5942819899e42a16f052105f82aecbf11976ee31763de46a26de1d3564b62634a92f0cce0659')

build() {

    function cleanup() {
        rm -rf "$1"
        echo "• Temporary Nimble directory '$1' removed"
    }

    cd "$srcdir/$pkgname-$pkgver"
    echo "• Creating temporary Nimble directory..."
    local _nimbleTemp=$(mktemp -d --suffix=tetronimia)
    trap "cleanup '$_nimbleTemp'" ERR EXIT

    echo "• Verifying dependencies and building..."
    # uses included `config.nims` for additional build flags
    nimble -y build -d:release --nimbleDir="$_nimbleTemp"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    echo "• Installing..."
    install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
