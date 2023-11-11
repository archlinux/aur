# Maintainer: Andreas Kurth <archlinux@akurth.net>
pkgname='verible-git'
pkgver=0.0.r558.7fbda6835f
pkgrel=2
pkgdesc="SystemVerilog parser, style-linter, and formatter"
arch=('x86_64')
url="https://github.com/google/${pkgname%-git}"
license=('Apache')
depends=('bash')
makedepends=('bazel'
             'git'
             'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')
# upstream does not sign commits (yet?)

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    local _tagver=$(git describe --long --tags HEAD | sed 's/^v//;s/-.*//')
    # upstream revision counts start at zero, keep aligned
    local _gitrev=$(( $(git rev-list --count HEAD) - 1))
    local _githash=$(git rev-parse --short HEAD)
    printf "%s.r%s.%s" $_tagver $_gitrev $_githash
}

build() {
    cd "$srcdir/${pkgname%-git}"
    bazel build -c opt //...
}

check() {
    cd "$srcdir/${pkgname%-git}"
    bazel test //...
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -d "$pkgdir/usr/bin"
    bazel run :install -c opt -- "$pkgdir/usr/bin"
}
