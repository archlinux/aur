# Maintainer: Kirill I <elephanttalk+aur [at] protonmail _dot_ com>

pkgname='tetronimia'
pkgdesc='That game of falling blocky thingies for your terminal, written in Nim'
pkgver=0.2.1
pkgrel=1
arch=('x86_64' 'i686' 'i486' 'aarch64' 'armv7h')
url='https://github.com/indiscipline/tetronimia'
license=('GPL3')
makedepends=('nim' 'nimble' 'coreutils')
options=(strip)
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6fc8aab8448b01ca33e21fb0e32dd1496a5bef4ea59bb29a8c9f5b980728b70826d4137bffaa43c8b01c0e4980558df1e019762a2903a0dd0e1ef2c3cd5f93f4')
b2sums=('8e31f2c72784c56d731e14069ae2b10d4bcd0637a24933cc18073d61773f8f188c066aeb4c318e283da16bf5d5a61055bcdef5412d3a07f776837fd068a17a5d')

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
