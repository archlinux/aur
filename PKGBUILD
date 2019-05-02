# Maintainer: leetking <li_tking@163.com>
pkgname=tcpcopy-git
_pkgname=tcpcopy
pkgver=v1.2.0.r4.g4aebb48
pkgrel=1
pkgdesc="TCPCopy is a TCP stream replay tool to support real testing of Internet server applications."
arch=(x86_64)
url="https://github.com/session-replay-tools/tcpcopy.git"
license=('BSD')
makedepends=('git')
provides=($_pkgname)
options=('strip')
source=("$_pkgname::git+$url"
        "fix-error-log-path.patch")
sha256sums=('SKIP'
        '5d744d1fd93a46c111f7731882e06a982ed32611c15af2080c8a9fb7fc15d054')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
    git describe --tags --long 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$_pkgname"
    git apply "$srcdir/fix-error-log-path.patch"
}

build() {
    cd "$_pkgname"
    ./configure \
        --prefix=/usr \
        --conf-path=/etc/$_pkgname/$_pkgname.conf \
        --sbin-path=/usr/bin/$_pkgname \
        --pid-path=/run/$_pkgname/$_pkgname.pid \
        --error-log-path=/var/log/$_pkgname.log
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install

    # install license
    mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
    cp LICENSE "$pkgdir/usr/share/licenses/$_pkgname"
}
