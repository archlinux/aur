# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="24229ff9f592315118410fc5c6e59e9b4fa3f58b"
pkgname="pam_rssh"
pkgver="1.1.0"
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
)
sha256sums=(
  "SKIP"
)

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
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
