# Maintainer: Oliver Breitwieser <oliver@breitwieser.eu>

pkgname=asfa
pkgver=0.9.0
pkgrel=1
pkgdesc='share files by upload via ssh and generation of a non-guessable link'
arch=('x86_64')
url="https://github.com/obreitwi/asfa"
license=('MIT')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('rust' 'help2man' 'findutils' 'gzip' 'git')
source=()
md5sums=()

build() {
    cargo install --no-track --target-dir target --root target --version ${pkgver} --force ${pkgname}
    local _folder_bin
    _path_bin="target/bin/${pkgname}"
    local _folder_man
    _folder_man=target/release/man
    mkdir -p ${_folder_man}/man1
    help2man "${_path_bin}" > ${_folder_man}/man1/${pkgname}.1
    for cmd in clean list push verify; do
        help2man "'$_path_bin' $cmd" > ${_folder_man}/man1/${pkgname}-${cmd}.1
    done
}

package() {
    install -Dm755 "target/bin/$pkgname" \
        -t "$pkgdir/usr/bin"
    find target/release/man/man1 -type f -print0 \
        | xargs -0 install -Dm644 -t "$pkgdir/usr/share/man/man1"
    find "$pkgdir/usr/share/man/man1" -type f -print0 | xargs -0 gzip
}

