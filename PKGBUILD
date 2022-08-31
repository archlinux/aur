# Maintainer: Jef Roosens
# Contributor: Logan Magee <mageelog@gmail.com>

# Commit hashes for the latest release in the v & vc repositories
# Using the direct downloads for the commits greatly reduces the time needed to
# pull down the sources, as the vlang repository is >100MB.
_v_commit_sha=f2f6ea596966ca405bd1be34b3bf3539b0c18fb7
_vc_commit_sha=119e6752e94814715dbb926d438027a848d5be2c

pkgname=vlang
pkgver=0.3.1
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
sha256sums=('0c955aaa3e3f21e8934e6af9e382768780c4b594aea135793d94b432c4636863'
            'ed77d6a712698a786dcdea5ade6cd4a65bf40bb0cfedd357e15e69cbddbf1c3e')
sha512sums=('5cec9d180f143900b8d8c94005eada1c09eb1e7fa81479dca42ec8b667efb95d9dd8a9b4e33b05b9ff6bd4b21652795e576b83f4bb22d08f4be1cd2772d3cd7b'
            '4ac8881301bb749e5df392af996e71e7b045925a270a8fe81dfdb6a850351900b92391bb40efdb1419e81cfb7087f3782d0e7bd210215d44346535156158501f')

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
