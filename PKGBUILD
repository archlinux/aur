# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
# Maintainer: Dan Fuhry <dan@fuhry.com>

pkgname=('teleport' 'teleport-client')
_pkgname=teleport
pkgver=11.2.2
pkgrel=2
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=('glibc')
makedepends=('go>=1.17.0' 'rust')
provides=('tctl' 'tsh')

_webassets_ref=8553f8c11de7932b9c347514820f7c95402471d2

_go_srcpath="go/src/github.com/gravitational"

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gravitational/teleport/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}-webassets-${_webassets_ref}.tar.gz::https://github.com/gravitational/webassets/archive/${_webassets_ref}.tar.gz"
        "teleport.service"
        "teleport@.service"
        "teleport.install"
        "0001-upgrade-libbpfgo-to-0.4.5.patch")

prepare() {
    install -dm755 "${srcdir}/go/src/github.com"

    if [ -d "${srcdir}/${_pkgname}-${pkgver}" ]; then
        rm -Rf "${srcdir}/${_go_srcpath}"
        mv "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_go_srcpath}"
    fi

    if [ -d "${srcdir}/webassets-${_webassets_ref}" ]; then
        rm -Rf "${srcdir}/${_go_srcpath}/webassets"
        mv "${srcdir}/webassets-${_webassets_ref}" "${srcdir}/${_go_srcpath}/webassets"
    fi

    cd "${srcdir}/${_go_srcpath}"
    for f in "${source[@]}"; do
        if [ "${f##*.}" = "patch" ]; then
            msg "Aplying patch: ${f}"
            patch -Np1 -i "${srcdir}/${f}"
        fi
    done
}

build() {
    cd "${srcdir}/${_go_srcpath}"

    export GOPATH="${srcdir}/go"
    export CARGO_HOME="${srcdir}/cargo"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export ADDFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # Build
    PATH="${PATH}:${CARGO_HOME}/bin" make full

    # Make sure go path is writable so it can be cleaned up
    chmod -R u+w "${srcdir}/go"
}

package_teleport() {
    install=teleport.install
    optdepends=('teleport-client: for "tsh" and "tctl" commands')

    cd "${srcdir}/${_go_srcpath}"

    # Install binaries
    install -Dm755 build/teleport "${pkgdir}/usr/bin/teleport"

    # Install services
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/usr/lib/systemd/system/teleport.service"
    install -Dm644 ${srcdir}/teleport@.service "${pkgdir}/usr/lib/systemd/system/teleport@.service"

    # Copy example files
    install -dm755 "${pkgdir}/usr/share/teleport"
    cp -r examples "${pkgdir}/usr/share/teleport/"
}

package_teleport-client() {
    cd "${srcdir}/${_go_srcpath}"

    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"
}
sha512sums=('b9d2ffe5faf7f5d3605361b5c83087de6ce72f813ca641d29b53acdf695f13d7c8b626155bbd0c1f270c7b672057e7bf598257e488bacba71e96b29cb809f5a5'
            '3f1824dcface44de05bb26ba9b5313445e4a532c321bfb59a3a6f29e47e83c1dc9ba7c476b32d1e5bec7c0cd2db87affa1cf108f557f6397748bf48d7f6042b7'
            '409116e201c40b7e0a379b316123500ab7691cbf441ecee048811885f97cd1185671676bb61bf36cb288399e8c0355a0a9f963ce7f94e44ba49e061187c9249e'
            '469249bebaa974e5e205c66c0459ed071b06a35aa9b94a3f34d3cbc5e75aa0f290d70ba8e5c63b49a6319a0f524a846ded459e07e3dde4c260e7668959821b96'
            '439360d3b5132e1307eecc0afa7187edbab63fcfdb5c5b6e4d2ddbe3efbc6ef38f0710f4fdf08d674927a88c80195f3b46f2af26d9f735b1052c5e853ff2ca67'
            '38193a224cac9adef11ccd0bcbb04a4b91a9281864ef7eded64e9e7a8527ce583bd3cb6ab562cdbb69691e025a307a0fc7d85e3452f8ced828130ebeed2b61cb')
