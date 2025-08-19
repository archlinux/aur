# Maintainer: Tobias Frilling <aur@ckafi.addy.io>

# shellcheck shell=bash
pkgname=zig-master-bin
pkgver=0.15.0_dev.1572.g47e652876
pkgver=0.15.1
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software (master release)"
arch=('x86_64' 'arm' 'aarch64' 'riscv64')
url="https://ziglang.org/"
license=('MIT')
provides=('zig' 'zig-master')
conflicts=('zig')
makedepends=('curl' 'jq' 'minisign')
options=('!strip')

_index_json=$(curl -s "${url}/download/index.json")
_master_version=$(echo "${_index_json}" | jq -r '.master.version')
_tarball_url=$(echo "${_index_json}" | jq -r ".master.\"${CARCH}-linux\".tarball")
_tarball_sha256=$(echo "${_index_json}" | jq -r ".master.\"${CARCH}-linux\".shasum")
_tarball=$(basename "${_tarball_url}")

pkgver() {
    echo "${_master_version}" | sed 's/-/_/g; s/+/.g/g'
}

source=("${_tarball_url}" "${_tarball_url}.minisig")
sha256sums=("${_tarball_sha256}" "SKIP")

verify() {
    minisign -q -V \
        -P "RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U" \
        -m "${_tarball}"
}

package() {
    cd "${srcdir}/${_tarball%.tar.*}" || return

    install -dm755 "${pkgdir}/usr/lib/zig"
    cp -a ./* "${pkgdir}/usr/lib/zig/"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/lib/zig/zig "${pkgdir}/usr/bin/zig"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
