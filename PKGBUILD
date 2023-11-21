_pkgname="veilid"
pkgname="${_pkgname}-git"
pkgver=0.2.5.r13.g7d1b789
pkgrel=1
pkgdesc="Veilid headless node"
arch=('x86_64')
url="https://veilid.com"
license=('MPL2')
makedepends=('git' 'cargo' 'protobuf')
depends=()
provides=("veilid=${pkgver%.r*}")
conflicts=('veilid')

source=("git+https://gitlab.com/${_pkgname}/${_pkgname}.git"
        "git+https://gitlab.com/${_pkgname}/cursive.git"
        "git+https://gitlab.com/${_pkgname}/cursive-buffered-backend.git"
        "git+https://gitlab.com/${_pkgname}/cursive-flexi-logger-view.git"
        "git+https://gitlab.com/${_pkgname}/keyring-manager.git"
        "git+https://gitlab.com/${_pkgname}/keyvaluedb.git"
        "git+https://gitlab.com/${_pkgname}/libmdns.git"
        "git+https://gitlab.com/${_pkgname}/mdns.git"
        "git+https://gitlab.com/${_pkgname}/hashlink.git"
        "git+https://gitlab.com/${_pkgname}/rust-igd.git"
        "${_pkgname}-server.service"
        "${_pkgname}-server.tmpfiles"
        "${_pkgname}-server.sysusers")

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e914039d3eab0b94b90b14ee8593fec1992cda4f1870024f7d884098bd43c3ae'
            '4cf75923480b952ba991c56869dce559e500fe3571a343c03a83a790d3a4c73f'
            '2ce72c2aa7799f39d1b6dca3173b12943c551dad615cf4ec21cc03e10890c8e1')

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd ${_pkgname}

  git submodule init
  git config submodule.cursive/cursive.url "${srcdir}/cursive"
  git config submodule.cursive-buffered-backend/cursive-buffered-backend.url "${srcdir}/cursive-buffered-backend"
  git config submodule.cursive-flexi-logger-view/cursive-flexi-logger-view.url "${srcdir}/cursive-flexi-logger-view"
  git config submodule.keyring-manager/keyring-manager.url "${srcdir}/keyring-manager"
  git config submodule.keyvaluedb/keyvaluedb.url "${srcdir}/keyvaluedb"
  git config submodule.libmdns/libmdns.url "${srcdir}/libmdns"
  git config submodule.mdns/mdns.url "${srcdir}/mdns"
  git config submodule.hashlink/hashlink.url "${srcdir}/hashlink"
  git config submodule.rust-igd/rust-igd.url "${srcdir}/rust-igd"
  git -c protocol.file.allow=always submodule update

  # Uncomment this, if the build fails because of the bugsalot crate
  #cargo update
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

pkgver () {
  cd ${_pkgname}
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd ${srcdir}/${_pkgname}
  cargo build --frozen --release # --all-features breaks the build. wait for reply from devs.
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd ${srcdir}/${_pkgname}
  cargo test --frozen --release # --all-features breaks the build. wait for reply from devs.
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}-server"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}-cli"
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${_pkgname}-server.service"
  install -Dm0644 -t "${pkgdir}/etc/veilid-server/" "${srcdir}/${_pkgname}/package/linux/veilid-server.conf"
  install -Dm0644 "${srcdir}/${_pkgname}-server.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}-server.conf"
  install -Dm0644 "${srcdir}/${_pkgname}-server.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}-server.conf"
}
