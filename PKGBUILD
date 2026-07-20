# Maintainer: vielfrass
# Maintainer: Jef Roosens
# Maintainer: WeeXnes <weexnes@weexnes.dev>
# Contributor: Logan Magee <mageelog@gmail.com>

# Commit hashes for the latest release in the v & vc repositories
# Using the direct downloads for the commits greatly reduces the time needed to
# pull down the sources, as the vlang repository is >100MB.
_v_commit_sha=7647ce1c6fad63b5578bc07883139906de74b2f8
_vc_commit_sha=7eb8c54a3843e5107d5af06d7a8c3e928f322475

pkgname=vlang
pkgver=0.5.2
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software'
arch=('x86_64' 'aarch64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
optdepends=('glfw: Needed for graphics support'
            'freetype2: Needed for graphics support'
            'openssl: Needed for http support')
makedepends=('git' 'libx11')
conflicts=('v')
source=("v-${pkgver}.zip::https://github.com/vlang/v/archive/${_v_commit_sha}.zip"
        "vc-${pkgver}.zip::https://github.com/vlang/vc/archive/${_vc_commit_sha}.zip")
sha256sums=('0bfb3dbcbc2e45063a87e9703d6e6678c4698361ac8aa09b9d864ae5cfe6c7e0'
            '2d6c1e8f8b90328043994bb1dfdf91185b4dd8c3b70867da942051b1c2c6088a')
sha512sums=('1cc2511e659da25077a675facaaaae4b649202f3ec4f2232e6531766c270bcc7d016a326e69a7ca4c32d7c4b74a320115eaa7081f80dfe7ca9713ab326e04d28'
            'aabee9886e1b4a490d2717717f59d78a4ccb388e411093277701ba548fc4fb5b9dd745271f739d7bf90ca161d720636ee44b3bdfe527df9020af6c0db7fcad6e')
prepare() {
    # In case the previous directory still exists
    rm -rf "v-${_v_commit_sha}/vc"

    mv "vc-${_vc_commit_sha}" "v-${_v_commit_sha}/vc"

    # We have to set local=1 because we manually download a specific vc
    # version. This flag also disables downloading tcc, so we do that
    # beforehand.
    make -C "v-${_v_commit_sha}" fresh_tcc
}

build() {
    cd "v-${_v_commit_sha}"

    local tmpdir="/tmp/${pkgname}-${_v_commit_sha}"
    mkdir -p "$tmpdir" || { echo "Can't create temporary directory!"; exit 1; }

    # Delete directory when exiting function (even if there is an error)
    trap 'rm -rf "$tmpdir"' RETURN

    # Redefining HOME and TMPDIR for Isolation
    export HOME="$tmpdir"
    export TMPDIR="$tmpdir"
    CFLAGS="" LDFLAGS="" make prod=1 local=1

    # Compile all tools
    LDFLAGS='' ./v build-tools
}

package() {
    cd "v-${_v_commit_sha}"

    install -d "${pkgdir}/usr/lib/vlang" "${pkgdir}/usr/share/vlang" "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 v "${pkgdir}/usr/lib/vlang"
    cp -a cmd "${pkgdir}/usr/lib/vlang/"
    cp -a examples "${pkgdir}/usr/share/vlang/"
    cp -a thirdparty "${pkgdir}/usr/lib/vlang/"
    cp -a vlib "${pkgdir}/usr/lib/vlang/"
    cp v.mod "${pkgdir}/usr/lib/vlang/"
    ln -s /usr/lib/vlang/v "${pkgdir}/usr/bin/v"

    touch "${pkgdir}/usr/lib/vlang/cmd/tools/.disable_autorecompilation"
}

# vim: ft=bash
