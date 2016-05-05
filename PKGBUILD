pkgname="bash-get-git"
pkgver=12.9bee7b8
pkgrel=1
pkgdesc="go get inspired bash get tool"
url="https://github.com/reconquest/bash-get"
arch=('any')
license=('GPL')
makedepends=()
source=("bash-get::git://github.com/reconquest/bash-get.git")
md5sums=(SKIP)

pkgver() {
    cd "${pkgname%%-git}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "${pkgname%%-git}"

    git submodule update --init --recursive
}

package() {
    install -DTm 0777 "$srcdir/${pkgname%%-git}/get" "$pkgdir/usr/lib/bash-get/get"
    cp -r "$srcdir/${pkgname%%-git}/vendor" "$pkgdir/usr/lib/bash-get/"

    install -d "$pkgdir/usr/bin"
    ln -fs /usr/lib/bash-get/get "$pkgdir/usr/bin/get"

    find "$pkgdir" -wholename "*tests*" -type f -delete
    find "$pkgdir" -wholename "*.git*" -type f -delete
    find "$pkgdir" -type d -empty -delete
}
