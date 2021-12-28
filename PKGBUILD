# Maintainer: Oliver Breitwieser <oliver@breitwieser.eu>

_pkgname=asfa
pkgname=${_pkgname}-git
pkgver=0.9.1.r0.g3f45cac
pkgrel=1
pkgdesc='share files by upload via ssh and generation of a non-guessable link'
arch=('x86_64')
url="https://github.com/obreitwi/asfa"
license=('MIT')
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('rust' 'help2man' 'findutils' 'gzip' 'git' 'gawk')
provides=('asfa')
conflicts=('asfa')
source=("git+https://github.com/obreitwi/asfa.git")
md5sums=('SKIP')

pkgver() {
    local _oldpwd
    _oldpwd="$PWD"
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
    cd $_oldpwd
}

# version string that is accepted by cargo
_cargo_version() {
    local _oldpwd
    _oldpwd="$PWD"
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/\([^-]*\)-\([^-]*\)$/\1.\2/')"
    cd $_oldpwd
}

# Ensure that the asfa binary contains the (almost) same git-based version
# information as the installed package.
# Only difference: dash after minor version.
_ensure_version_information() {
    local _version
    _version="$(_cargo_version)"
    cd "$srcdir/$_pkgname"
    sed -i "s/^version = .*\$/version = \"${_version}\"/" Cargo.toml
    # Replace the new verison in Cargo.lock but keep all other version info
    awk -v "_version=${_version}" \
        -e '$1 == "name" { name = $3 }' \
        -e '$1 == "version" && name == "\"asfa\"" { $3 = sprintf("\"%s\"", _version)}' \
        -e '{ print }' Cargo.lock > Cargo.lock.update
    mv Cargo.lock Cargo.lock.orig
    mv Cargo.lock.update Cargo.lock
}

build() {
    _ensure_version_information
    local _version
    _version="$(_cargo_version)"
    cd "$srcdir/$_pkgname"
    RUSTFLAGS="-Ctarget-cpu=x86-64 -lssh2" cargo build --locked --release --target-dir=target
    local _folder_bin
    _path_bin="target/release/${_pkgname}"
    local _folder_man
    _folder_man=target/release/man
    mkdir -p ${_folder_man}/man1
    help2man -o ${_folder_man}/man1/${_pkgname}.1 "${_path_bin}" 
    # Generate info about all subcommands except for 'help' (which leads to error)
    "${_path_bin}" --help | awk 'enabled && $1 != "help" { print $1 } /^SUBCOMMANDS:$/ { enabled=1 }' \
    | while read -r cmd; do
        help2man "--version-string=${_version}" \
            -o "${_folder_man}/man1/${_pkgname}-${cmd}.1" \
            "$_path_bin $cmd" 
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

