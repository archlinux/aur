# vim: set ft=sh ts=4 sw=4 et:
# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
# Maintainer: Dan Fuhry <dan@fuhry.com>

pkgname=teleport
_pkgname=teleport
pkgver=18.5.1
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('AGPLv3')
depends=('glibc' 'libbpf')
makedepends=('go>=1.17.0' 'rustup' 'yarn' 'libbpf-static>=1.2.0' 'python'
             'python-setuptools' 'libfido2' 'nvm' 'clang' 'llvm')
provides=('tctl' 'tsh' 'teleport-client')
replaces=('teleport-client')
conflicts=('teleport-client')

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

    RUST_VERSION="$(make -s -C build.assets print-rust-version 2>/dev/null)"
    rustup install $RUST_VERSION

    NODE_VERSION="$(make -s -C build.assets print-node-version 2>/dev/null)"
    . /usr/share/nvm/init-nvm.sh
    nvm i "$NODE_VERSION"
    nvm use "$NODE_VERSION"

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

    RUST_VERSION="$(make -s -C build.assets print-rust-version 2>/dev/null)"
    NODE_VERSION="$(make -s -C build.assets print-node-version 2>/dev/null)"
    . /usr/share/nvm/init-nvm.sh
    nvm use "$NODE_VERSION"

    # Install wasm-pack and wasm-bindgen
    rustup run $RUST_VERSION make ensure-wasm-deps FORCE=true

    # Build
    rustup run $RUST_VERSION \
        env PATH="${PATH}:${CARGO_HOME}/bin" \
        make full

    # Make sure go path is writable so it can be cleaned up
    chmod -R u+w "${srcdir}/go"
}

_install_binary() {
    local binary="$1"

    install -Dm755 "build/${binary}" "${pkgdir}/opt/teleport/system/bin/${binary}"
}

package_teleport() {
    install=teleport.install

    cd "${srcdir}/${_go_srcpath}"

    # Install binaries
    _install_binary teleport
    _install_binary tctl
    _install_binary tsh
    _install_binary tbot
    _install_binary fdpass-teleport
    _install_binary teleport-update

    # Install services
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/opt/teleport/system/lib/systemd/system/teleport.service"
    install -Dm644 ${srcdir}/teleport@.service "${pkgdir}/opt/teleport/system/systemd/system/teleport@.service"

    # Copy example files
    install -dm755 "${pkgdir}/usr/share/teleport"
    cp -r examples "${pkgdir}/usr/share/teleport/"
}

sha512sums=('b117fd7238e78af228166b25949e2b6ed2c6d1c66a8a51a3a143d81c2f6461b8e99850157c7184305d6970154cb98e3afaa639b49d5792bd42c7ab72a2533659'
            '409116e201c40b7e0a379b316123500ab7691cbf441ecee048811885f97cd1185671676bb61bf36cb288399e8c0355a0a9f963ce7f94e44ba49e061187c9249e'
            '469249bebaa974e5e205c66c0459ed071b06a35aa9b94a3f34d3cbc5e75aa0f290d70ba8e5c63b49a6319a0f524a846ded459e07e3dde4c260e7668959821b96'
            '71edc21c14d83fec85be730eb6c83c5371932cc08113d0d69167e1bc7a810965b82b3a8591ee7adb3f4b1004db66ee1857350d4fd30a30dcbf20f1146ffdc345')
