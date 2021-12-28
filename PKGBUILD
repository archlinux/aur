# Maintainer: Oliver Breitwieser <oliver@breitwieser.eu>

pkgname=asfa
pkgver=0.9.1
pkgrel=1
pkgdesc='share files by upload via ssh and generation of a non-guessable link'
arch=('x86_64')
url="https://github.com/obreitwi/asfa"
license=('MIT')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('rust' 'help2man' 'findutils' 'gzip' 'git' 'gawk')
source=()
md5sums=()

build() {
    RUSTFLAGS="-Ctarget-cpu=x86-64 -lssh2" cargo install --no-track --target-dir target --root target --version ${pkgver} --force ${pkgname}
    local _folder_bin
    _path_bin="target/bin/${pkgname}"
    local _folder_man
    _folder_man=target/release/man
    mkdir -p ${_folder_man}/man1
    help2man -o "${_folder_man}/man1/${pkgname}.1" "${_path_bin}" 
    # Generate info about all subcommands except for 'help' (which leads to error)
    "${_path_bin}" --help | awk 'enabled && $1 != "help" { print $1 } /^SUBCOMMANDS:$/ { enabled=1 }' \
    | while read -r cmd; do
        help2man "--version-string=${pkgver}" \
            -o "${_folder_man}/man1/${pkgname}-${cmd}.1" \
            "$_path_bin $cmd" 
    done
}

package() {
    install -Dm755 "target/bin/$pkgname" \
        -t "$pkgdir/usr/bin"
    find target/release/man/man1 -type f -print0 \
        | xargs -0 install -Dm644 -t "$pkgdir/usr/share/man/man1"
    find "$pkgdir/usr/share/man/man1" -type f -print0 | xargs -0 gzip
}

