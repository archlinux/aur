# Maintainer: Jedrzej Nowak <pigmej@gmail.com>
# Co-Maintainer: Maarten de Boer <maarten@cloudstek.nl>

pkgname=('teleport' 'teleport-client')
_pkgname=teleport
pkgver=7.2.1
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=('glibc')
makedepends=('go>=1.16.0')
provides=('tctl' 'tsh')

_webassets_ref=07493a5e78677de448b0e35bd72bf1dc6498b5ea

_go_srcpath="go/src/github.com/gravitational"

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gravitational/teleport/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}-webassets-${_webassets_ref}.tar.gz::https://github.com/gravitational/webassets/archive/${_webassets_ref}.tar.gz"
        "teleport.service"
        "teleport@.service"
        "teleport.install"
        "no-bpf.patch"
        "shared-bpf.patch"
        "version-fix.patch")

sha256sums=('8087cb4c6a6725038e4b31f2ec6accd1ba5122b0678db2583d24efe712f497ec'
            '2074ee7e50720f20ff1b4da923434c05f6e1664e13694adde9522bf9ab09e0fd'
            '10ac25cea1b5c193d7f968ca28a1da0e54b847f29c2a0186b46fd853194be38a'
            '4bc17fdde981f91c5d9972ae0555ee5e8b63a6b67e007c28f83ada80823980fd'
            'ce2dd61cae3c0c3684e7e629f98b77551e66ddedca2194250a34f0efbc674f3a'
            '12ba2a2b9d5efd5751799c2a1c3ddefe5aea4daf0f5d38fad4ec7923631e5ec0'
            'e46ee57ae7f877d3ae3650aa4d10146d9e5190ed61b0209849745ea7d8443988'
            '066c64e374afdefdd799daa0e88ae21fef7b290042c5e852c1ec4f8af705fa62')

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
}

build() {
    cd "${srcdir}/${_go_srcpath}"

    export GOPATH="${srcdir}/go"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # Allow linking against shared libbpf
    patch Makefile "${srcdir}/shared-bpf.patch"

    # Comment the line above and uncomment the line below to disable libbpf
    # patch Makefile "${srcdir}/no-bpf.patch"

    # Do not generate version number
    patch Makefile "${srcdir}/version-fix.patch"

    make bpf-bytecode
    make full

    unset GOPATH
}

package_teleport() {
    install=teleport.install
    replaces=('teleport-client')

    cd "${srcdir}/${_go_srcpath}"

    # Install binaries
    install -Dm755 build/teleport "${pkgdir}/usr/bin/teleport"
    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"

    # Install services
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/usr/lib/systemd/system/teleport.service"
    install -Dm644 ${srcdir}/teleport@.service "${pkgdir}/usr/lib/systemd/system/teleport@.service"

    # Copy example files
    install -dm755 "${pkgdir}/usr/share/teleport"
    cp -r examples "${pkgdir}/usr/share/teleport/"
}

package_teleport-client() {
    replaces=('teleport')

    cd "${srcdir}/${_go_srcpath}"

    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"
}
