# Maintainer: Jon Nordby <jononor@gmail.com>
_pkgname=visqol
pkgname="$_pkgname-git"
pkgver=r8.30abce1
pkgrel=2
epoch=
pkgdesc="ViSQOL (Virtual Speech Quality Objective Listener) is an objective, full-reference metric for perceived audio quality"
arch=('x86_64')
url="https://github.com/google/visqol"
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=()
makedepends=('git' 'bazel')
install=
source=("$_pkgname"::"git+https://github.com/google/visqol.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
    bazel build :visqol -c opt
}

package() {
	cd "$_pkgname"

    install -d "$pkgdir/usr/bin"
    install -t "$pkgdir/usr/bin" bazel-bin/visqol 

    install -d "$pkgdir/usr/share/visqol/model"
    install -t "$pkgdir/usr/share/visqol/model" model/*
}
