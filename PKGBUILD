# vim: set ft=sh ts=4 sw=4 et:
# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
# Maintainer: Dan Fuhry <dan@fuhry.com>

pkgname=('teleport' 'teleport-client')
_pkgname=teleport
pkgver=12.2.1
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=('glibc' 'libbpf')
makedepends=('go>=1.17.0' 'rust' 'yarn' 'libbpf-static')
provides=('tctl' 'tsh')

_webassets_ref=8553f8c11de7932b9c347514820f7c95402471d2

_go_srcpath="go/src/github.com/gravitational"

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gravitational/teleport/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}-webassets-${_webassets_ref}.tar.gz::https://github.com/gravitational/webassets/archive/${_webassets_ref}.tar.gz"
        "teleport.service"
        "teleport@.service"
        "teleport.install")

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
sha512sums=('84525ab5bf10a2e74be4b242b138fabb9d9138b2293915b2a21d385cf49c215ad750f36ba6a0a6208edb7b33d95c4a91e9a599180fc63a450f40944448b64bea'
            '3f1824dcface44de05bb26ba9b5313445e4a532c321bfb59a3a6f29e47e83c1dc9ba7c476b32d1e5bec7c0cd2db87affa1cf108f557f6397748bf48d7f6042b7'
            '409116e201c40b7e0a379b316123500ab7691cbf441ecee048811885f97cd1185671676bb61bf36cb288399e8c0355a0a9f963ce7f94e44ba49e061187c9249e'
            '469249bebaa974e5e205c66c0459ed071b06a35aa9b94a3f34d3cbc5e75aa0f290d70ba8e5c63b49a6319a0f524a846ded459e07e3dde4c260e7668959821b96'
            'a0ea7d029567244c4d2c970752955f27d157a848b6567e5521822df4ec7bcd4919436b03a602278681b043476e8171ce1da5e0f2e44d06f2c163cd8e82daab41')
