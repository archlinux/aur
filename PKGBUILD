# Maintainer: taotieren <admin@taotieren.com>

pkgname=tiny-json-git
pkgver=r82.025cdde
pkgrel=2
pkgdesc="The tiny-json is a versatile and easy to use json parser in C suitable for embedded systems. It is fast, robust and portable. "
arch=(any)
url="https://github.com/rafagafe/tiny-json"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    'glibc')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    cd test
    make
}

check() {
    cd "${srcdir}/${pkgname}"
    cd test
    make test
}

package() {
    install -Dm0644 "${srcdir}/${pkgname}/${pkgname%-git}.c" -t "${pkgdir}/usr/include/${pkgname%-git}/"
    install -Dm0644 "${srcdir}/${pkgname}/${pkgname%-git}.h" -t "${pkgdir}/usr/include/${pkgname%-git}/"
}
