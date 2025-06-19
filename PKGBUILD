_pkgname="veilid"
pkgname="${_pkgname}-git"
pkgver=0.4.7.r13.g24a0987
pkgrel=1
pkgdesc="Veilid headless node"
arch=('x86_64')
url="https://veilid.com"
license=('MPL-2.0')
makedepends=('git' 'cargo')
depends=('gcc-libs' 'glibc')
provides=("veilid=${pkgver%.r*}")
conflicts=('veilid')
options=('!lto') # https://github.com/briansmith/ring/issues/1444

source=("git+https://gitlab.com/${_pkgname}/${_pkgname}.git"
        "${_pkgname}-server.tmpfiles"
        "${_pkgname}-server.sysusers")

sha256sums=('SKIP'
            '4cf75923480b952ba991c56869dce559e500fe3571a343c03a83a790d3a4c73f'
            '2ce72c2aa7799f39d1b6dca3173b12943c551dad615cf4ec21cc03e10890c8e1')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${srcdir}/${_pkgname}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="${srcdir}/${_pkgname}/target"

  cd "${srcdir}/${_pkgname}"
  for component in server cli; do
    (cd "${_pkgname}-${component}"
     cargo build --frozen --release
    )
  done
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${srcdir}/${_pkgname}"
  for component in server cli; do
    (cd "${_pkgname}-${component}"
     cargo test --frozen
    )
  done
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}-server"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}-cli"
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "package/systemd/${_pkgname}-server.service"
  install -Dm0644 -t "${pkgdir}/etc/veilid-server/" "${srcdir}/${_pkgname}/package/linux/veilid-server.conf"
  install -Dm0644 "${srcdir}/${_pkgname}-server.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}-server.conf"
  install -Dm0644 "${srcdir}/${_pkgname}-server.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}-server.conf"
}
