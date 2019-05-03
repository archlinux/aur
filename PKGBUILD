# Maintainer: leetking <li_tking@163.com>

pkgname=intercept-git
_pkgname=intercept
pkgver=1.0.0.r9.g185c3b8
pkgrel=2
pkgdesc="An auxiliary tool for tcpcopy and tcpburn."
arch=('x86_64')
url="https://github.com/session-replay-tools/intercept.git"
license=('BSD')
depends=('libpcap')
makedepends=('git')
provides=($_pkgname)
options=('strip')
source=("$_pkgname::git+$url"
        "fix-log-path.patch")
sha256sums=('SKIP'
        'dd127920ffe56ea944ca048fe66ed1d75023ba66c0f5a316e3a2f0b3bcd4ab45')

pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}


prepare() {
    cd "$_pkgname"
    git apply "$srcdir/fix-log-path.patch"
}

build() {
    cd "$_pkgname"
    ./configure \
        --prefix=/usr \
        --conf-path=/etc/$pkgname/$_pkgname.conf \
        --sbin-path=/usr/bin/$_pkgname \
        --pid-path=/run/$pkgname/$_pkgname.pid \
        --error-log-path=/var/log/$_pkgname.log
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install

    # remove empty directories
    rm -rf "$pkgdir/var" "$pkgdir/run" "$pkgdir/etc"

    # install license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
