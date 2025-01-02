# Maintainer: Jef Roosens
# Contributor: Logan Magee <mageelog@gmail.com>

# Commit hashes for the latest release in the v & vc repositories
# Using the direct downloads for the commits greatly reduces the time needed to
# pull down the sources, as the vlang repository is >100MB.
_v_commit_sha=39534459885e916e2765b5b0c0ed66ce15f0ab86
_vc_commit_sha=27942c7ab5a12b9253eb69eaf3a58699bcdd5189

pkgname=vlang
pkgver=0.4.9
pkgrel=2
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
sha256sums=('38724bbd04474f4fa384e4e985b39703cc49922b5db33cf2e5cbb11181c1610f'
            'bd2c0515a81e71f511ed62ce9ae90378c368d236bee086262fb10b7366cf85fa')
sha512sums=('cead2aa73b9976041d368739c38cdb900f187adb7fed8470182caca3bb41da0f9dddbf2a40c24ac8b071a30c2db151fcd09ec0287867c129959b6c85a9c65d97'
            'af8aa7280e93010f10966e99be7879e26afdf7a54ae5013f171953be941357f68b1142a01d11d6d156547f454e7c1e03e0e13fab6121aeb12ed27dcb8371a480')

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
