pkgname="bash-get"
pkgver=6.bea7aaf
pkgrel=1
pkgdesc="go get inspired bash get tool"
url="https://github.com/reconquest/bash-get"
arch=('any')
license=('GPL')
makedepends=()
source=("bash-get::git+ssh://github.com/reconquest/bash-get.git")
md5sums=(SKIP)

pkgver() {
    cd "${pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "${pkgname}"

    git submodule update --init --recursive
}

check() {
    cd "${pkgname}"
    ./run_tests.sh -A
}

strip() {
    cd "${pkgname}"
}

package() {
    install -DTm 0777 "$srcdir/$pkgname/get" "$pkgdir/usr/lib/bash-get/get"
    cp -r "$srcdir/$pkgname/vendor" "$pkgdir/usr/lib/bash-get/"

    install -d "$pkgdir/usr/bin"
    ln -fs /usr/lib/bash-get/get "$pkgdir/usr/bin/get"

    find "$pkgdir" -wholename "*tests*" -type f -delete
    find "$pkgdir" -wholename "*.git*" -type f -delete
    find "$pkgdir" -type d -empty -delete
}
