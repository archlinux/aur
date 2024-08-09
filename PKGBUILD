# Maintainer: Kirill I <elephanttalk+aur [at] protonmail _dot_ com>

pkgname='tetronimia'
pkgdesc='That game of falling blocky thingies for your terminal, written in Nim'
pkgver=0.3.0
pkgrel=1
arch=('x86_64' 'i686' 'i486' 'aarch64' 'armv7h')
url='https://github.com/indiscipline/tetronimia'
license=('GPL-3.0-or-later')
makedepends=('nim' 'coreutils' 'git')
options=(strip)
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e8af5f1d9ca4953e7f54723eeef7e602c816d0326af3b997166bb713b5b837830a9d799a2bd39a6025698775ce0c7219b8e31cb1a74f76832ed7d8e995069824')
b2sums=('1e95943be38be04c736d7262149fef32694dc1b76b8f036f2077d3aac791e6053b05cb9f22c4517924cbb575be2348c6fc1fb86c11e5d560ab41bc71a0a99200')

build() {

    function cleanup() {
        rm -rf "$1"
        echo "• Temporary Nimble directory '$1' removed"
    }

    cd "$srcdir/$pkgname-$pkgver" || exit
    echo "• Creating temporary Nimble directory..."
    local _nimbleTemp
    _nimbleTemp=$(mktemp -d --suffix=tetronimia)
    trap "cleanup '$_nimbleTemp'" ERR EXIT

    echo "• Verifying dependencies and building..."
    # uses included `config.nims` for additional build flags
    nimble -y build -d:release --nimbleDir="$_nimbleTemp"
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit
    echo "• Installing..."
    install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
