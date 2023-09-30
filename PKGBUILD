# Maintainer: Jef Roosens
# Contributor: Logan Magee <mageelog@gmail.com>

# Commit hashes for the latest release in the v & vc repositories
# Using the direct downloads for the commits greatly reduces the time needed to
# pull down the sources, as the vlang repository is >100MB.
_v_commit_sha=5b1b2cc7c016290100a0169124200a8fc4a81551
_vc_commit_sha=5b77beb2ecbcd35d5a4dc872aaa719b7cf85d182

pkgname=vlang
pkgver=0.4.2
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
sha256sums=('9eb75f24d0abc58ed98c948623a2d620fff0c6204f2e00d6fd57750198eaecf6'
            'ccda20ceabfcd5b02224ef60f42d573d5cd31f07538b77b841a3151d56fffed8')
sha512sums=('304a6fa7b9e6e59ff469dd9e5254830f60a0cb8f6b9ecfa328f7ff3202abb3df3ae9b5a3524116224e49e77aa44a07e8f2e91264df0f5fbfc0bb1ba6c9ea520f'
            '99c7d5fd696022b9f911738ca510edf4c6c7226b3da0e4bbf97d8cd1c89d8acdd658834efd1a30fad9c5c84063f932bf5d86236f906928cee42e759f06504484')

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
