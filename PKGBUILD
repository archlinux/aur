# Maintainer: Tobias Frilling <aur@ckafi.addy.io>

# shellcheck shell=bash
pkgname=zig-master-bin
pkgver=0.16.0_dev.238.g580b6d1fa
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software (master release)"
arch=('aarch64' 'armv7h' 'i686' 'powerpc64le' 'riscv64' 'x86_64')
url="https://ziglang.org/"
license=('MIT')
provides=('zig' 'zig-master')
conflicts=('zig')
replaces=('zig-nightly-bin')
makedepends=('curl' 'jq' 'minisign')
options=('!strip')

case "${CARCH}" in
    'aarch64'     ) _arch='aarch64';;
    'armv7h'      ) _arch='arm';;
    'i686'        ) _arch='x86';;
    'powerpc64le' ) _arch='powerpc64le';;
    'riscv64'     ) _arch='riscv64';;
    'x86_64'      ) _arch='x86_64';;
    *             ) echo "Unsupported architecture: ${CARCH}"; return 1;;
esac

_index_json=$(curl -s "${url}/download/index.json")
_master_version=$(jq -r '.master.version' <<< "${_index_json}")
_tarball_url=$(jq -r ".master.\"${_arch}-linux\".tarball" <<< "${_index_json}")
_tarball_sha256=$(jq -r ".master.\"${_arch}-linux\".shasum" <<< "${_index_json}")
_tarball=$(basename "${_tarball_url}")

pkgver() {
    sed 's/-/_/g; s/+/.g/g' <<< "${_master_version}"
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
