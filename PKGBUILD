# Maintainer: Oliver Breitwieser <oliver@breitwieser.eu>

_pkgname=asfa
pkgname=${_pkgname}-git
pkgver=0.7.4.r2.g0eb6081
pkgrel=1
pkgdesc='share files by upload via ssh and generation of a non-guessable link'
arch=('x86_64')
url="https://github.com/obreitwi/asfa"
license=('MIT')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('rust' 'help2man' 'findutils' 'gzip' 'git')
provides=('asfa')
conflicts=('asfa')
source=("git+https://github.com/obreitwi/asfa.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd $_pkgname
    cargo build --locked --release --target-dir=target
    local _folder_bin
    _path_bin="target/release/${_pkgname}"
    local _folder_man
    _folder_man=target/release/man
    mkdir -p ${_folder_man}/man1
    help2man "${_path_bin}" > ${_folder_man}/man1/${_pkgname}.1
    for cmd in clean list push verify; do
        help2man "'$_path_bin' $cmd" > ${_folder_man}/man1/${_pkgname}-${cmd}.1
    done
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-MIT \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    find target/release/man/man1 -type f -print0 \
        | xargs -0 install -Dm644 -t "$pkgdir/usr/share/man/man1"
    find "$pkgdir/usr/share/man/man1" -type f -print0 | xargs -0 gzip
}

