# vim: set ft=sh ts=4 sw=4 et:
# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
# Maintainer: Dan Fuhry <dan@fuhry.com>

pkgname=('teleport' 'teleport-client')
_pkgname=teleport
pkgver=17.2.9
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('AGPLv3')
depends=('glibc' 'libbpf')
makedepends=('go>=1.17.0' 'rustup' 'yarn' 'libbpf-static>=1.2.0' 'pnpm'
             'python' 'python-setuptools' 'libfido2')
provides=('tctl' 'tsh')

_go_srcpath="go/src/github.com/gravitational"

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gravitational/teleport/archive/refs/tags/v${pkgver}.tar.gz"
        "teleport.service"
        "teleport@.service"
        "teleport.install")


prepare() {
    export CARGO_HOME="${srcdir}/cargo"
    export RUSTUP_HOME="${srcdir}/rustup"

    install -dm755 "${srcdir}/go/src/github.com"

    if [ -d "${srcdir}/${_pkgname}-${pkgver}" ]; then
        rm -Rf "${srcdir}/${_go_srcpath}"
        mv "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_go_srcpath}"
    fi

    cd "${srcdir}/${_go_srcpath}"
    for f in "${source[@]}"; do
        if [ "${f##*.}" = "patch" ]; then
            msg "Applying patch: ${f}"
            patch -Np1 -i "${srcdir}/${f}"
        fi
    done

    RUST_VERSION="$(grep -oP 'RUST_VERSION .= \K[0-9\.]+$' build.assets/versions.mk)"

    rustup install $RUST_VERSION

    mkdir -p "${srcdir}/${_go_srcpath}/build"
}

build() {
    cd "${srcdir}/${_go_srcpath}"

    export GOPATH="${srcdir}/go"
    export CARGO_HOME="${srcdir}/cargo"
    export RUSTUP_HOME="${srcdir}/rustup"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export ADDFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    RUST_VERSION="$(grep -oP 'RUST_VERSION .= \K[0-9\.]+$' build.assets/versions.mk)"
    WASM_PACK_VERSION="$(grep -oP 'WASM_PACK_VERSION .= \K[0-9\.]+$' build.assets/versions.mk)"

    # Install wasm-pack
    rustup run $RUST_VERSION cargo install wasm-pack@$WASM_PACK_VERSION

    # Build
    rustup run $RUST_VERSION \
        env PATH="${PATH}:${CARGO_HOME}/bin" \
        make full

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
    install -Dm755 build/tbot "${pkgdir}/usr/bin/tbot"
    install -Dm755 build/fdpass-teleport "${pkgdir}/usr/lib/teleport/fdpass-teleport"
}
sha512sums=('1b4a08b2d1009747110f38b0c53342f4af9b0b4514443543cc0f8f3816481aafb91f4c592fcb23f6dea67b88940eab7653c1c4b880eaa0986750bfdd6c7747de'
            '409116e201c40b7e0a379b316123500ab7691cbf441ecee048811885f97cd1185671676bb61bf36cb288399e8c0355a0a9f963ce7f94e44ba49e061187c9249e'
            '469249bebaa974e5e205c66c0459ed071b06a35aa9b94a3f34d3cbc5e75aa0f290d70ba8e5c63b49a6319a0f524a846ded459e07e3dde4c260e7668959821b96'
            '8e7092082e0ba074c1f055d895229d8554a3b0f308447ddef9355b18502425ce28392420d22479c1b7d1001a9d0673645a1b4a66ac57c8d1d60df1c2b59bb73d')
