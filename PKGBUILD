# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="083d69962084a1515b357009bd26407a9c47b67c"
_ssh_agent_rs_commit="802b94ccf2e00ac33a3863300d0769f02b62d807"
pkgname="pam_rssh"
pkgver="1.2.0"
pkgrel="1"
pkgdesc="A PAM module that provides ssh-agent based authentication"
url="https://github.com/z4yx/pam_rssh"
arch=("x86_64")
license=("MIT")
depends=(
  "openssl"
  "pam"
)
makedepends=(
  "git"
  "cargo"
)
source=(
  "${pkgname}::git+https://github.com/z4yx/pam_rssh.git#commit=${_commit}"
  "ssh-agent.rs::git+https://github.com/z4yx/ssh-agent.rs.git#commit=${_ssh_agent_rs_commit}"
)
sha256sums=(
  "SKIP"
  "SKIP"
)

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.dep/ssh-agent.rs.url "${srcdir}/ssh-agent.rs"
  git -c protocol.file.allow=always submodule update
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm0755 target/release/libpam_rssh.so \
    "${pkgdir}/usr/lib/security/pam_rssh.so"
  install -Dm0644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm0644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
