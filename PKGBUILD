# Maintainer: vielfrass
# Maintainer: Jef Roosens
# Contributor: Logan Magee <mageelog@gmail.com>

# Commit hashes for the latest release in the v & vc repositories
# Using the direct downloads for the commits greatly reduces the time needed to
# pull down the sources, as the vlang repository is >100MB.
_v_commit_sha=b9e5757236a948c71cdac5ba913a9d42f1349963
_vc_commit_sha=30f2d6ee52d8e1e7f5653454262bf32f297607da

pkgname=vlang
pkgver=0.4.11
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
sha256sums=('5a496eafa7879f77d19dd133ca4c16350e7be347a67ee580637a4e9df1bba824'
            '5fd1d28f5fadb4a2b0cc2b5a7d3bf50e814b11a5e4977428aff5ee5a0c7d64db')
sha512sums=('7622cc8a5dda3ca904458b5b2e8538011557d74cfc6f1d0ee7c28732969ad86c97763578fa310e0487f37973879acaa5b160106683c3320c0a79d7f775c48fc4'
            '97efb44ca666e0b51ca793b7ca2fa81f103c3952a2b008868ffdd49f68a4f118ebad9b30cc00310f21cc6ab91934726bd5742c81e9e5cf6cd2efb9c9fd4f1af3')

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
