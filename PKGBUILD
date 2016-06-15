pkgdesc='App Container Server (blablacar fork)'
pkgname=acserver-blablacar
pkgver=0.1
pkgrel=2
url="https://github.com/blablacar/acserver"
source=(
    "git+$url.git"
    "$pkgname.service"
)
md5sums=(
    'SKIP'
    'SKIP'
)
makedepends=('git' 'go')
license=('Apache')
arch=('i686' 'x86_64')

# 1.
prepare() {
    local base=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
    local repo="$srcdir/acserver" # working repo location
    local target=$([[ $pkgver == "0.0" ]] && printf "master" || printf "$pkgver")
    git -C "$repo" checkout --quiet "$target" # checkout proper version
    git -C "$repo" status # verify working repo change
}

# 2.
build() {
    cd acserver
    ./build.sh
}

# 3.
check() {
    true
}

# 4.
package() {
    install -D -m644 $pkgname.service   "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    cd acserver
    install -D -m755 bin/acserver       "$pkgdir/usr/bin/$pkgname"
    install -d -m755                    "$pkgdir/var/aci/store"
}
