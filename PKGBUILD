# Maintainer: Jef Roosens
# Contributor: Logan Magee <mageelog@gmail.com>

# Commit hashes for the latest release in the v & vc repositories
# Using the direct downloads for the commits greatly reduces the time needed to
# pull down the sources, as the vlang repository is >100MB.
_v_commit_sha=ac2dcc2bc0150f9a11a7078d4da04a4be2e8e0d3
_vc_commit_sha=66eb8eae253d31fa5622e35a69580d9ad8efcccb

pkgname=vlang
pkgver=0.4.4
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software'
arch=('x86_64' 'aarch64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
optdepends=('glfw: Needed for graphics support'
            'freetype2: Needed for graphics support'
            'openssl: Needed for http support')
makedepends=('git')
conflicts=('v')
source=("v-${pkgver}.zip::https://github.com/vlang/v/archive/${_v_commit_sha}.zip"
        "vc-${pkgver}.zip::https://github.com/vlang/vc/archive/${_vc_commit_sha}.zip")
sha256sums=('7a99c8bf2b169c13b3caef136ccd199cba92a872bd95a26000d09ff4babf638a'
            '99707b29e53343f96d9cbe7742c48fb85bb53372bba265794870bfbad8ce4ad4')
sha512sums=('4a5d2540a4da3def4665b2adb8f0b4b48d47087ad2942aa7639a40b51f363a13c6191f11f2aab5ac3c123cabbe62d7924fe83e26453a0867bf69772e22a645b3'
            'a7aff8b8a38e89c7b64a9b685d8df5e1159cb0ef03c1592ed9e6b3d02886050d443ce90d557562cca14907953bce66ff5d4cb326103bc1cfaaf8036409568d64')

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
