# Maintainer: vielfrass
# Maintainer: Jef Roosens
# Maintainer: WeeXnes <weexnes@weexnes.dev>
# Contributor: Logan Magee <mageelog@gmail.com>

# Commit hashes for the latest release in the v & vc repositories
# Using the direct downloads for the commits greatly reduces the time needed to
# pull down the sources, as the vlang repository is >100MB.
_v_commit_sha=0c3183c55b39534f9bb0d2f796bb575d39c9d229
_vc_commit_sha=f461dfebcdfac3c75fdf28fec80c07f0a7a9a53d

pkgname=vlang
pkgver=0.5.1
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
sha256sums=('9f2a5bcad2f2053335d25b0dc4f57a096d6370d5669526c657a7959270181082'
            'a6e58504ae55b4fc11a42317f47734daf35631b1eb1b0c03f906fc26ac448f53')
sha512sums=('85caac911aeb849f15f0efbe61228bb60af33a9b51a6da54e992ee8e1bb5db67e343980ad916ee75b08d56399bafa3b98a1ada7ee7a11a3de5c4f6dd97a7332a'
            'd23ecc68f054e5182155b4d854ec9e817d9d8152aec19dd1636e7852ae4701d4f28be45d2a5ac96a61463eaf9d0cb6c01c5b72b7f7b2c097bce7722cbf838f47')
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
