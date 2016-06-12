pkgdesc='App Container Server Push Command'
pkgname=acpush
pkgver=0.0.0 # TODO pending release
pkgrel=3
url="https://github.com/appc/$pkgname"
source=("git+${url}.git")
makedepends=('git' 'go')
arch=('i686' 'x86_64')
md5sums=('SKIP')
license=('Apache')

# 1.
prepare() { # TODO pending release
    local base=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
    local repo="$srcdir/$pkgname" # working repo location
    local target=$([[ $pkgver == "0.0.0" ]] && printf "master" || printf "v$pkgver")
    git -C "$repo" checkout --quiet "$target" # checkout proper version
    git -C "$repo" status # verify working repo change
    cp -f $base/build.sh $repo/build # TODO this file is to come from upstream
    patch -d "$repo" -p0 < "$base/lib.go.patch"
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
    cd "$pkgname"
    install -D -m755 "./bin/acpush" "$pkgdir/usr/bin/acpush"
}
