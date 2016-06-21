pkgdesc='App Container Server'
pkgname=acserver
pkgver=0.1.0
pkgrel=2
url="https://github.com/appc/$pkgname"
source=(
    "git+$url.git"
    "$pkgname.service"
)
md5sums=(
    'SKIP'
    'SKIP'
)
makedepends=('git' 'go')
options=('!strip')
arch=('i686' 'x86_64')
license=('Apache')

# 1.
prepare() {
    local base=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
    local repo="$srcdir/$pkgname" # working repo location
    local target=$([[ $pkgver == "0.0.0" ]] && printf "master" || printf "v$pkgver")
    git -C "$repo" checkout --quiet "$target" # checkout proper version
    git -C "$repo" status # verify working repo change
}

# 2.
build() {
    cd $pkgname
    ./build
}

# 3.
check() {
    true
}

# 4.
package() {
    install -D -m644 $pkgname.service     "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    cd "$pkgname"
    install -D -m755 bin/$pkgname         "$pkgdir/usr/bin/$pkgname"
    install -d -m755                      "$pkgdir/var/aci/store"
    install -D -m644 templates/index.html "$pkgdir/var/aci/templates/index.html"
}
